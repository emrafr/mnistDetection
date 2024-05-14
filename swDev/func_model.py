from numpy.core.multiarray import dtype
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import random
from fxpmath import Fxp

# Load TFLite model and allocate tensors
interpreter = tf.lite.Interpreter(model_path="tflite_models/mnist_model_quant8.tflite")
interpreter.allocate_tensors()

# Get input and output tensors
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

#Import input data
(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()

#import kernel weights and biases
k_weights = np.load('data/kernel_weights.npy')
conv_bias = np.load('data/conv_bias.npy')

#import fullyconnected weights and biases
fc_weights = np.load('data/fc_weights.npy')
fc_bias = np.load('data/fc_bias.npy')

s1 = 0.003921568859368563
s2 = [0.00178410520311445, 0.006280331872403622, 0.0016178645892068744,
      0.002755468711256981, 0.003810835536569357, 0.0027414553333073854,
      0.007860035635530949, 0.0015236921608448029, 0.007072875741869211,
      0.0021807486191391945, 0.005295490846037865, 0.005888066720217466, 
      0.006459990981966257, 0.00197804206982255, 0.0010106952395290136,
      0.00737148430198431, 0.0020630790386348963, 0.006014148239046335,
      0.006906775292009115, 0.008345353417098522, 0.00643653841689229,
      0.0024638476315885782, 0.00301717733964324, 0.004107179585844278, 
      0.002155835274606943, 0.0018574271816760302, 0.0038521387614309788,
      0.005182135384529829, 0.0010201858822256327, 0.002451169304549694,
      0.0018599851755425334, 0.004750254098325968]
s3 = 0.006686537526547909
s4 = [0.000006996491265454097, 0.00002462875454511959, 0.000006344567282212665, 
      0.000010805760211951565, 0.00001494445405114675, 0.00001075080581358634, 
      0.00003082367038587108, 0.000005975263775326312, 0.000027736768970498815,
      0.0000085519559434033, 0.000020766632587765343, 0.000023090458853403106,
      0.0000253333000728162, 0.000007757028470223304, 0.000003963511062465841,
      0.00002890778341679833, 0.00000809050652605947, 0.00002358489655307494, 
      0.00002708539432205725, 0.00003272687899880111, 0.00002524132833059411,
      0.00000966214793152175, 0.00001183206859423080, 0.00001610658728168346,
      0.00000845425620354944, 0.00000728402847016695, 0.00001510642778157489,
      0.00002032210068136919, 0.00000400072940465179, 0.00000961242949415464,
      0.00000729405974198016, 0.00001862844874267466]
sr = 0.19941511750221252
sw = 0.008124884217977524
si = 0.006686537526547909
sb = 0.00005432734178612009
n_frac = 32

# Print iterations progress
def printProgressBar (iteration, total, prefix = '', suffix = '', decimals = 1, length = 100, fill = '█', printEnd = "\r"):
    percent = ("{0:." + str(decimals) + "f}").format(100 * (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print(f'\r{prefix} |{bar}| {percent}% {suffix}', end = printEnd)
    # Print New Line on Complete
    if iteration == total: 
        print()

def tf_inference(l):   
    correct = 0
    wrong = 0
    for i in range(l):
        input_data = np.expand_dims(x_test[i], axis=0).astype(np.uint8)
        # Preprocess the input data
        input_data = np.expand_dims(input_data, axis=3)  # Add a channel dimension
        input_data = np.float32(input_data) / 255.0  # Scale to [0, 1]

        # Quantize the input data to uint8
        input_data = np.round(input_data / input_details[0]['quantization'][0]).astype(np.uint8)
        input_scale, input_zero_point = input_details[0]['quantization']

        # Set the input tensor
        interpreter.set_tensor(input_details[0]['index'], input_data)

        # Run inference
        interpreter.invoke()

        # Get the output tensor
        output_data = interpreter.get_tensor(output_details[0]['index']).argmax()
        y_true = y_test[i]

        if output_data == y_true:
            correct = correct + 1
        else:
            wrong = wrong + 1
    print(correct, wrong)

def extractintM(s1,s2,s3,s4,sr,sw,si,sb, n_frac):
    m1 = np.zeros(shape=(1,32))
    m2 = np.zeros(shape=(1,32))
    for i in range(32):
        m1[0,i] = s1*s2[i]/s3
        m2[0,i] = s4[i]/s3
    for k in range(32): 
        m1f = Fxp(m1[0,i], signed=False, n_word=n_frac, n_frac=n_frac)
        m2f = Fxp(m2[0,i], signed=False, n_word=n_frac, n_frac=n_frac)
        m1[0,k] = np.int32(int(m1f.bin(),2))
        m2[0,k] = np.int32(int(m2f.bin(),2))
    m3 = sw*si/sr
    m4 = sb/sr
    m3f = Fxp(m3, signed=False, n_word=n_frac, n_frac=n_frac)
    m4f = Fxp(m4, signed=False, n_word=n_frac, n_frac=n_frac)
    m3 = np.int32(int(m3f.bin(),2))
    m4 = np.int32(int(m4f.bin(),2))
    return [m1,m2,m3,m4]

def conv(I, K, bias,m1,m2):
    res = np.zeros(shape=(1,26,26,32), dtype=np.int32)
    for k in range(0,32):
        for i in range(0,26):
            for j in range(0,26):
                for m in range(0,3):
                    for n in range(0,3):
                        res[0,i,j,k] = res[0,i,j,k] + I[0,i+m, j+n, 0]*K[k,m,n,0]
                        #res[0,i,j,k] = res[0,i,j,k] + (I[0,i+m, j+n, 0].astype(dtype=np.int32))*K[k,m,n,0].astype(dtype=np.int32)
        res[0,:,:,k] =m1[0,k]*2**(-n_frac)*(res[0,:,:,k] + bias[k])
    return res

def casttoint8(matrix):
    output = np.zeros(shape=(1,26,26,32), dtype=np.int8)
    for k in range(0,32):
        for i in range(0,26):
            for j in range(0,26):
                if matrix[0,i,j,k]<-128:
                    output[0,i,j,k] = -128
                elif matrix[0,i,j,k]>127:
                    output[0,i,j,k] = 127
                else:
                    output[0,i,j,k] = matrix[0,i,j,k].astype(dtype=np.int8)
    return output

def casttouint8(matrix):
    output = np.zeros(10)
    matrix = matrix 
    for i in range(10):
        if matrix[i]<0:
            output[i] = 0
        elif matrix[i]>255:
            output[i] = 255
        else:
            output[i] = matrix[i].astype(dtype=np.uint8)
    return output

def relu(input):
    output = np.zeros(shape=(1,26,26,32), dtype=np.int8)
    for f in range(32):
        for i in range(26):
            for j in range(26):
                if input[0,i,j,f] > 0:
                    output[0,i,j,f] = input[0,i,j,f]
                else:
                    output[0,i,j,f] = 0
    return output

def maxPool(input):
    max_pool = np.zeros(shape=(1,13,13,32), dtype=np.int8)
    for f in range(32):
        for i in range(0,26,2):
            for j in range(0,26,2):
                max = input[0,i:i+2,j:j+2,f].max()
                max_pool[0,int(i/2),int(j/2),f] = max
    return max_pool

def reshape(input):
    output = input.flatten()
    return output

def fc_layer(input,weights,bias,m3,m4):
    res = np.zeros(10, dtype=np.int32)
    res2 = np.zeros(10, dtype=np.int32)
    for k in range(10):
        for j in range(5408):
            res[k] = res[k] + weights[k,j].astype(dtype=np.int32)*(input[j].astype(dtype=np.int32))
        res2[k] = m3*2**(-n_frac)*((res[k]) + bias[k])
    return res2

def calculateaw(weights):
    aw = np.zeros(10, dtype=np.int8)
    for k in range(10):
        for j in range(5408):
            aw[k] = aw[k] + weights[k,j]
    return aw

def softmax(input):
    output = np.zeros(10)
    sum = 0
    for i in range(10):
        sum  =  sum + np.exp(input[i])
    for i in range(10):
        output[i] = np.exp(input[i])/sum
    return output


def inference(input_data, k_weights,conv_bias,vec, fc_weights, fc_bias, i):

    post_conv = conv(input_data, k_weights, conv_bias, vec[0],vec[1]) 

    post_zero = post_conv

    output_int8 = casttoint8(post_zero)

    post_relu = relu(output_int8)

    post_maxpool = maxPool(post_relu)

    post_reshape = reshape(post_maxpool)

    post_reshape = post_reshape

    post_fc = fc_layer(post_reshape, fc_weights, fc_bias, vec[2],vec[3])

    post_zero_fc = post_fc

    post_cast_uint8 = casttouint8(post_zero_fc)

    post_softmax = softmax(post_cast_uint8)

    predicted = post_cast_uint8.argmax()
    y_true = y_test[i]
    return {'predicted':predicted,'y_true':y_true, 'post_conv':post_conv, 'output_int8':output_int8, 'post_relu':post_relu, 'post_maxpool':post_maxpool, 'post_fc':post_fc, 'post_zero_fc':post_zero_fc, 'post_cast_uint8': post_cast_uint8, 'post_softmax':post_softmax}

def runMultipleInference(l):
    input_dataset = np.expand_dims(x_test[:l], axis=0).astype(np.uint8)
    input_dataset  = np.expand_dims(input_dataset, axis=4)  # Add a channel dimension
    correct = 0
    wrong = 0
    l = l
    printProgressBar(0, l, prefix = 'Progress:', suffix = '', length = 50)
    for i in range(l):
        input_data = input_dataset[:,i,:,:,:]
        result = inference(input_data, k_weights, conv_bias,vec,fc_weights,fc_bias, i)
        if result.get('predicted') == result.get('y_true'):
            correct = correct + 1
        else:
            wrong = wrong + 1
        printProgressBar(i + 1, l, prefix = 'Progress:', suffix = '', length = 50)
    print(correct, wrong)

def runRandomInference():
    image_index = random.randint(0,10000)
    input_data = np.expand_dims(x_test[image_index], axis=0).astype(np.uint8)
    input_data = np.expand_dims(input_data, axis=3)  # Add a channel dimension
    
    result = inference(input_data, k_weights, conv_bias,vec,fc_weights,fc_bias, image_index)

    print(result.get('post_conv')[0,:,:,0])
    print(result.get('post_relu')[0,:,:,0])
    print(result.get('output_int8')[0,:,:,0])
    print(result.get('post_zero_fc'))
    print(result.get('post_cast_uint8'))
    fig, ax = plt.subplots(2, 2)
    ax[0,0].imshow(input_data[0,:,:,0], cmap='gray')
    ax[0,0].axis('off')
    ax[0,0].set_title('Input image')
    ax[0,1].imshow(result.get('post_relu')[0,:,:,0], cmap='grey')
    ax[0,1].axis('off')
    ax[0,1].set_title('Post relu')
    ax[1,0].imshow(result.get('post_maxpool')[0,:,:,0], cmap='grey')
    ax[1,0].axis('off')
    ax[1,0].set_title('Post max pool')

    ax[1,1].bar(range(10), result.get('post_softmax').squeeze())
    ax[1,1].set_xlabel('Digit')
    ax[1,1].set_xticks([0,1,2,3,4,5,6,7,8,9])
    ax[1,1].set_ylabel('Probability')
    ax[1,1].set_title('Output probabilities')
    plt.show()

def runOneInference():
    image_index = 1
    #input_data = np.expand_dims(x_test[image_index], axis=0).astype(np.uint8)
    #input_data = np.expand_dims(input_data, axis=3)  # Add a channel dimension
    input_data = np.zeros((1,28, 28,1), dtype=np.uint8)
    input_data[:,:, 3::4,:] = np.arange(1, 197).reshape(1,28,7,1)
    #print(matrix[0,:,:,0])
    
    result = inference(input_data, k_weights, conv_bias,vec,fc_weights,fc_bias, image_index)
    for r in range(28):
        for c in range(28):
            input = Fxp(input_data[0,r,c,0], signed=False, n_word=8, n_frac=0)
            input_bin = input.bin()
            #print(input_bin, end='')
        #print('')
    print(input_data[0,:,:,0])
    print(result.get('post_relu')[0,:,:,0])
   
vec = extractintM(s1,s2,s3,s4,sr,sw,si,sb, n_frac)
#print(vec[0])
#runOneInference()
#runMultipleInference(10)
#tf_inference(10)

import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import random


#Import input data
(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
image_index = random.randint(0,10000)
input_data = np.expand_dims(x_test[image_index], axis=0).astype(np.uint8)

input_data = np.expand_dims(input_data, axis=3)  # Add a channel dimension
print(np.shape(input_data))
print(type(input_data[0,0,0,0]))

#import kernel weights and biases
k_weights = np.load('data/kernel_weights.npy')
conv_bias = np.load('data/conv_bias.npy')
print("k_weights shape: ", np.shape(k_weights[:,:,:,:]))
print("k_weights type: ",type(k_weights[0,0,0,0]))
print("conv_bias shape: ", np.shape(conv_bias))
print("conv_bias type: ",type(conv_bias[0]))

#import fullyconnected weights and biases
fc_weights = np.load('data/fc_weights.npy')
fc_bias = np.load('data/fc_bias.npy')
print("fc_weights shape: ", np.shape(fc_weights))
print("fc_weights type: ", type(k_weights[0,0,0,0]))
print("fc_bias shape: ", np.shape(fc_bias))
print("fc_bias type: ", type(conv_bias[0]))

s1 = 0.003921568859368563
s2 = [0.00178410520311445, 0.006280331872403622, 0.0016178645892068744,
      0.002755468711256981, 0.003810835536569357, 0.0027414553333073854,
      0.007860035635530949, 0.0015236921608448029, 0.007072875741869211,
      0.0021807486191391945, 0.005295490846037865, 0.005888066720217466, 
    0.006459990981966257, 0.00197804206982255, 
 0.0010106952395290136,  0.00737148430198431,
 0.0020630790386348963, 0.006014148239046335,
 0.006906775292009115, 0.008345353417098522, 
 0.00643653841689229, 0.0024638476315885782, 
 0.00301717733964324, 0.004107179585844278, 
 0.002155835274606943, 0.0018574271816760302,
 0.0038521387614309788,  0.005182135384529829, 
 0.0010201858822256327, 0.002451169304549694, 
0.0018599851755425334, 0.004750254098325968]
s3 = 0.006686537526547909
def extract intM(s1,s2,s3):
    m = [for i in s2 s1*i/s3]
    for i in range(32):
        m[i] = s1*s2[i]/s3
    m*2**9



def conv(I, K):
    res = np.zeros(shape=(1,26,26), dtype=np.int32)
    for i in range(0,26):
        for j in range(0,26):
            for m in range(0,3):
                for n in range(0,3):
                    res[0,i,j] = res[0,i,j] + I[i+m, j+n, 0]*K[2-m,2-n,0]
    return res

def relu(input):
    output = np.zeros(shape=(1,26,26,32), dtype=np.int32)
    for f in range(32):
        for i in range(26):
            for j in range(26):
                if input[0,i,j,f] > 0:
                    output[0,i,j,f] = input[0,i,j,f]
                else:
                    output[0,i,j,f] = 0
    return output

def maxPool(input):
    max_pool = np.zeros(shape=(1,13,13,32), dtype=np.int32)
    for f in range(32):
        for i in range(0,26,2):
            for j in range(0,26,2):
                max = input[0,i:i+2,j:j+2,f].max()
                max_pool[0,int(i/2),int(j/2),f] = max
    return max_pool

def reshape(input):
    output = input.flatten()
    return output

def fc_layer(input,weights,bias):
    output = np.matmul(weights, input.T) + bias 

    return output

def softmax(input):
    output = np.exp(input)/sum(np.exp(input))
    return output

#def quantize(input):
 #   return output

#create feture matrix
S = np.zeros(shape=(1,26,26,32), dtype=np.int32)

#Perfrome convulution for 32 kernel matrices
for k in range(0,32):
    S[:,:,:,k] = conv(input_data[0,:,:,:],k_weights[k,:,:,:]) + conv_bias[k]
print(np.shape(S))

#Apply relu func
post_relu = relu(S)

#Perform maxPool
post_maxpool = maxPool(post_relu)

#Reshape
post_reshape = reshape(post_maxpool)

#Feed trough fullyconnected layer
post_fc = fc_layer(post_reshape, fc_weights, fc_bias)
print(post_fc)
#Apply softmax
post_softmax = softmax(post_fc)
print(post_softmax)
print(y_test[image_index])

#Quantize output
#q_output = quantize(post_softmax)


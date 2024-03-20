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
print("k_weights shape: ", np.shape(k_weights[0,:,:,:]))
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


def conv(I, K):
    res = np.zeros(shape=(1,26,26), dtype=np.int32)
    for i in range(0,26):
        for j in range(0,26):
            for m in range(0,3):
                for n in range(0,3):
                    res[0,i,j] = res[0,i,j] + I[i+m, j+n, 0]*K[m,n,0]
    return res

def relu(input):
    return output

def maxPool(input):
    return max_pool

def fc_layer(input,weights,bias):
    return output

def softmax(input):
    return output

def quantize(input):
    return output

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

#Feed trough fullyconnected layer
post_fc = fc_layer()

#Apply softmax
post_softmax = softmax(post_fc)

#Quantize output
q_output = quantize(post_softmax)


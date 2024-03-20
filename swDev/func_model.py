import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import random
#test
# Load TFLite model and allocate tensors
interpreter = tf.lite.Interpreter(model_path="tflite_models/mnist_model_quant8.tflite")
interpreter.allocate_tensors()

# Get input and output tensors
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
image_index = random.randint(0,10000)
input_data = np.expand_dims(x_test[image_index], axis=0).astype(np.uint8)

# Preprocess the input data
input_data = np.expand_dims(input_data, axis=3)  # Add a channel dimension
input_data = np.float32(input_data) / 255.0  # Scale to [0, 1]

# Quantize the input data to uint8
input_data = np.round(input_data / input_details[0]['quantization'][0]).astype(np.uint8)
input_scale, input_zero_point = input_details[0]['quantization']

def conv(I, K):
    S = np.zeros(shape=(26,26))
    for i in range(0,26):
        for j in range(0,26):
            for m in range(0,3):
                for n in range(0,3):
                    S(i,j) = S(i,j) + I(i+m, j+n)*K(m,n)
    return S
def __init__():
    bias = biases(shape=(32))
    K = shape(32,3,3)
    S = np.zeros(shape=(26,26,32))
    for k in range(0,32):
        S(:,:,k) = conv(I,K(k,:,:)) + biases(k)


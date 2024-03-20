
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import random

# Load TFLite model and allocate tensors
interpreter = tf.lite.Interpreter(model_path="tflite_models/mnist_model_quant8.tflite")
interpreter.allocate_tensors()

# Get input and output tensors
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

def conv(I, K):
    S = np.zeros(shape=(32,26,26,1))
    for m in range(0,3):
        for n in range(0,3):
            S(i,j) = S(i,j) + I(i)


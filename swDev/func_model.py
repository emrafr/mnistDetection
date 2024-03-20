
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
print(input_details)
print(output_details)
print(interpreter)

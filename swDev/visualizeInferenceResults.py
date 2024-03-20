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

# Load an input image from the dataset
(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
image_index = random.randint(0,10000)
input_data = np.expand_dims(x_test[image_index], axis=0).astype(np.uint8)

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
output_data = interpreter.get_tensor(output_details[0]['index'])

# Postprocess the output data
output_scale, output_zero_point = output_details[0]['quantization']
output_data = (output_data - output_zero_point) * output_scale

# Print the classification results
print("Prediction:", np.argmax(output_data))

# Plot the input image and the output probabilities
fig, (ax1, ax2) = plt.subplots(1, 2)
ax1.imshow(x_test[image_index], cmap='gray')
ax1.axis('off')
ax1.set_title('Input image')
ax2.bar(range(10), output_data.squeeze())
ax2.set_xlabel('Digit')
ax2.set_ylabel('Probability')
ax2.set_title('Output probabilities')
plt.show()

import func_model as fm
from numpy.core.multiarray import dtype
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import random

def write_binary_numbers(filename, filename2):

    image_index = 1
    input_data = np.expand_dims(fm.x_test[image_index], axis=0).astype(np.uint8)
    input_data = np.expand_dims(input_data, axis=3)  # Add a channel dimension
    
    result = fm.inference(input_data, fm.k_weights, fm.conv_bias,fm.vec,fm.fc_weights,fm.fc_bias, image_index)

    input_list = [[''] * 4 for i in range(196)]
    input_data2 = input_data.reshape(1,196,4,1)
    for r in range(196):
        for c in range(4):
            input_list[r][c] = format(input_data2[0,r,c,0], '08b')

    with open(filename, 'w') as file:
        for i in range(196):
            file.write(''.join(input_list[i][:])+ '\n')

    post_relu = result.get('post_relu')[0,:,:,0]
    print(np.dtype(post_relu[0,0]))
    post_relu = np.c_[post_relu, np.zeros(26), np.zeros(26)]
    post_relu = post_relu.astype('uint8').reshape(182,4)
    output_list = [[''] * 4 for i in range(182)]
    print(np.shape(post_relu))
    for r in range(182):
        for c in range(4):
            output_list[r][c] = format(post_relu[r,c], '08b')

    with open(filename2, 'w') as file:
        for i in range(182):
            file.write(''.join(output_list[i][:])+ '\n')
if __name__ == "__main__":
    write_binary_numbers("stimuli_data/lal_input.txt", "stimuli_data/lal_output.txt")
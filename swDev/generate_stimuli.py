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

def write_binary_numbers2(filename, filename2, filename3):

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


    post_relu = result.get('post_relu')[0,:,:,:]
    #post_relu = post_relu.astype('uint8').reshape(182,4)
    output_list = [[''] * 32 for i in range(676)]
    output_list2 = [[''] * 32 for i in range(676)]

    print(np.shape(post_relu))
    r = 0
    for i in range(26):
        for j in range(26):
            for c in range(32):
                output_list[r][c] = format(post_relu[i,j,c], '08b')
                output_list2[r][c] = format(post_relu[i,j,c], '02x') + ' '
            r += 1

    with open(filename2, 'w') as file:
        for i in range(676):
            file.write(''.join(output_list[i][:])+ '\n')
    with open(filename3, 'w') as file:
        for i in range(676):
            file.write(''.join(output_list2[i][:])+ '\n')

def generate_fc(filename1, filename2):

    image_index = 1
    input_data = np.expand_dims(fm.x_test[image_index], axis=0).astype(np.uint8)
    input_data = np.expand_dims(input_data, axis=3)  # Add a channel dimension
    
    result = fm.inference(input_data, fm.k_weights, fm.conv_bias,fm.vec,fm.fc_weights,fm.fc_bias, image_index)
    post_maxpool = result.get('post_maxpool')[0,:,:,:]
    post_cast_uint8 = result.get('post_cast_uint8').astype(dtype=np.uint8)

    input_list = [[''] * 32 for i in range(169)]
    print(np.shape(post_maxpool))
    r = 0
    for i in range(13):
        for j in range(13):
            for c in range(32):
                input_list[r][c] = format(post_maxpool[i,j,c], '08b')
            r += 1
    
    output_list = ['' for i in range(10)]
    for i in range(10):
        output_list[i] = format(post_cast_uint8[i], '08b')

    with open(filename1, 'w') as file:
        for i in range(169):
            file.write(''.join(input_list[i][:])+ '\n')
    
    with open(filename2, 'w') as file:
        for i in range(10):
            file.write(''.join(output_list[i])+ '\n')

if __name__ == "__main__":
   # write_binary_numbers2("stimuli_data/full_conv_input.txt", "stimuli_data/full_conv_output.txt", "stimuli_data/full_conv_output_hex.txt")
    generate_fc("stimuli_data/fc_input.txt", "stimuli_data/fc_output.txt")
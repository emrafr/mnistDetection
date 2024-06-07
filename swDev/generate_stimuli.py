import func_model as fm
from numpy.core.multiarray import dtype
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import random

def write_binary_numbers2(filename, filename2):

    image_index = random.randint(0,10000)
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
    output_list = [[''] * 32 for i in range(676)]
    r = 0
    for i in range(26):
        for j in range(26):
            for c in range(32):
                output_list[r][c] = format(post_relu[i,j,c], '08b')
            r += 1

    with open(filename2, 'w') as file:
        for i in range(676):
            file.write(''.join(output_list[i][:])+ '\n')
    print(result.get('predicted'))

def generate_fc(filename1, filename2):

    image_index = 3
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

def generate_fc_weights(filename1, filename2):

    image_index = 1
    input_data = np.expand_dims(fm.x_test[image_index], axis=0).astype(np.uint8)
    input_data = np.expand_dims(input_data, axis=3)  # Add a channel dimension
    
    weights = fm.fc_weights

    input_list = [[''] * 5408 for i in range(10)]
    input_list2 = [[''] * 5408 for i in range(10)]

    r = 0
    for r in range(10):
        for c in range(5408):
            input_list[r][c] = np.binary_repr(weights[r,c], width=8)
            input_list2[r][c] = np.binary_repr(weights[r,c], width=8) + ' '

    
    with open(filename1, 'w') as file:
        for i in range(10):
            file.write(''.join(input_list[i][:])+ '\n')
    
    with open(filename2, 'w') as file:
        for i in range(10):
            file.write(''.join(input_list2[i])+ '\n')

def generate_mp(filename1, filename2, filename3):

    image_index = 1
    input_data = np.expand_dims(fm.x_test[image_index], axis=0).astype(np.uint8)
    input_data = np.expand_dims(input_data, axis=3)  # Add a channel dimension
    
    result = fm.inference(input_data, fm.k_weights, fm.conv_bias,fm.vec,fm.fc_weights,fm.fc_bias, image_index)
    post_relu = result.get('post_relu')[0,:,:,:]
    post_mp = result.get('post_maxpool')[0,:,:,:]

    input_list = [[''] * 32 for i in range(676)]
    output_list = [[''] * 4 for i in range(1352)]
    output_list2 = [[''] * 8 for i in range(676)]

    r = 0
    for i in range(26):
        for j in range(26):
            for c in range(32):
                input_list[r][c] = format(post_relu[i,j,c], '08b')
            r += 1
    
    r = 0
    cl = 0
    for i in range(13):
        for j in range(13):
            for c in range(8):
                for k in range(4):
                    output_list[r][k] = format(post_mp[i,j,cl], '08b')
                    cl += 1
                r += 1
            cl = 0
    
    r = 0
    cl = 0
    for i in range(13):
        for j in range(13):
            for c in range(4):
                for k in range(8):
                    output_list2[r][k] = format(post_mp[i,j,cl], '08b')
                    cl += 1
                r += 1
            cl = 0


    with open(filename1, 'w') as file:
        for i in range(676):
            file.write(''.join(input_list[i][:])+ '\n')

    with open(filename2, 'w') as file:
        for i in range(1352):
            file.write(''.join(output_list[i][:])+ '\n')

    with open(filename3, 'w') as file:
        for i in range(676):
            file.write(''.join(output_list2[i][:])+ '\n')

if __name__ == "__main__":
    write_binary_numbers2("stimuli_data/full_conv_input2.txt", "stimuli_data/full_conv_output2.txt")
    #generate_fc("stimuli_data/fc_input.txt", "stimuli_data/fc_output.txt")
    #generate_fc_weights("stimuli_data/fc_weights.txt", "stimuli_data/fc_weights_wspaces.txt")
    #generate_mp("stimuli_data/mp_input.txt", "stimuli_data/mp_output.txt", "stimuli_data/mp_output2.txt")
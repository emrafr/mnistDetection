import numpy as np
import func_model as fm

def write_kernel_code(filename):
    k_weights = np.load('data/kernel_weights.npy')
    conv_bias = np.load('data/conv_bias.npy')
    m1 = fm.extractintM(fm.s1, fm.s2, fm.s3, fm.s4, fm.sr, fm.sw, fm.si, fm.sb, fm.n_frac)[0] 
    with open(filename, 'w') as file:
        for i in range(32):
            kern = k_weights[i,:,:,0].reshape(1,9)
            file.write(f'kernel_{i+1} : kernel_multiplier\ngeneric map(\n')
            file.write(f'\tFILE_NAME => "conv_weights{i+1}.txt",\n')
            file.write(f'\tbias => TO_SIGNED({conv_bias[i]}, 32)\n')
            file.write(f')\nport map(\n')
            file.write(f'\tclk => clk,\n')
            file.write(f'\treset => reset,\n')
            file.write(f'\tinput => input_kernel,\n')
            file.write(f'\toutput => output_k{i+1}\n')
            file.write(f');\n\n')

def write_kernel_weights(filename):
    k_weights = np.load('data/kernel_weights.npy')
    for j in range(32):
        filename2 = filename + f'{j+1}.txt'
        with open(filename2, 'w') as file:
            kern = k_weights[j,:,:,0].reshape(1,9)
            for i in range(9):
                file.write( np.binary_repr(kern[0,i], width=8) + f'\n')
        filename2 =''

    with open('all_kernel_weights.txt', 'w') as file:
        for k in range(32):
            file.write( f'kernel{k+1} :  ')
            for r in range(3):
                for c in range(3):
                    file.write(str(k_weights[k,r,c,0]) + f'\t:')
            file.write(f'\n\n')
    
def write_mp_code(filename):
    with open(filename, 'w') as file:
        for i in range(32):
            file.write(f'maxpool_inst{i+1} : maxpool\n')
            file.write(f'port map(\n')
            file.write(f'\tclk => s00_axis_aclk,\n')
            file.write(f'\treset => s00_axis_aresetn,\n')
            file.write(f'\tvalid_input => valid_rows{(i)//4 + 1},\n')
            file.write(f'\tmp_input => rows{i+1},\n')
            file.write(f'\tmp_output => mp_output{i+1},\n')
            file.write(f'\tready => mp_ready{i+1},\n')
            file.write(f'\tvalid_output => valid_output{i+1}\n')
            file.write(f');\n\n')

if __name__ == "__main__":
    write_kernel_weights("gen_code/conv_weights")
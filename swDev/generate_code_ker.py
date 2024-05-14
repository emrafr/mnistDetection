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
            for j in range(9):
                file.write(f'\tw{j+1} => TO_SIGNED({kern[0,j]}, 8),\n')
            file.write(f'\tscale => TO_UNSIGNED({round(m1[0,i])}, 32),\n')
            file.write(f'\tbias => TO_SIGNED({conv_bias[i]}, 32)\n')
            file.write(f')\nport map(\n')
            file.write(f'\tclk => clk,\n')
            file.write(f'\treset => reset,\n')
            file.write(f'\tinput => input_kernel,\n')
            file.write(f'\toutput => output_k{i+1}\n')
            file.write(f');\n\n')

if __name__ == "__main__":
    write_kernel_code("gen_code/kernel_code.txt")
import numpy as np
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
    write_mp_code("gen_code/mp_code.txt")

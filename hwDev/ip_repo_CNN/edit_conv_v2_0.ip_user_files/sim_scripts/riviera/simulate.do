transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+conv_v2_0  -L xil_defaultlib -L secureip -O5 xil_defaultlib.conv_v2_0

do {conv_v2_0.udo}

run 1000ns

endsim

quit -force

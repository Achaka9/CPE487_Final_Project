# Memory Tracker #
### 1. Create a new RTL project vgaball in Vivado Quick Start ###

* Create five new source files of file type VHDL called clk_wiz_0, clk_wiz_0_clk_wiz, vga_sync, ball, and vga_top
* Create a new constraint file of file type XDC called vga_top
* Choose Nexys A7-100T board for the project
* Click 'Finish'
* Click design sources and copy the VHDL code from clk_wiz_0.vhd, clk_wiz_0_clk_wiz.vhd, vga_sync.vhd, ball.vhd, and vga_top.vhd
* Click constraints and copy the code from vga_top.xdc

### 2. Run synthesis ###
### 3. Run implementation and open implemented design ###
### 4. Generate bitstream, open hardware manager, and program device ###

* Click 'Generate Bitstream'
* Click 'Open Hardware Manager' and click 'Open Target' then 'Auto Connect'
* Click 'Program Device' then xc7a100t_0 to download vga_top.bit to the Nexys A7 board

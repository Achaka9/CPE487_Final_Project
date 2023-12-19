# Memory Tracker #

* The project we created is a tracker on the nexys board that uses the 16 lights on the bottom of the board to record memory
* Holding BTNU, the user can move whatever switch they like in whatever order they like.
* After letting go of BTNU, pressing BTNC initiates the board to play the sequence of switches done by the user through green lights, ending in the last switch done. 
* The user can then go back and record with BTNU again, without re-running the code, by playing around with the switches with the button held down.

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

## Modifications ##
* We did not continue implementing onto another lab previously completed. This code was created from scratch.
* We used a Moore FSM to create this code

## Summary ##
* To create this code we used a moore fsm
* The process checks the current state (currentState), performs actions based on that state, and determines the next state (nextState) based on input conditions
* The code then checks if BTNU is pressed. If pressed, the board will record the order the light switches are pushed
* Once the button is let go The board records the order
* Once BTNC is pressed then the order that was recorded plays using the leds above the switches
* Zeyad created the Moore FSM and Adil created the memory logic and connection to the switches and led's on the board

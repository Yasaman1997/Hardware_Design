@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 29cfd45e58294dbdafda2f4482031b22 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Counter_behav xil_defaultlib.Counter -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

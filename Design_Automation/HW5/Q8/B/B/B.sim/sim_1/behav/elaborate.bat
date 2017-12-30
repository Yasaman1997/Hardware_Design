@echo off
set xv_path=D:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 128cae2b725847ac870b6264c1c8ff24 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Test_behav xil_defaultlib.Test -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

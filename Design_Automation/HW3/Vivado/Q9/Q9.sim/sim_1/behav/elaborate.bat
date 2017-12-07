@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 9dd7012e1d13495682ba341930f0fbe7 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot frequency_behav xil_defaultlib.frequency -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

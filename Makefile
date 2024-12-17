all:cp_src_rtl connect_files remove_auto 

cp_src_rtl:
	rm -rf ./rtl_connected/*.v
	cp -f  ./rtl_auto_connect/*.v ./rtl_connected/

connect_files:
	emacs --batch ./rtl_connected/rcc_sys_clk_rst_ctrl.v	-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vcore_top.v					-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vdd_reg.v						-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vdd_top.v						-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vsw_reg.v						-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vsw_top.v						-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_top.v								-f  verilog-batch-auto

remove_auto :
	sed -i 's/\/\*AUTO.*\*\///g' ./rtl_connected/rcc_sys_clk_rst_ctrl.v  
	sed -i 's/\/\*AUTO.*\*\///g' ./rtl_connected/rcc_vcore_top.v					
	sed -i 's/\/\*AUTO.*\*\///g' ./rtl_connected/rcc_vdd_reg.v						
	sed -i 's/\/\*AUTO.*\*\///g' ./rtl_connected/rcc_vdd_top.v						
	sed -i 's/\/\*AUTO.*\*\///g' ./rtl_connected/rcc_vsw_reg.v						
	sed -i 's/\/\*AUTO.*\*\///g' ./rtl_connected/rcc_vsw_top.v						
	sed -i 's/\/\*AUTO.*\*\///g' ./rtl_connected/rcc_top.v

indent_files:
	emacs --batch ./rtl_connected/rcc_sys_clk_rst_ctrl.v  -f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vcore_top.v					-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vdd_reg.v						-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vdd_top.v						-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vsw_reg.v						-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vsw_top.v						-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_top.v								-f  verilog-batch-indent
	
vim_auto:
	vim -c "source ~/.vim/plugin/automatic-verilog-master-plugin/automatic.vim" -c"edit rcc_sys_clk_gen.v" -c "call AutoWire()" -c "wq"

inject_auto_files:
	emacs --batch ./rtl_connected/rcc_sys_clk_rst_ctrl.v 		-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vcore_top.v					-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vdd_reg.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vdd_top.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vsw_reg.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vsw_top.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_top.v								-f  verilog-batch-inject-auto

gen_rtl_zip: all
	rm -rf rtl_connected.zip
	cp *dc rtl_connected/
	zip -r rtl_connected.zip rtl_connected/
	rm -rf rtl_connected/*dc
	cp rtl_connected.zip /mnt/d/各类资料/实验室/RCC学习/rtl/
	

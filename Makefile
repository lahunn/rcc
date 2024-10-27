all:cp_src_rtl connect_files auto_declare remove_auto 

cp_src_rtl:
	cp -f ./rtl_auto_connect/*.v ./rtl_connected/

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

auto_declare:
	~/script/verilog_process/print_declare.sh ./rtl_connected/rcc_sys_clk_gen.v
	
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
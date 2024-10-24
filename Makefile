all:cp_src_rtl connect_files

cp_src_rtl:
	cp -f ./rtl_auto_connect/*.v ./rtl_connected/

connect_files:
	emacs --batch ./rtl_connected/rcc_vcore_clk_ctrl.v		-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vcore_rst_ctrl.v		-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vcore_top.v					-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vdd_reg.v						-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vdd_top.v						-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vsw_reg.v						-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_vsw_top.v						-f  verilog-batch-auto
	emacs --batch ./rtl_connected/rcc_top.v								-f  verilog-batch-auto

indent_files:
	emacs --batch ./rtl_connected/rcc_vcore_clk_ctrl.v		-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vcore_rst_ctrl.v		-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vcore_top.v					-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vdd_reg.v						-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vdd_top.v						-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vsw_reg.v						-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_vsw_top.v						-f  verilog-batch-indent
	emacs --batch ./rtl_connected/rcc_top.v								-f  verilog-batch-indent

inject_auto_files:
	emacs --batch ./rtl_connected/rcc_vcore_clk_ctrl.v		-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vcore_rst_ctrl.v		-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vcore_top.v					-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vdd_reg.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vdd_top.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vsw_reg.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vsw_top.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_top.v								-f  verilog-batch-inject-auto
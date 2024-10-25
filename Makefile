all:cp_src_rtl connect_files auto_declare

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

auto_declare:
	vim -U NONE -c "source ~/.vim/plugin/automatic-verilog-master-plugin/automatic.vim" -c"edit ./rtl_connected/rcc_vcore_clk_ctrl.v" -c "call AutoWire()" -c "wq" &

inject_auto_files:
	emacs --batch ./rtl_connected/rcc_vcore_clk_ctrl.v		-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vcore_rst_ctrl.v		-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vcore_top.v					-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vdd_reg.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vdd_top.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vsw_reg.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_vsw_top.v						-f  verilog-batch-inject-auto
	emacs --batch ./rtl_connected/rcc_top.v								-f  verilog-batch-inject-auto
COMP = iverilog
RUN = vvp
WAVE = gtkwave

SYNTH = yosys
SCRIPT = yos.ys

RENAME = sed

COND = loop_limit
ESTR = loop_limit_synth
TEST = test
TEST_BENCH = test_bench

SIGNALS = loop_limit.vcd
TARGET = loop_limit_vis.gtkw

synth:
	$(SYNTH) $(SCRIPT)
	
sed:
	$(RENAME) -i 's/demux_32_8_cond/demux_32_8_synth/' $(ESTR).v
	$(RENAME) -i 's/valid_out_c/valid_out_e/' $(ESTR).v
	$(RENAME) -i 's/data_out_c/data_out_e/' $(ESTR).v		

all:
	$(COMP) -o $(COND) $(COND).v
	$(COMP) -o $(TEST) $(TEST).v
	$(COMP) -o $(TEST_BENCH) $(TEST_BENCH).v
	
	$(RUN) $(COND)
	$(RUN) $(TEST)
	$(RUN) $(TEST_BENCH)
	
	emacs --batch $(TEST_BENCH).v -f verilog-batch-auto
	
	$(WAVE) $(SIGNALS) $(TARGET)
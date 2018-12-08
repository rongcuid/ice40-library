TARGET_MHZ ?= 48

blinky: blinky.v blinky_top.v blinky.ys
	yosys $^ | tee $@.syn.log
	nextpnr-ice40 --up5k --json $@.json --asc $@.asc --pcf $@.pcf | tee $@.pnr.log
	icetime -m -c $(TARGET_MHZ) -d up5k -t $@.asc | tee $@.time.log
	icepack $@.asc $@.bin

clean:
	rm -f *.asc *.json *.bin

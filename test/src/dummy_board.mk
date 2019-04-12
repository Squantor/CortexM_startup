# update per change V0002
# board specific settings
MCU = LPC812
C_SOURCES +=
CXX_SOURCES += src/$(BOARD).cpp
S_SOURCES +=
DEFINES += -D$(BOARD)
INCLUDES += -Iinc
ALIBS += -lCortex_M_startup_$(MCU)
RLIBS +=
DLIBS +=
ALIBDIR +=
RLIBDIR += -L"../bin/$(MCU)/release"
DLIBDIR += -L"../bin/$(MCU)/debug"

TOOLCHAIN_PREFIX = arm-none-eabi-

#custom build rules
pre-clean:
	$(MAKE) -C .. clean MCU=$(MCU)

pre-release:
	$(MAKE) -C .. release MCU=$(MCU)

pre-debug:
	$(MAKE) -C .. debug MCU=$(MCU)

#project hardware specific commands
gdbusbdebug: debug
	$(TOOLCHAIN_PREFIX)$(GDB) -x ./gdb_scripts/bmpUSBdebug.txt

gdbusbrelease: release
	$(TOOLCHAIN_PREFIX)$(GDB) -x ./gdb_scripts/bmpUSBrelease.txt

tpwrdisable:
	$(TOOLCHAIN_PREFIX)$(GDB) -x ./gdb_scripts/bmpusb_tpwr_disable.txt

tpwrenable:
	$(TOOLCHAIN_PREFIX)$(GDB) -x ./gdb_scripts/bmpusb_tpwr_enable.txt

.PHONY: pre-clean pre-release pre-debug gdbusbdebug gdbusbrelease tpwrdisable tpwrenable
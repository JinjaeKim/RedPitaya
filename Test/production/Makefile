INSTALL_DIR ?= .

BINARY_FILES = calibration_script.sh delete_MAC.sh spectrum_sfdr_test.py production_env_install.sh production_env_gen1_install.sh production_env_gen2_install.sh

TEXT_FILES = environment_parameters.txt
PRODUCTION_TESTING_SCRIPT = production_testing_script.sh
MODEL ?= Z10

ifeq ($(MODEL), Z20)
BINARY_FILES += production_testing_script_z20_spectrum.sh
PRODUCTION_TESTING_SCRIPT = production_testing_script_z20.sh
endif

all:
ifeq ($(MODEL), Z20_250_12)
	make -C production_test_z250_12/apps/uart_tool
	make -C production_test_z250_12/apps/i2c_spi_tool
	make -C production_test_z250_12/apps/analyze_signal
	make -C production_test_z250_12/apps/generate_with_api
	make -C production_test_z250_12/apps/capacitor_calib_tool
endif

clean:
	make -C production_test_z250_12/apps/uart_tool clean
	make -C production_test_z250_12/apps/i2c_spi_tool clean
	make -C production_test_z250_12/apps/analyze_signal clean
	make -C production_test_z250_12/apps/generate_with_api clean
	make -C production_test_z250_12/apps/capacitor_calib_tool clean
install:
	mkdir -p $(INSTALL_DIR)/bin
ifeq ($(MODEL), Z20_250_12)
	make -C production_test_z250_12/apps/uart_tool install INSTALL_DIR=$(abspath $(INSTALL_DIR))
	make -C production_test_z250_12/apps/i2c_spi_tool install INSTALL_DIR=$(abspath $(INSTALL_DIR))
	make -C production_test_z250_12/apps/analyze_signal install INSTALL_DIR=$(abspath $(INSTALL_DIR))
	make -C production_test_z250_12/apps/generate_with_api install INSTALL_DIR=$(abspath $(INSTALL_DIR))
	make -C production_test_z250_12/apps/capacitor_calib_tool install INSTALL_DIR=$(abspath $(INSTALL_DIR))
	cp --parents `find production_test_z250_12 -name \*.sh*` $(INSTALL_DIR)/bin
else
	cp $(BINARY_FILES) $(INSTALL_DIR)/bin
	cp $(PRODUCTION_TESTING_SCRIPT) $(INSTALL_DIR)/bin/production_testing_script.sh
endif
	cp $(TEXT_FILES) $(INSTALL_DIR)

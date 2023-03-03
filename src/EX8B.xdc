# ----------------------------------------------------------------------------
#
#  Inipro Inc.          www.inipro.net
#
# ----------------------------------------------------------------------------
#
#     IO standard for Bank 26 Vcco supply is fixed at 1.8V
#     IO standard for Bank 65 Vcco supply is fixed at 1.2V
#
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# High-speed expansion connector
# ----------------------------------------------------------------------------
# Bank 65
set_property PACKAGE_PIN F1 [get_ports {o_result[7]}]
set_property PACKAGE_PIN G1 [get_ports {o_result[6]}]
set_property PACKAGE_PIN E3 [get_ports {o_result[5]}]
set_property PACKAGE_PIN E4 [get_ports {o_result[4]}]
set_property PACKAGE_PIN D1 [get_ports {o_result[3]}]
set_property PACKAGE_PIN E1 [get_ports {o_result[2]}]
set_property PACKAGE_PIN C3 [get_ports {o_result[1]}]
set_property PACKAGE_PIN D3 [get_ports {o_result[0]}]


# ----------------------------------------------------------------------------
# Low-speed expansion connector
# ----------------------------------------------------------------------------
# Bank 26
set_property PACKAGE_PIN D7 [get_ports {i_a[3]}]
set_property PACKAGE_PIN F8 [get_ports {i_a[2]}]
set_property PACKAGE_PIN F7 [get_ports {i_a[1]}]
set_property PACKAGE_PIN G7 [get_ports {i_a[0]}]
set_property PACKAGE_PIN F6 [get_ports {i_b[3]}]
set_property PACKAGE_PIN G5 [get_ports {i_b[2]}]
set_property PACKAGE_PIN A6 [get_ports {i_b[1]}]
set_property PACKAGE_PIN A7 [get_ports {i_b[0]}]

# ----------------------------------------------------------------------------
#
# IOSTANDARD Constraints
#
# ----------------------------------------------------------------------------

# Set the bank voltage for IO Bank 26 to 1.8V
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 26]]

# Set the bank voltage for IO Bank 65 to 1.2V
set_property IOSTANDARD LVCMOS12 [get_ports -of_objects [get_iobanks 65]]

set_property IOSTANDARD LVCMOS12 [get_ports clka]
set_property PACKAGE_PIN L2 [get_ports clka]
set_property IOSTANDARD LVCMOS18 [get_ports clkb]
set_property PACKAGE_PIN E8 [get_ports clkb]

create_clock -period 2.000 -name clka -waveform {0.000 1.000} [get_ports clka]
create_clock -period 2.500 -name clkb -waveform {0.000 1.250} [get_ports clkb]

set_false_path -from [get_clocks clka] -to [get_clocks clkb]
set_false_path -from [get_clocks clkb] -to [get_clocks clka]

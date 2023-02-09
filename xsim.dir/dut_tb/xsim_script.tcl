set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {dut_tb} -autoloadwcfg -tclbatch {sim.tcl}

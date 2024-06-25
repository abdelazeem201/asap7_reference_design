# Set the directory path where your .lib files are located
set directory_path "/home/abdelazeem/Desktop/Abdelazeem/SoC_Project/asap7_reference_design/lib"

# Set the output files paths
set read_output_file "/home/abdelazeem/Desktop/Abdelazeem/SoC_Project/asap7_reference_design/lib/read_output.tcl"
set write_output_file "/home/abdelazeem/Desktop/Abdelazeem/SoC_Project/asap7_reference_design/lib/write_output.tcl"

# Open the output files for writing
set read_outfile [open $read_output_file "w"]
set write_outfile [open $write_output_file "w"]

# Get a list of all files ending with .lib in the directory
set file_list [glob -nocomplain -directory $directory_path *.lib]

# Iterate over each file
foreach file $file_list {
    # Format for read_lib output
    set read_output "read_lib [file tail $file]"
    # Format for write_lib output
    set base_name [file rootname [file tail $file]]
    set write_output "write_lib $base_name \t\t-output $base_name.db"
    
    # Print to console
    puts $read_output
    puts $write_output
    
    # Write to read output file
    puts $read_outfile $read_output
    
    # Write to write output file
    puts $write_outfile $write_output
}

# Close the output files
close $read_outfile
close $write_outfile

#!/bin/bash

# Define input and output directories
#input_dir="/mnt/central_nas/projects/MALDI_imaging/AllSample_36Clustersr/"
#output_dir="/mnt/central_nas/projects/MALDI_imaging/sampleClusterLabels/"

# Create the output directory if it doesn't exist
#mkdir -p "$output_dir"

# Process each file in the input directory
#for input_file in "$input_dir"/*.csv; do
#    # Extract the base name of the file (without directory)
#    base_name=$(basename "$input_file")

    # Define the output file path
#    output_file="$output_dir/$base_name"

    # Use awk to remove the first line and lines starting with #
#    awk 'NR > 1 && !/^#/' "$input_file" > "$output_file"

#    echo "Processed $input_file and saved to $output_file"
#done


# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_directory output_directory"
    exit 1
fi

# Get input and output directories from command line arguments
input_dir="$1"
output_dir="$2"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Process each file in the input directory
for input_file in "$input_dir"/*.csv; do
    # Extract the base name of the file (without directory)
    base_name=$(basename "$input_file")

    # Define the output file path
    output_file="$output_dir/$base_name"

    # Use awk to remove the first line and lines starting with #
    awk 'NR > 1 && !/^#/' "$input_file" > "$output_file"

    echo "Processed $input_file and saved to $output_file"
done

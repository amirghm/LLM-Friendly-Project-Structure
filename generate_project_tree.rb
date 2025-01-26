#!/usr/bin/env ruby
# encoding: UTF-8

# Set the output file name
OUTPUT_FILE = "project_treeview.txt"

# Set the default excluded directories
EXCLUDE_DIRS = [".gradle", ".idea", "build", "out", "node_modules", "res"]

# Set the default excluded files
EXCLUDE_FILES = [".DS_Store"]

# Function to generate the treeview recursively
def generate_treeview(dir, indent = "")
  # Get a sorted list of items in the directory
  items = Dir.entries(dir).sort - [".", ".."]

  # Loop through the items
  items.each_with_index do |item, index|
    is_last = (index == items.size - 1)
    prefix = is_last ? "└── " : "├── "

    # Check if the item is a directory
    if File.directory?(File.join(dir, item))
      # Check if the directory should be excluded
      next if EXCLUDE_DIRS.include?(item)

      # Write the directory name to the output file
      File.open(OUTPUT_FILE, "a", encoding: "UTF-8") { |f| f.puts "#{indent}#{prefix}#{item}/" }

      # Recursively call the function for subdirectories
      generate_treeview(File.join(dir, item), indent + (is_last ? "    " : "│   "))
    # Check if the item is a file
    elsif File.file?(File.join(dir, item))
      # Check if the file should be excluded
      next if EXCLUDE_FILES.include?(item)

      # Write the file name to the output file
      File.open(OUTPUT_FILE, "a", encoding: "UTF-8") { |f| f.puts "#{indent}#{prefix}#{item}" }
    end
  end
end

# Check if the output file exists and delete it if it does
File.delete(OUTPUT_FILE) if File.exist?(OUTPUT_FILE)

# Get the current directory
current_dir = Dir.pwd

# Write the root directory name to the output file
File.open(OUTPUT_FILE, "a", encoding: "UTF-8") { |f| f.puts "#{File.basename(current_dir)}/" }

# Generate the treeview
generate_treeview(current_dir)

puts "Treeview saved to #{OUTPUT_FILE}"
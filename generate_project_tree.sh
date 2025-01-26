#!/bin/bash

# Function to generate a treeview of the directory structure
generate_treeview() {
  local dir_path="$1"
  local indent="$2"
  local output_file="$3"
  shift 3
  local exclude_items=("$@")

  # Create or clear the output file if it doesn't exist
  if [[ ! -f "$output_file" ]]; then
    echo "" > "$output_file"
  fi

  # Get a sorted list of items in the directory
  local items=($(ls -A "$dir_path" | sort))
  local last_index=$(( ${#items[@]} - 1 ))

  for index in "${!items[@]}"; do
    local item="${items[index]}"
    local item_path="$dir_path/$item"
    local is_last=$(( index == last_index ))
    local prefix="├── "
    [[ "$is_last" -eq 1 ]] && prefix="└── "

    # Skip excluded directories or files
    if [[ " ${exclude_items[@]} " =~ " $item " ]]; then
      continue
    fi

    if [[ -d "$item_path" ]]; then
      echo "${indent}${prefix}${item}/" >> "$output_file"
      generate_treeview "$item_path" "${indent}$( [[ "$is_last" -eq 1 ]] && echo "    " || echo "│   ")" "$output_file" "${exclude_items[@]}"
    elif [[ -f "$item_path" ]]; then
      echo "${indent}${prefix}${item}" >> "$output_file"
    fi
  done
}

# Main script execution
main() {
  local project_root=$(pwd) # Get the current working directory
  local output_file="project_treeview.txt"
  local exclude_items=(".gradle" ".idea" "build" "out" "node_modules" "res" ".DS_Store") # Add directories or files to exclude

  echo "$(basename "$project_root")/" > "$output_file"
  generate_treeview "$project_root" "    " "$output_file" "${exclude_items[@]}"
  echo "Treeview saved to $output_file"
}

# Run the main function
main
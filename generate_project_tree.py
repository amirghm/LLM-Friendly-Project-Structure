import os

def generate_treeview(root_dir, output_file="project_treeview.txt", exclude_dirs=None, exclude_files=None):
    """
    Generates a treeview representation of a directory structure and saves it to a file.

    Args:
        root_dir: The root directory to start the treeview from.
        output_file: The file to save the treeview to.
        exclude_dirs: A list of directory names to exclude.
        exclude_files: A list of file names to exclude.
    """

    if exclude_dirs is None:
        exclude_dirs = []
    if exclude_files is None:
        exclude_files = []

    with open(output_file, "w", encoding="utf-8") as f:
        def _generate_treeview(dir_path, indent=""):
            """
            Recursive helper function to generate the treeview.
            """
            try:
                items = sorted(os.listdir(dir_path))
            except OSError as e:
                print(f"Error accessing directory {dir_path}: {e}")
                return

            for i, item in enumerate(items):
                item_path = os.path.join(dir_path, item)
                is_last = i == len(items) - 1
                prefix = "└── " if is_last else "├── "

                if os.path.isdir(item_path):
                    if item in exclude_dirs:
                        continue
                    f.write(f"{indent}{prefix}{item}/\n")
                    _generate_treeview(item_path, indent + ("    " if is_last else "│   "))
                elif os.path.isfile(item_path):
                    if item in exclude_files:
                        continue
                    f.write(f"{indent}{prefix}{item}\n")

        f.write(f"{os.path.basename(root_dir)}/\n")
        _generate_treeview(root_dir, "    ")

    print(f"Treeview saved to {output_file}")


# Example usage:
project_root = os.getcwd()  # Get the current working directory
exclude_directories = [".gradle", ".idea", "build", "out", "node_modules", "res"]  # Add "res" to the excluded directories
exclude_files = [".DS_Store"]  # Add any files you want to exclude
generate_treeview(project_root, exclude_dirs=exclude_directories, exclude_files=exclude_files)
# LLM Friendly Project Structure 🤖🧠🌳📁
![LLM Friendly Project Structure](https://raw.githubusercontent.com/amirghm/LLM-Friendly-Project-Structure/e29e9dce4c7362414e2bf6606508d30d6e5dad03/llm-friendly-tree-file.png)

Simplify how Large Language Models (LLMs) understand your project's organization! This project, **LLM Friendly Project Structure**, provides scripts in multiple languages to generate a clear, tree-like representation of your project's directory structure. This output is specifically designed to be easily parsed and understood by LLMs, making it ideal for tasks like code analysis, documentation generation, and automated code understanding.

## Why is this LLM-Friendly? 🤔

LLMs excel at understanding structured data. By providing a simple, text-based tree view of your project, you're giving the LLM a clear map of your codebase. This helps the LLM:

*   **Understand Context:** Quickly grasp the relationships between files and directories.
*   **Navigate Code:** Easily locate specific files or modules.
*   **Generate Documentation:** Create more accurate and relevant documentation.
*   **Perform Code Analysis:** Analyze code structure and identify potential issues.
*   **Answer Questions:** Provide more accurate answers about your project.

## Supported Languages 🌐

This project currently supports generating project trees using:

*   **Python** 🐍: `generate_project_tree.py`
*   **Ruby** 💎: `generate_project_tree.rb`
*   **Bash** 🐚: `generate_project_tree.sh`
*   **Kotlin** 🤖: `GenerateProjectTree.kt`

## Features ✨

*   **LLM-Optimized Output:** Generates a clean, text-based tree structure that LLMs can easily parse.
*   **Multi-Language Support:** Choose the language you're most comfortable with!
*   **Clear Visuals:** Creates a well-formatted tree structure using box-drawing characters.
*   **Customizable:** Easily exclude specific directories or files.
*   **Easy to Use:** Simple command-line interface.
*   **Cross-Platform:** Works on macOS, Linux, and Windows (with Ruby and Python installed).

## How to Run 🚀

Here's how to run each script, step-by-step:

### Python 🐍

1.  **Prerequisites:** Ensure you have Python 3 installed on your system.
2.  **Navigate:** Open your terminal and navigate to your project's root directory.
3.  **Run:** Execute the Python script:
```
python generate_project_tree.py
```

### Ruby 💎

1.  **Prerequisites:** Ensure you have Ruby installed on your system.
2.  **Navigate:** Open your terminal and navigate to your project's root directory.
3.  **Run:** Execute the Ruby script:
```
ruby generate_project_tree.rb
```

### Bash 🐚

1.  **Prerequisites:** Ensure you have Bash installed on your system (it's usually the default shell on macOS and Linux).
2.  **Navigate:** Open your terminal and navigate to your project's root directory.
3.  **Make Executable:** Make the script executable:
```
bash generate_project_tree.sh
```
or
```
./generate_project_tree.sh
```


### Kotlin 🤖

1.  **Prerequisites:** Ensure you have the Kotlin compiler installed and configured.
2.  **Navigate:** Open your terminal and navigate to your project's root directory.
3.  **Compile:** Compile and run the Kotlin code:
```
kotlinc GenerateProjectTree.kt -include-runtime -d GenerateProjectTree.jar
java -jar GenerateProjectTree.jar
```

## Customization 🛠️

*   **Excluding Directories:** Modify the `EXCLUDE_DIRS` variable in each script to exclude specific directories (e.g., `.git`, `build`, `node_modules`).
*   **Excluding Files:** Modify the `EXCLUDE_FILES` variable in each script to exclude specific files (e.g., `.DS_Store`).


## Example Output 📄

Here's an example of what the output in `project_treeview.txt` might look like:
```
MyProject/
├── .gitignore
├── build.gradle.kts
├── settings.gradle.kts
├── app/
│   ├── build.gradle.kts
│   └── src/
│       ├── main/
│       │   ├── AndroidManifest.xml
│       │   ├── java/
│       │   │   └── com/
│       │   │       └── example/
│       │   │           ├── MainApplication.kt
│       │   │           └── ui/
│       │   │               └── MainActivity.kt
│       │   └── res/
│       │       └── values/
│       │           └── strings.xml
│       └── test/
│           └── java/
│               └── com/
│                   └── example/
│                       └── ExampleUnitTest.kt
├── gradle/
│   ├── libs.versions.toml
│   └── wrapper/
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
├── gradlew
└── gradlew.bat
```
## Contributing 🤝

Contributions are welcome! If you have any ideas for improvements or want to add support for other languages, feel free to open an issue or submit a pull request.

## MIT License 📜

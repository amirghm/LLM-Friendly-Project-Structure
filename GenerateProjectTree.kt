import java.io.File
import java.io.IOException

fun generateProjectTree(
    rootDirectory: File,
    outputFile: File = File("project_treeview.txt"),
    excludeDirectories: List<String> = listOf(".gradle", ".idea", "build", "out", "node_modules", "res"),
    excludeFiles: List<String> = listOf(".DS_Store")
) {
    try {
        outputFile.bufferedWriter().use { writer ->
            fun generateTreeviewRecursive(directory: File, indent: String) {
                val items = directory.listFiles()?.sorted() ?: emptyList()

                for ((index, item) in items.withIndex()) {
                    val isLast = index == items.size - 1
                    val prefix = if (isLast) "└── " else "├── "

                    if (item.isDirectory) {
                        if (item.name in excludeDirectories) continue
                        writer.write("$indent$prefix${item.name}/\n")
                        generateTreeviewRecursive(item, indent + if (isLast) "    " else "│   ")
                    } else if (item.isFile) {
                        if (item.name in excludeFiles) continue
                        writer.write("$indent$prefix${item.name}\n")
                    }
                }
            }

            writer.write("${rootDirectory.name}/\n")
            generateTreeviewRecursive(rootDirectory, "    ")
        }
        println("Treeview saved to ${outputFile.absolutePath}")
    } catch (e: IOException) {
        println("Error writing to file: ${e.message}")
    } catch (e: SecurityException) {
        println("Error accessing directory: ${e.message}")
    }
}

fun main() {
    val projectRoot = File(".").absoluteFile // Get the current working directory
    val excludeDirectories = listOf(".gradle", ".idea", "build", "out", "node_modules", "res")
    val excludeFiles = listOf(".DS_Store")
    generateProjectTree(projectRoot, excludeDirectories = excludeDirectories, excludeFiles = excludeFiles)
}
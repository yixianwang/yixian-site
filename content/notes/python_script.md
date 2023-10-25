+++
title = 'python_script'
date = 2023-10-24T03:10:46-04:00
+++

## Add sentences to the beginning of all markdown files
```python
import os

# Define the sentence you want to add
sentence_to_add = """+++
title = 'Markdown'
date = 2023-10-23T21:50:46-04:00
draft = true
+++
\n"""

# Specify the directory where your Markdown files are located
markdown_directory = "./"

# List all the Markdown files in the directory
markdown_files = [f for f in os.listdir(markdown_directory) if f.endswith(".md")]

# Loop through each Markdown file and add the sentence
for markdown_file in markdown_files:
    file_path = os.path.join(markdown_directory, markdown_file)
    
    # Open the file in read mode to read its content
    with open(file_path, 'r') as file:
        content = file.read()
    
    # Open the file in write mode to add the sentence at the beginning
    with open(file_path, 'w') as file:
        file.write(sentence_to_add)
        file.write(content)

print("Sentences added to Markdown files.")
```

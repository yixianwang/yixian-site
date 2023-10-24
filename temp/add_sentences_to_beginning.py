import os


# Specify the directory where your Markdown files are located
markdown_directory = "./"

# List all the Markdown files in the directory
markdown_files = [f for f in os.listdir(markdown_directory) if f.endswith(".md")]

# Loop through each Markdown file and add the sentence
for markdown_file in markdown_files:
    file_path = os.path.join(markdown_directory, markdown_file)

    # Extract the file name from the file path
    file_name = os.path.basename(file_path)[:-3]
    

    # Define the sentence you want to add
    sentence_to_add = f"""+++\ntitle = '{file_name}'\ndate = 2023-10-24T03:10:46-04:00\ndraft = true\n+++\n\n"""

    # Open the file in read mode to read its content
    with open(file_path, 'r') as file:
        content = file.read()
    
    # Open the file in write mode to add the sentence at the beginning
    with open(file_path, 'w') as file:
        file.write(sentence_to_add)
        file.write(content)

print("Sentences added to Markdown files.")

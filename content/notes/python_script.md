+++
title = 'Python Scripts'
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

## Automatically create branches based on ticket number
```python
import subprocess

def create_branch(ticket_number, description):
    branch_name = f"feature/{ticket_number}-{description.replace(' ', '-').lower()}"
    subprocess.run(['git', 'checkout', '-b', branch_name])
    print(f"Branch '{branch_name}' created and checked out.")

# Example usage
create_branch('PROJ-1234', 'add user authentication')
```

## Pre-Commit Hook for Quality Checks (e.g., Linting)
- Create `.git/hooks/pre_commit_check.py` file with:
```bash
#!/bin/bash
python3 .git/hooks/pre_commit_check.py
```

```python
import subprocess

def run_linter():
    result = subprocess.run(['flake8', '.'], capture_output=True, text=True)
    if result.returncode != 0:
        print("❌ Lint errors detected. Commit aborted.")
        print(result.stdout)
        exit(1)
    else:
        print("✅ Linter check passed.")
        
if __name__ == "__main__":
    run_linter()
```

- Make `pre_commit_check.py` executable:
```bash
chmod +x .git/hooks/pre_commit_check.py
```

## Automated Pull, Merge, Push (One-Click Sync)
```python
import subprocess

def sync_with_main():
    try:
        subprocess.run(['git', 'checkout', 'main'], check=True)
        subprocess.run(['git', 'pull', 'origin', 'main'], check=True)
        subprocess.run(['git', 'checkout', '-'], check=True)  # Go back to the original branch
        subprocess.run(['git', 'merge', 'main'], check=True)
        subprocess.run(['git', 'push'], check=True)
        print("✅ Synced with main and pushed changes.")
    except subprocess.CalledProcessError as e:
        print(f"❌ Error during sync: {e}")

sync_with_main()
```

## Auto-Tagging and Version Bumping
- Every time we merge to main, automatically bump version (semver) and create a new tag.
```python
import subprocess
import re

def get_latest_version():
    result = subprocess.run(['git', 'tag'], capture_output=True, text=True)
    tags = result.stdout.split()
    tags = [t for t in tags if re.match(r'v\d+\.\d+\.\d+', t)]
    return sorted(tags)[-1] if tags else 'v0.0.0'

def bump_version(version):
    major, minor, patch = map(int, version.lstrip('v').split('.'))
    return f'v{major}.{minor}.{patch + 1}'

def tag_new_version():
    latest_version = get_latest_version()
    new_version = bump_version(latest_version)

    subprocess.run(['git', 'tag', new_version])
    subprocess.run(['git', 'push', 'origin', new_version])

    print(f"✅ Created and pushed new tag: {new_version}")

tag_new_version()
```


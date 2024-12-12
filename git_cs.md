### Correct Command for Viewing Remotes
To view the remote repository details using `lg2`, the correct command is:
```bash
lg2 remote show origin
```

This will display the URL for the `origin` remote repository (used for fetch and push operations).

---

### **Summary of Using Git to Save Work**

Here’s a step-by-step process to use `git` effectively:

#### **1. Initialize a Git Repository**
Run this command in the folder where you want to track changes:
```bash
git init <directory>
```
For example:
```bash
git init ~/Documents/project-name
```

#### **2. Configure User Details**
Set up your name, email, and SSH key globally:
```bash
lg2 config --global user.name "Your Name"
lg2 config --global user.email "your-email@example.com"
lg2 config --global user.identityFile ~/Documents/.ssh/id_ed25519
```

#### **3. Create or Clone a Repository**
- To create a new repository:
  Add files, then initialize Git:
  ```bash
  mkdir ~/Documents/project-name
  cd ~/Documents/project-name
  git init .
  echo "# My Project" > README.md
  git add README.md
  git commit -m "Initial commit"
  ```

- To clone an existing repository:
  ```bash
  lg2 clone git@github.com:<your-username>/<repo-name>.git
  ```

#### **4. Track Changes**
- Add files to the staging area:
  ```bash
  lg2 add <file>
  ```
  Or stage all changes:
  ```bash
  lg2 add .
  ```

- Commit changes:
  ```bash
  lg2 commit -m "Your commit message"
  ```

#### **5. Push Changes to GitHub**
- Verify the remote:
  ```bash
  lg2 remote show origin
  ```
- Push changes to the remote:
  ```bash
  lg2 push origin main
  ```

#### **6. Pull Changes from Remote**
If working with collaborators or syncing changes:
```bash
lg2 pull origin main
```

---

### **Automating the Process with a Script**
Save the following script to automate the workflow. Name it `git_automation.sh` and run it using `bash`:
```bash
#!/bin/sh

# Usage: ./git_automation.sh <project-directory> <commit-message>

# Variables
PROJECT_DIR=$1
COMMIT_MSG=$2

# Step 1: Navigate to Project Directory
cd "$PROJECT_DIR" || {
    echo "Directory not found!"
    exit 1
}

# Step 2: Check if Git is Initialized
if [ ! -d ".git" ]; then
    echo "Initializing Git repository..."
    git init .
fi

# Step 3: Stage All Changes
echo "Staging all changes..."
lg2 add .

# Step 4: Commit Changes
if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="Update: $(date)"
fi
echo "Committing changes with message: $COMMIT_MSG"
lg2 commit -m "$COMMIT_MSG"

# Step 5: Push Changes to GitHub
REMOTE_EXISTS=$(lg2 remote show origin 2>/dev/null)
if [ -z "$REMOTE_EXISTS" ]; then
    echo "No remote set. Please add a remote repository manually."
else
    echo "Pushing changes to origin/main..."
    lg2 push origin main
fi

echo "Process complete!"
```

#### **How to Use the Script**
1. Save the script as `git_automation.sh` in your `~/Documents` folder.
2. Run the script from the terminal:
   ```bash
   ./git_automation.sh <directory> "<commit-message>"
   ```
   Example:
   ```bash
   ./git_automation.sh ~/Documents/freecodeCamp.git "Updated README.md"
   ```

---

This script automates:
- Checking if Git is initialized.
- Adding all changes.
- Committing them with a provided message (or a default timestamp).
- Pushing changes to the remote repository if one exists.

Let me know if you'd like to tweak the script further!

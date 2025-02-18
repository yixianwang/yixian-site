+++
title = 'Git'
date = 2023-10-24T03:10:46-04:00
+++

## We Want to Keep the Files Locally Modified but Unstaged
- If you want to keep local changes without staging them for commits:
```
git update-index --assume-unchanged config1.yml
git update-index --assume-unchanged config2.yml
git update-index --assume-unchanged config3.yml
```
- These files will not appear in git status anymore.
- They will remain untracked in future commits but still exist locally.
To revert this and track them again:
```
git update-index --no-assume-unchanged config1.yml
git update-index --no-assume-unchanged config2.yml
git update-index --no-assume-unchanged config3.yml
```
- list files in --assume-unchanged
```
git config --global alias.hidden '!git ls-files -v | grep "^[a-z]"'
```

## We Never Want to Accidentally Modify These Files
- If these files are in the repository but should never be changed on your local machine, use:
```
git update-index --skip-worktree config1.yml
git update-index --skip-worktree config2.yml
git update-index --skip-worktree config3.yml
```
- This tells Git to ignore future changes in these files unless you explicitly change them.
To undo this and allow modifications again:
```
git update-index --no-skip-worktree config1.yml
git update-index --no-skip-worktree config2.yml
git update-index --no-skip-worktree config3.yml
```

## git.config
```
$ cat .gitconfig
[alias]
        lg = log --oneline --graph --decorate --all
        lgt = log --pretty=format:'%h %an %ar %ad %s' --date=iso --all --graph
        hidden = !git ls-files -v | grep \"^[a-z]\"
```

## branch operations
```
# set the remote branch to track the local branch
git push --set-upstream origin branchb

# check upstream branch
git branch -vv

# change upstream branch later
git branch -u origin/branch-name

# delete a branch
git branch -d <branch-name>

# create a new branch
git checkout -b <branch-name>
git switch -c <branch-name>

# rename branch
git branch -m <new name>
```

## tag is a snapshot of all the commits at that time
```
# create a tag, -a means annotation, 
git tag -a v1.0.0 -m "version 1.0.0"
git tag
git push origin v1.0.0

# pull latest code and tag again
git pull
git tag
git tag -a v1.0.1 -m "version 1.0.1"
git tag
git push origin v1.0.1
```

## merge, on development branch, do operations to merge feature branch into development branch
```
# merge feature branch into development branch, locally
git checkout development
git merge feature-branch

# merge development branch into feature branch, without tracking development locally
git checkout feature-branch
git fetch origin
git merge origin/development

# conflict content will show message like:
# CONFLICT (content): Merge conflict in some-file.js

# resolve conflict, stage, commit, and then push
# git commit -m "Resolved merge conflicts between development and feature-branch"
```

## rebase
```
git checkout feature-branch
git pull --rebase origin development

# If conflicts occur, resolve them and continue rebasing:
git rebase --continue

# After rebasing, force push since history is rewritten:
git push --force origin feature-branch
```

## git diff
```
git diff remote-origin/branch-name # compare local with remote
```

## Semantic Commit Messages

See how a minor change to your commit message style can make you a better programmer.

Format: `<type>(<scope>): <subject>`

`<scope>` is optional

### Example

```
feat: add hat wobble
^--^  ^------------^
|     |
|     +-> Summary in present tense. e.g. add, update, resolve, remove, reformat, optimize, reduce, fix, upgrade, merge, etc.
|
+-------> Type: chore, docs, feat, fix, refactor, style, or test.
```


### Types
- `chore`: (indicates a task that is not user facing or feature-related)
  - update dependencies
  - rename file or folders
  - update configurations
  - update pipelines
  - update docs
- `deprecated`: (indicates a feature is deprecated)
- `feat`: (new feature for the user, not a new feature for build script)
- `fix`: (bug fix for the user, not a fix to a build script)
- `release`: (indicates a release)

#### other types
- `docs`: (doc change)
- `style`: (code formatting)
- `refactor`: (restructure or improve code, no feature change)
- `test`: (add or update tests)

References:

- https://www.conventionalcommits.org/
- https://seesparkbox.com/foundry/semantic_commit_messages
- http://karma-runner.github.io/1.0/dev/git-commit-msg.html

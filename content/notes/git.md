+++
title = 'Git'
date = 2023-10-24T03:10:46-04:00
+++

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
# merge feature branch into development branch
git checkout development
git merge feature-branch
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

More Examples:

- `feat`: (new feature for the user, not a new feature for build script)
- `fix`: (bug fix for the user, not a fix to a build script)
- `docs`: (doc change)
- `style`: (code formatting)
- `refactor`: (restructure or improve code, no feature change)
- `test`: (add or update tests)
- `chore`: (indicates a task that is not user facing or feature-related)
  - update dependencies
  - rename file or folders
  - update configurations
  - update pipelines
  - update docs

References:

- https://www.conventionalcommits.org/
- https://seesparkbox.com/foundry/semantic_commit_messages
- http://karma-runner.github.io/1.0/dev/git-commit-msg.html

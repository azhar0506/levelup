# Interactive Rebase

## What it does
- Lets you **edit**, **reorder**, **squash**, **combine**, or **delete** commits.
- Rewrite history (creates new commit hashes).
- Work on any number of recent commits

**Basic usage**
- Start an interactive rebase for the last N commits

```zsh
git rebase -i HEAD~N
```

**What you can do in the rebase editor**

- You'll see lines like:
```zsh
pick abc123 First commit
pick def456 Second commit
pick 789abc Third commit
```

You can replace pick with:
- reword — change commit message
- edit — stop and modify that commit’s content
- squash — combine this commit into the previous one (keep message)
- fixup — combine commit into previous (discard message)
- drop — remove commit
- pick — keep commit as is

**Common flows**
- **Edit a commit's content:**
1. Change pick -> edit
2. Make change (edit files, add files)
3. `git commit --amend`
4. `git rebase --continue`

**Squash commits:**
- **Change:**

```sh
pick abc123 feature A
squash def456 small fix
```

**Delete** a commit:
- Change pick -> drop

### What it does not do:
- Does not create a merge
- Does not keep the original commit hashes - history
- Not safe on sahred branches unless you coordinate

### When to use it
- Cleaning messy history before merging.
- Editing or removing older commits.
- Combining multiple small commits into one.
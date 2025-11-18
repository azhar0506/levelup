# How to use git reset --hard

## What it does
- Moves **HEAD** to a different commit
- Resets the index AND working directory to match that commit
- Deletes all uncommitted changes (both staged and unstaged)

**Basic usage:**

- Reset everything to the previous commit:
```sh
git reset --hard HEAD~1
```

- Reset to a specific commit:
```sh
git reset --hard <commit-hash>
```

**What it's used for**
- Completely wipe out local work
- Return to a clean state
- Undo commits and throw away all changes since then

**What it does not do**
- Does NOT preserve your changes
- Does NOT keep files in the working directory
- Does NOT leave anything staged
- Not reversible (unless you can recover from reflog)
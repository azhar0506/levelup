# How to use git reset --soft

## What it does
- Moves **HEAD** to a different commit
- Keeps all your changes staged (in the index)
- Does **not** change working directory files
- Essentially "uncommits" but leaves everything ready to recommit

**Basic usage:**

- Reset to the previous commit (undo last commit, keep changes staged):

```sh
git reset --soft HEAD~1
```

- Reset to a specific commitL

```sh
git reset --soft <commmit-hash>
```

**What it's used for:**

- Undo the last commit(s) but keep the changes staged
- Rewrite or combine commits
- Prepare to recommit with a different message or grouping
- Fix a commit without changing your woroking files

**What it does not do**

- Does NOT discard any changes
- Does NOT alter working directory files
- DOes NOT unstage files
- Does NOT remove code - purely a history/HEAD move

Undo a commit, then rewrite it:

```sh
git reset --soft HEAD~1
git commit -m "New message or new commit content"
```
# How to use git reflog

## What it does
- Shows a history of where HEAD and branch references have pointed
- Lets you recover lost commits, even after reset, amend, rebase, or hard reset
- Acts like an "undo history" for Git operations

**Basic usage**

- Show the reflog
```sh
git reflog
```

- Example output:
```sh
a1b2c3d HEAD@{0}: reset: moving to HEAD~1
e4f5g6h HEAD@{1}: commit: Added feature
...
```

**Recover a commit**
- Checkout or reset to a reflog entry:
```sh
git checkout HEAD@{2}
```

**or restore your branch:**
```sh
git reset --hard HEAD@{2} 
```

**What it’s used for**

Recover commits after:
- hard reset
- amend mistake
- rebase gone wrong
- branch deletion

**What it does not do**
- Does NOT show your repositories shared history
- Does NOT replace log for commit browsing
- Does NOT persist forever (old entries expire)
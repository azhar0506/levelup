# How to use git cherry-pick

## What it does
- Copies a commit (or several commits) from **any branch** and **applies them on your current branch**
- Cretes **new commits** with new hashes
- Great for bringing specifc changes without merging whole branches

**Basic usage:**

- Cherry-pick a single commit:

```sh
git cherry-pick <commit-hash>
```

- Cherry-pick multiple commits:
```sh
git cherry-pick <hash1> <hash2> <hash3>
```

**What it does not do:**
- Does **not** merge branches.
- Does **not** move the original commits
- Does **not** rewrite history on the source branch - only adds commits to your current branch

**When to use it:**
- You want one or two commits from another branch, not everything.
- You fixed a bug on main and want the same fix on release/1.0
- You want a selective, targeted change

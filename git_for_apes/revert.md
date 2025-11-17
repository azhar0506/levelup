# How to use git revert

## What it does
- Creates a new commit that undoes the changes from an earlier commit
- Does not delete or rewrite history
- Safe for public/shared branches

**Basic usage:**
- Revert the latest commit:

```sh
git revert HEAD
```

- Revert a specific commit

```sh
git revert <commit-hash>
```

**What it does not do:**
- It does **not** modify or remove the original commit
- It does **not** rewrite history (unlike amend or rebase)
- It dies **not** delete commits - it adds a new one that reverses them.


**Multiple commits:**

```sh
git revert <old-hash>..<new-hash>
```


**When to use its:**
- You pushed something bad and want to undo it **without rewriting** history
- You're collaborating with others
- You want a clear, explicit "undo" commit
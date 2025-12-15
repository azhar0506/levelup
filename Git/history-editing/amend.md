# How to use git commit --amend

What it does
- Lets you change the last commit message
- Lets you add new files or change the last commit 
- **it does not remove files by itself - you nmust unstage/remove them first**

**Basic usage:**
- Change the message

```sh
git commit --amend
```

- Add more files to the last commit:

```sh
git add <file>
git commit --amend
```

Don't run both commands obviously. The first part changes the commit message. Second part, you can add/remove file and then commit the same commit message or modify it

**Important**
- Only works on the **most recent** commit.
- Creates a **new commit** (new hash)
- If already pushed, requires:

`git push --force`

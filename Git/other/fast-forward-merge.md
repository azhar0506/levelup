# Fast-Forward Merge

## What it does?
- fast-forward merge happens when the branch you are merging has no new commits compared to the target branch.
- Instead of creating a new merge commit, Git simply moves the pointer of the target branch forward to the latest commit fo the source branch
- **This can be confusing so avoid it and use the following commands to not use Fast-Forward Merge** (--no-ff when merging) 

## Diagram of what Fast-Forward Merge does

<img width="529" height="571" alt="image" src="https://github.com/user-attachments/assets/aa04f527-8460-442c-b3bf-e3b7db888f9b" />

1. Lets say this is how your commits currently look like.
2. If you were to merge `git merge feature`
3. Your commit will automatically fast forward and look like this:

<img width="370" height="555" alt="image" src="https://github.com/user-attachments/assets/88fa8b2a-88f8-4400-8f15-4d31f6a021d4" />

1. But you would rather it look like this:

<img width="346" height="569" alt="image" src="https://github.com/user-attachments/assets/c67d3948-b202-4d64-9deb-f76da65f0491" />

This is done by using this command `git merge feature --no-ff`

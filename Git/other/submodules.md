# How to use git submodule

## What it does
- A way to embed another Git repository inside your repo
- Tracks the submodule at a specific commit, not automatically updated
- Useful for pulling in external libraries or shared code

**Basic Usage**

- Add a submodule:

```sh
git submodule add <repo-url> <path>
```

- Clone a repo with submodules:
```sh
git clone <repo-url>
git submodule update --init --recursive
```

**Update a submodule**
- Pull latest commits inside the submodule

```sh
cd <submodule>
git pull
```

- Then commit the updated pointer in the parent repo:
```
cd ..
git add <submodule>
git commit -m "Update submodule"
```

**What it does not do**
- Does NOT auto-update when the parent repo updates
- Does NOT merge submodule code into your repo
- Does NOT track a branch automatically (tracks a commit)


**Common commands**
- Initialise submodules after cloning:
```sh
git submodule init
git submodule update
```

- Update all submodules:
```
git submodule update --remote --merge
```


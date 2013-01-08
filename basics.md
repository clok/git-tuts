Git Basics
==========

Config File (.gitconfig)
--------------------------
This is the basic config file that is globally set from the users home directory. (ex. /home/user/.gitconfig)

Minimal Contents:
```
[user]
	name = John Doe
	email = jdoe@oversee.net
```

Useful *[core]* attributes to use:
- *excludesfile* will allow you to set global ignore settings
- *editor* will let you set the editor git will use for commit messages and other prompts. The default editor is vi/vim and can be overwritten by the environment variable **EDITOR**.


Sample:
```
[user]
	name = John Doe
	email = jdoe@oversee.net
[core]
	excludesFile = /home/jdoe/.gitignore_global
	editor = emacs -nw
```

Git Ignore (.gitignore)
-------------------------
Include file extenstions, names and negations. You can set a global level ignore file in your *.gitconfig* and you can include a repo level *.gitignore* at the root of the repository.

Sample:
```
# Ignore compiled shared objects
*.so

# Ignore png image files
*.png

# Ignore a singular file
a_very_SpeciFic_file.name

# Ignore an entire directory and all sub dirs and files
etc/*

# Negate the ignore above for a portion of files within etc/
!etc/malarkey
!etc/malarkey/*
```

Note that if a file is commited to the repo and then it is added to the ignore list, git will continue to track it. If you want to remove it from tracking use ```git rm <file name>``` to remove the file from the repo and commit the changes.

Git Init
--------
Git manages a repo from the root directory down. To initialize a new repo, simply use ```git init```.  This will initialize a bare git repo in the directory. Any global configurations you have set will be applied to the newly initialized repo.

Git Clone
---------
```git clone <path to repo>``` is Similar in function to the ```svn checkout```, but it copy the repo to a local dir and will only commit to that local clone.  In order to commit local changes to the remote remote you cloned, you must perform a **push**.

Git Branch
----------
- ```git branch <name>``` will create a new named branch.
- ```git branch``` will list all local branches.
- ```git branch -r``` will list all remote branches.

Git Checkout
------------
- ```git checkout <branch name>``` will checkout a previously created branch.
- ```git checkout -B <branch name>``` will create and checkout a newly named branch.
- ```git checout --detach <branch_name``` will checkout a named branch (at the commit level) in a detatched state that is useful for inspection and experimentation. This will not have the ability to merge back into the repo unless the detatched head is renamed as a new branch.

Git Fetch/Merge/Pull
--------------------
- ```git fetch <remote path> <branch>``` will retrieve from an upate from a remote repo and store in *<remote name>/<branch name>* branch. This will typically default to ```git fetch origin <branch>```. If you want to specify the remote repo to pull from just use ```git fetch <remote> <branch name>```.
- ```git merge <branch name>``` will merge the input branch into the current branch.
- ```git pull <remote path> <branch name>``` is basically a **fetch + merge**. This will typically default to ```git pull origin <branch>```. If you want to specify the remote repo to pull from just use ```git fetch <remote> <branch name>```. Similar in function to ```svn update```.

Git Push
--------
The opposite of pull. This will attempt to push commited changes to a remote repo. This will typically default to ```git push origin <branch>```. If you want to specify the remote repo to pull from just use ```git push <remote> <branch name>```.

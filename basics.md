Git Basics
==========

Git Init
--------
Git manages a repo from the root directory down. To initialize a new repo, simply use ```git init```.  This will initialize a bare git repo in the directory. Any global configurations you have set will be applied to the newly initialized repo.

Git Status
----------


Git Add/Rm
----------


Git Commit
----------


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

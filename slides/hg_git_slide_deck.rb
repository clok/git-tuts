# encoding: utf-8

COLOR_END = "\e[0m"
WHITE = "\e[1m"
RED = "\033[0;31m"
GREEN = "\033[0;32m"
RED_BOLD = "\033[01;31m"

slide <<-EOS, :center
  #{WHITE}Git 101: An Introduction to Git#{COLOR_END}


  #{RED_BOLD}Derek Smith#{COLOR_END}
  
  Github: @clok
  Twitter: @cloksmith
EOS

# Agenda
section "The Agenda" do
  slide <<-EOS, :block
    #{WHITE}The Agenda
    ----------#{COLOR_END}
    1. Git Configuration
    2. Git Repo Basics
    3. Advanced Git
    4. Q & A

  EOS
end

slide <<-EOS, :center
  It is easy to shoot your foot off with git,
  but also easy to revert to a previous foot
  and merge it with your current leg.

  - Jack William Bell
EOS

# Basic Configuration
section "Basic Configuration Files" do
  slide <<-EOS, :block
    #{WHITE}Config File (.gitconfig)
    ------------------------#{COLOR_END}
    This is the basic config file that is globally set from the users home
    directory. (ex. /home/user/.gitconfig)

    You can add attributes to your .gitconfig by either editing the file
    directly or through CLI inputs.

    It is recommended that you set your user name and email address at a 
    global level.

  EOS

  slide <<-EOS, :block
    $:~/>#{WHITE} git config --global user.name "Derek Smith"#{COLOR_END}
    
    $:~/>#{WHITE} git config --global user.name#{COLOR_END}
    Derek Smith
    
    $:~/>#{WHITE} cat .gitconfig#{COLOR_END}
    [user]
       name = Derek Smith
       email = derek@clokwork.net
    
    $:~/>
  EOS

  slide <<-EOS, :block
    My typical .gitconfig
    
    [user]
       name = Derek Smith
       email = derek@clokwork.net
    [core]
       excludesFile = /home/derek/.gitignore_global
       editor = emacs -nw
    
  EOS

  slide <<-EOS, :block
    #{WHITE}Git Ignore (.gitignore)
    -----------------------#{COLOR_END}
    Include file extensions, names and negations. 

    You can set a global ignore if you like or you can add custom ignore files
    per repo.

    Cool site to generate common .gitignore files:
    #{WHITE}http://www.gitignore.io/#{COLOR_END}

  EOS

  slide <<-EOS, :block
    $:~/dev/malarkey/>#{WHITE} cat .gitognore#{COLOR_END}
    # Ignore compiled shared objects
    *.so
    
    # Ignore png image files
    *.png

    # Ignore a singular file
    a_very_SpeciFic_file.name

    # Ignore an entire directory and all sub dies and files
    etc/*

    # Negate the ignore above for a portion of files within etc/
    !etc/malarkey
    !etc/malarkey/*
    
    $:~/dev/malarkey/> 
  EOS
end

# Git Repo Basics
section "The Git Repo Basics" do
  slide <<-EOS, :block
    #{WHITE}Git Init
    --------#{COLOR_END}
    To initialize a new simply use 'git init'

    This will initialize an empty repo in the current working directory.

    Any global configurations you have set will be applied.
  EOS

  slide <<-EOS, :block
    $:~/my_repo/>#{WHITE} git init#{COLOR_END}
    Initialized empty Git repository in /home/derek/my_repo/.git/
    
    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    #{WHITE}Git Status
    ----------#{COLOR_END}
    Produces report of all modified, deleted and untracked files within a repo.

    Use this to determine what needs to be staged for commit.

    If a file meets the criteria in .gitignore then it will not be displayed in
    the status message.

  EOS

  slide <<-EOS, :block
    $:~/my_repo/>#{WHITE} git status#{COLOR_END}
    # On branch master
    #
    # Initial commit
    #
    # Untracked files:
    #   (use "git add <file>..." to include in what will be committed)
    #
    #	hello_git.txt
    nothing added to commit but untracked files present (use "git add" to track)

    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
$:~/github/git (git::edit-readme)>#{WHITE} git diff README\e[0em
diff --git a/README b/README
index 15a8e23..e5c9666 100644
--- a/README
+++ b/README
@@ -6,6 +6,7 @@

 "git" can mean anything, depending on your mood.

+ - The answer to all things.
  - random three-letter combination that is pronounceable, and not
    actually used by any common UNIX command.  The fact that it is a
    mispronunciation of "get" may or may not be relevant.
@@ -13,7 +14,6 @@
    dictionary of slang.
  - "global information tracker": you're in a good mood, and it actually
    works for you. Angels sing, and a light suddenly fills the room.
- - "goddamn idiotic truckload of sh*t": when it breaks

 Git is a fast, scalable, distributed revision control system with an
 unusually rich command set that provides both high-level operations
  EOS

  slide <<-EOS, :block
    #{WHITE}Git Add
    -------#{COLOR_END}
    Stage all modifications to previously committed files and to any new files
    that you want to add to the repo. 

    Performing this command on a directory will recursively add all files.

  EOS

  slide <<-EOS, :block
    $:~/my_repo/>#{WHITE} ls#{COLOR_END}
    hello_git.txt	new-file.pl	new-file.rb
    
    $:~/my_repo/>#{WHITE} git add new-file.*#{COLOR_END}
    $:~/my_repo/>#{WHITE} git status#{COLOR_END}
    # On branch master
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #	new file:   new-file.pl
    #	new file:   new-file.rb
    #

    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    #{WHITE}Git Commit
    ----------#{COLOR_END}
    Commit locally staged changes to the the local repo.
    
    Unlike 'svn commit' which will push to the shared repo.

    'git commit' will open the editor set in either the .gitconfig or by the
    'EDITOR' environment variable.

    After save & quiting the editor the commit will complete.

    Quiting the editor, w/o saving, will cancel the commit.

    '-m "<commit message>"'
    '-a' will automatically stage all tracked changes and commit them.
  EOS

  slide <<-EOS, :block
    $:~/my_repo/>#{WHITE} git commit -m "NEATO commit message"#{COLOR_END}
    [master (root-commit) 0bde0dd] Initial commit
    1 file changed, 1 insertion(+)
    create mode 100644 hello_git.txt
    
    $:~/my_repo/>#{WHITE} git log#{COLOR_END}
    commit 0bde0dddcc1107344e3bdbabc0cefb5a183c3a47
    Author: Derek Smith <derek@clokwork.net>
    Date:   Wed Jan 9 12:18:28 2013 -0800

        NEATO commit message
     
    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    #{WHITE}Git Rm
    ------#{COLOR_END}
    Remove a tracked file from version control and the file system.

    If a file is not tracked within the repo, 'git rm' will ignore the file.

   EOS

  slide <<-EOS, :block
    $:~/my_repo/>#{WHITE} ls#{COLOR_END}
    hello_git.txt  file_to_delete
    
    $:~/my_repo/>#{WHITE} git rm file_to_delete #{COLOR_END}
    rm 'file_to_delete'
    
    $:~/my_repo/>#{WHITE} git status#{COLOR_END}
    # On branch master
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #	deleted:    file_to_delete
    #
    
    $:~/my_repo/>#{WHITE} git commit -m "Removed file_to_delete from repo"#{COLOR_END}
    [master 40f4fd4] Removed file_to_delete from repo
     1 file changed, 1 deletion(-)
     delete mode 100644 file_to_delete
    
    $:~/my_repo/>#{WHITE} ls#{COLOR_END}
    hello_git.txt
    
    $:~/my_repo/> 
  EOS
end

section "Basic Recap" do
  slide <<-EOS, :block
#{WHITE}Basic Workflow
--------------#{COLOR_END}
1. #{WHITE}git status#{COLOR_END} to view all files changed, untracked or deleted.
2. #{WHITE}git diff <file>#{COLOR_END} to view the delta to be committed.
3. #{WHITE}git add <file>#{COLOR_END} to add file to staging area.
4. #{WHITE}git commit -m "<commit msg>"#{COLOR_END}
  EOS
end

section "Cloning a Repository" do
  slide <<-EOS, :center
    THIS IS A PLACE HOLDER
  EOS

  slide <<-EOS, :block

# Clone a repository from a remote
$:~/github>#{WHITE} git clone git@github.com:git/git.git#{COLOR_END}
Cloning into 'git'...
remote: Counting objects: 174834, done.
remote: Compressing objects: 100% (47397/47397), done.
remote: Total 174834 (delta 126246), reused 173754 (delta 125426)
Receiving objects: 100% (174834/174834), 61.75 MiB | 6.89 MiB/s, done.
Resolving deltas: 100% (126246/126246), done.
Checking connectivity... done.

$:~/github>#{WHITE} ls#{COLOR_END}
git   scrimps
  EOS

  slide <<-EOS, :block
$:~/github>#{WHITE} cd git#{COLOR_END}
$:~/github/git (git::master)>#{WHITE} git status#{COLOR_END}
On branch master
Your branch is up-to-date with 'origin/master'.

nothing to commit, working directory clean

$:~/github/git (git::master)>#{WHITE} git remote -v#{COLOR_END}
origin  git@github.com:git/git.git (fetch)
origin  git@github.com:git/git.git (push)

$:~/github/git (git::master)>#{WHITE} git branch -a#{COLOR_END}
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/maint
  remotes/origin/master
  remotes/origin/next
  remotes/origin/pu
  remotes/origin/todo

  EOS
end

section "Branching & Tracking" do
  slide <<-EOS, :block
    #{WHITE}Git Branch
    ----------#{COLOR_END}
    Branching is fast and simple within git.

    Entire branch structure is contained within the repo.
  EOS

  slide <<-EOS, :block
    # Create a new branch named 'features'
    $:~/my_repo/ (git::master)>#{WHITE} git branch features#{COLOR_END}
    
    # List all local branches
    $:~/my_repo/ (git::master)>#{WHITE} git branch#{COLOR_END}
      feature
    * master

    # List all remote branches
    $:~/dev/malarkey (git::master)>#{WHITE} git branch -r#{COLOR_END}
      stash/master
      stash/v4
      origin/master
      origin/v4

  EOS

  slide <<-EOS, :block

$:~/my_repo/ (git::master)>#{WHITE} git remote -v#{COLOR_END}
origin  git@github.com:clok/scrimps.git (fetch)
origin  git@github.com:clok/scrimps.git (push)
stash ssh://git@stash.phmgmt.com:7999/~derek/scrimps.git (fetch)
stash ssh://git@stash.phmgmt.com:7999/~derek/scrimps.git (push)

$:~/my_repo/ (git::master)>#{WHITE} git branch -vv#{COLOR_END}
  demo          2ca62eb [stash/demo: behind 1] added sql hackery
* master        175fa5f [origin/master] simplified autoGit and added a new script
  bugfix        29017c1 fixed branch bug
  ta            175fa5f [stash/test-alias] simplified autoGit and added a new script
  test-alias    175fa5f [stash/test-alias] simplified autoGit and added a new script
  woot          dc11003 [stash/woot] added new script for converting bare repo to stash

  EOS
end

section "Git Checkout" do
  slide <<-EOS, :block
    #{WHITE}Git Checkout
    ------------#{COLOR_END}
    Switch to another working branch. 
  EOS

  slide <<-EOS, :block
    # Checkout a previously created branch.
    $:~/my_repo/>#{WHITE} git checkout <branch name>#{COLOR_END}

    # Create and checkout a newly named branch.
    $:~/my_repo/>#{WHITE} git checkout -B <branch name>#{COLOR_END}
    
    # Discard any uncommitted modifications and move the file back to the HEAD.
    $:~/my_repo/>#{WHITE} git checkout -- <file name>#{COLOR_END} 

  EOS
end

section "Now to bring the fun ..." do
  slide <<-EOS, :block
    #{WHITE}Git Clone
    ---------#{COLOR_END}
    The essential git command. 

    Similar to 'svn checkout' in that it will locally clone a remote repo.

    This major difference is that once a repo is cloned, all commits remain
    local until explicitly pushed to the remote origin.

    #{WHITE}git clone <path to repo>#{COLOR_END}
  EOS

  slide <<-EOS, :block
    $:~/dev/>#{WHITE} git clone clokwork.net:/home/derek/repos/git-demo.git#{COLOR_END}
    Initialized empty Git repository in /home/derek/dev/git-demo/.git
    Checking out files: 100% (113/113), done.

  EOS

  slide <<-EOS, :block
    #{WHITE}Git Remote
    ----------#{COLOR_END}
    The next essential git command.

    Remote allows you to add and remove remote repo paths.

    Essential for synchronizing multiple machines and repos.

  EOS

  slide <<-EOS, :block
    # Add a new remote repo
    $:~/stash/git-demo/>#{WHITE} git remote add github git@github.com:clok/git-tuts.git#{COLOR_END}

    # List all remote linked repos
    $:~/stash/git-demo/>#{WHITE} git remote -v#{COLOR_END}
    github	git@github.com:clok/git-tuts.git (fetch)
    github	git@github.com:clok/git-tuts.git (push)
    origin	derek@clokwork.net:/mnt/repos/git-demo.git (fetch)
    origin	derek@clokwork.net:/mnt/repos/git-demo.git (push)

    # Remove a remote repo link
    $:~/stash/git-demo/>#{WHITE} git remote rm github#{COLOR_END}
  EOS

  slide <<-EOS, :block
    #{WHITE}Git Fetch
    ---------#{COLOR_END}
    Check and retrieve an update from a remote repo and branch.

    The update will be stored in a branch called '<remote>/<branch>'
    
    # Fetch all remote/branches
    #{WHITE}git fetch#{COLOR_END}

    # Fetch only a specific remote/branch
    #{WHITE}git fetch <remote name> <branch name>#{COLOR_END}

  EOS

  slide <<-EOS, :block
    #{WHITE}Git Merge
    ---------#{COLOR_END}
    Straight forward, merge branch into current working branch.

    Git merges are VERY fast.

    By default, git will attempt to "fast-forward" the merge.

    A fast-forward merge is a merge where the pointers are adjusted, but no
    merge commit is created.

    Use '--no-ff' to have a merge commit created.
  EOS

  slide <<-EOS, :block
    # Perform the fetch 
    $:~/github/redis/>#{WHITE} git fetch origin unstable#{COLOR_END}
    From git://github.com/antirez/redis
     * branch            unstable   -> FETCH_HEAD

    # Then merge the fetched code
    $:~/github/redis/>#{WHITE} git merge origin/unstable#{COLOR_END}
    Updating be6cbd3..d7740fc
    Fast-forward
     CONTRIBUTING                                                   |    7 ++
     COPYING                                                        |    2 +-
    ...
     utils/install_server.sh                                        |    2 +
    132 files changed, 4403 insertions(+), 1007 deletions(-)
  EOS

  slide <<-EOS, :block
    #{WHITE}Git Pull
    --------#{COLOR_END}
    Basically a 'fetch + merge'

    Similar in function to 'svn update'
  EOS

  slide <<-EOS, :block
    # Perform the pull 
    $:~/github/redis/>#{WHITE} git pull origin unstable#{COLOR_END}
    remote: Counting objects: 9, done.
    remote: Compressing objects: 100% (5/5), done.
    remote: Total 7 (delta 4), reused 5 (delta 2)
    Unpacking objects: 100% (7/7), done.
    From git://github.com/antirez/redis
       776d987..a785986  master     -> origin/unstable
    Updating 776d987..a785986
    Fast-forward
     README.markdown |   28 ++++++++++++++++++++++++++++
     1 file changed, 28 insertions(+)
  EOS

  slide <<-EOS, :block
    #{WHITE}Git Push
    --------#{COLOR_END}
    Attempt to push all commits in local repo to remote repo.

    Similar in function to 'svn commit'
  EOS

  slide <<-EOS, :block
    # Perform the push
    $:~/github/git-demo/>#{WHITE} git push github master#{COLOR_END}
    Counting objects: 8, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 4.00 KiB, done.
    Total 5 (delta 3), reused 0 (delta 0)
    To git@github.com:clok/git-tuts.git
       20f47b7..9b404fb  master -> master
  EOS
end

section "... More Advanced Fun ..." do
  slide <<-EOS, :block
    #{WHITE}Bare Clone Repository
    ---------------------#{COLOR_END}
    Makes a publishable form of a repo.

    Preferable method for sharing a codebase among multiple developers.

    #{WHITE}git clone --bare <path to repo>#{COLOR_END}

  EOS

  slide <<-EOS, :block
    # Create a bare repository
    $:~/>#{WHITE} git clone --bare /home/my/codebase/ /remote/repos/codebase.git#{COLOR_END}
  EOS

  slide <<-EOS, :block
    #{WHITE}Submodules
    ----------#{COLOR_END}
    An external repo you want to use within another repo.

    NOTE:
    External code under git version control should NEVER be copied to a local repo.

    Use 'git submodule' to link the desired external code to your repo.

    If you need to modify the code in the submodule, then fork it and have a blast!
  EOS

  slide <<-EOS, :block
    $:~/my_repo/>#{WHITE} git submodule add git@github.com:clok/tt.git my-submodule#{COLOR_END}
    Cloning into 'my-submodule'...
    remote: Counting objects: 35, done.
    remote: Compressing objects: 100% (27/27), done.
    remote: Total 35 (delta 10), reused 23 (delta 3)
    Receiving objects: 100% (35/35), 5.30 KiB, done.
    Resolving deltas: 100% (10/10), done.
    
    $:~/my_repo/>#{WHITE} cat .gitmodules#{COLOR_END}
    [submodule "my-submodule"]
        path = my-submodule
        url = git@github.com:clok/tiny-timer.git
    
    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    #{WHITE}Cloning with Submodules
    -----------------------#{COLOR_END}
    $:~/some/dir>#{WHITE} git clone --recursive <path to repo/>#{COLOR_END}

    Or

    # Clone the repo
    $:~/some/dir>#{WHITE} git clone <path to repo/>#{COLOR_END}

    # Initialize all submodules in the .gitmodules file
    $:~/some/dir>#{WHITE} git submodule init#{COLOR_END}

    # Fetch the code for the submodules
    $:~/some/dir>#{WHITE} git submodule update#{COLOR_END}

  EOS

  slide <<-EOS, :block
    #{WHITE}The Stash Hash
    --------------#{COLOR_END}
    The #{WHITE}git stash#{COLOR_END} command will move unstaged changes to stash hash
    within the local repo.

    This will reset the repo back to HEAD. 

    A useful tool when merge conflicts arise or you just want to quickly discard
    changes. 

    The stash hash can be accessed at anytime within git and will always be
    there unless you drop the stash.
  EOS

  slide <<-EOS, :block
    # Move uncommitted changes to stash hash
    $:~/my_repo/>#{WHITE} git stash#{COLOR_END}
    Saved working directory and index state WIP on master: 42b6efc Added sanitize functions for table mode in Parser.pm
    HEAD is now at 42b6efc Added sanitize functions for table mode in Parser.pm
    
    # List all available stash objects
    $:~/my_repo/>#{WHITE} git stash list#{COLOR_END}
    stash@{0}: WIP on master: 42b6efc Added sanitize functions for table mode in Parser.pm
    stash@{1}: WIP on v4: 4bfd79e Updated documentation for DeviceAtlas.pm
    stash@{2}: WIP on master: 3fa9ee6 Added logging
    stash@{3}: WIP on v2.0: f8f1f98 Testing out RedisDB.pm
    
  EOS

  slide <<-EOS, :block
    #{WHITE}Detached Checkout
    -----------------#{COLOR_END}
    Checkout a named branch in a detached state.

    Will not have the ability to commit back to the repo unless given a name.

    Useful for code inspection and experimentation.

    #{WHITE}git checkout <commit>#{COLOR_END}
  EOS

  slide <<-EOS, :block
    $:~/my_repo/>#{WHITE} git checkout f14c2d8240e7861902d4d0d481b9a04f3e567b3c#{COLOR_END}
    Note: checking out 'f14c2d8240e7861902d4d0d481b9a04f3e567b3c'.

    You are in 'detached HEAD' state. You can look around, make experimental
    changes and commit them, and you can discard any commits you make in this
    state without impacting any branches by performing another checkout.

    If you want to create a new branch to retain commits you create, you may
    do so (now or later) by using -b with the checkout command again. Example:

      git checkout -b new_branch_name

    HEAD is now at f14c2d8... Added analytics_table.pl build scripts
  EOS

  slide <<-EOS, :block
    #{WHITE}Rebase a.k.a. Squash
    --------------------#{COLOR_END}
    #{WHITE}Note:#{COLOR_END} Do not squash commits that you've already shared with others.
    You're changing history and it will cause trouble for others.

    The most common use of this command is to take many commits and "squash"
    them into one mega commit.

    This can be useful in keeping a clean commit history, but it does remove the
    meta-data associated with the commits within.

  EOS
end

section "Thank you! Questions?" do
end

__END__

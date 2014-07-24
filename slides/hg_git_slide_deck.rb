# encoding: utf-8

COLOR_END = "\e[0m"
WHITE = "\e[1m"
RED = "\033[0;31m"
GREEN = "\033[0;32m"
BLUE = "\033[01;34m"
RED_BOLD = "\033[01;31m"

def header(str, color)
  line = ''
  str.length.times do
    line += '-'
  end
  Kernel.const_get(color.upcase) + str + "\n" + line + COLOR_END
end

slide <<-EOS, :center
  #{WHITE}Git 101: An Introduction to Git#{COLOR_END}


  #{RED_BOLD}Derek Smith#{COLOR_END}
  
  Github: #{BLUE}@clok#{COLOR_END}
  Twitter: #{BLUE}@cloksmith#{COLOR_END}
EOS

# Agenda
section "- The Agenda -" do
  slide <<-EOS, :block
#{header('The Agenda', 'blue')}
1. Paradigm Differences
2. Configuration
3. Basic Workflow 
4. Working with Remote Repos
5. Branch & Tracking
6. Q & A

  EOS
end

section "Paradigm Differences" do
  slide <<-EOS, :block
#{header("Between Mercurial & Git", 'blue')}
1. Cloning - get it all, but not in extracted form
2. Only sync current working branch (by default)
3. Keeping branches local is an easy possibility
4. Pre commit staging area
5. #{WHITE}hg subrepo#{COLOR_END} #{RED_BOLD}!=#{COLOR_END} #{WHITE}git submodule#{COLOR_END}
  EOS

    slide <<-EOS, :block
#{header("Between SVN & Git", 'blue')}
1. Pretty much everything.
2. Trunk/Sandbox vs. Repo/Branches
3. Branching & Merging are CHEAP
4. Pre commit staging area
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
#{header("Config File (.gitconfig)", 'white')}
This is the basic config file that is globally set from the users home
directory. (ex. #{WHITE}/home/user/.gitconfig#{COLOR_END})

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
    My typical #{WHITE}.gitconfig#{COLOR_END}
    
    [user]
       name = Derek Smith
       email = derek@clokwork.net
    [core]
       excludesFile = /home/derek/.gitignore_global
       editor = emacs -nw
    
  EOS

  slide <<-EOS, :block
#{header("Git Ignore (.gitignore)", 'white')}
Include file extensions, names and negations. 

You can set a global ignore if you like or you can add custom ignore files
per repo.

Cool site to generate common #{WHITE}.gitignore#{COLOR_END} files:
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
#{header("Git Init", 'white')}
To initialize a new repo simply use #{WHITE}git init#{COLOR_END}

This will initialize an empty repo in the current working directory.

Any global configurations you have set will be applied.
  EOS

  slide <<-EOS, :block
    $:~/my_repo/>#{WHITE} git init#{COLOR_END}
    Initialized empty Git repository in /home/derek/my_repo/.git/
    
    $:~/my_repo/ #{RED_BOLD}(git::master)#{COLOR_END}> 
  EOS

  slide <<-EOS, :block
#{header("Git Status", 'white')}
Produces report of all modified, deleted and untracked files within a repo.

Use this to determine what needs to be staged for commit.

If a file meets a criterion in #{WHITE}.gitignore#{COLOR_END} then it will not be displayed in
the status message unless it tracked within the repo.

  EOS

  slide <<-EOS, :block
    $:~/my_repo/ #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git status#{COLOR_END}
    On branch master

      Initial commit

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

        #{RED}hello_git.txt#{COLOR_END}

    nothing added to commit but untracked files present (use "git add" to track)

    $:~/my_repo/ #{RED_BOLD}(git::master)#{COLOR_END}> 
  EOS

  slide <<-EOS, :block
#{header("Git Diff", 'white')}#{COLOR_END}
Produces diff of all modified tracked files within a repo.

Use this to determine what changes will be staged for commit.

You can designate a specific diff tool in the #{WHITE}.gitconfig#{COLOR_END}

#{BLUE}View diff of unstaged changes#{COLOR_END}
#{WHITE}git diff#{COLOR_END}

#{BLUE}View diff of staged changes#{COLOR_END}
#{WHITE}git diff --cached#{COLOR_END}
  EOS

  slide <<-EOS, :block
#{BLUE}View diff of unstaged changes#{COLOR_END}

$:~/github/git #{RED_BOLD}(git::edit-readme)#{COLOR_END}>#{WHITE} git diff README#{COLOR_END}
#{WHITE}diff --git a/README b/README
index 15a8e23..e5c9666 100644
--- a/README
+++ b/README#{COLOR_END}
#{BLUE}@@ -6,6 +6,7 @@#{COLOR_END}

 "git" can mean anything, depending on your mood.

#{GREEN}+ - The answer to all things.#{COLOR_END}
  - random three-letter combination that is pronounceable, and not
    actually used by any common UNIX command.  The fact that it is a
    mispronunciation of "get" may or may not be relevant.
#{BLUE}@@ -13,7 +14,6 @@#{COLOR_END}
    dictionary of slang.
  - "global information tracker": you're in a good mood, and it actually
    works for you. Angels sing, and a light suddenly fills the room.
#{RED}- - "goddamn idiotic truckload of sh*t": when it breaks#{COLOR_END}

 Git is a fast, scalable, distributed revision control system with an
 unusually rich command set that provides both high-level operations
  EOS

  slide <<-EOS, :block
#{header("Git Add", 'white')}#{COLOR_END}
Stage all modifications to previously committed files and to any new files
that you want to add to the repo. 

Performing this command on a directory will recursively add all files.

  EOS

  slide <<-EOS, :block
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}>#{WHITE} ls#{COLOR_END}
    hello_git.txt	new-file.pl	modified-file.rb
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}>#{WHITE} git status#{COLOR_END}
    On branch demo
    
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
      (commit or discard the untracked or modified content in submodules)

        #{RED}modified:   modified-file.rb#{COLOR_END}

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

        #{RED}new file:   new-file.pl#{COLOR_END}

    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}> 
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}>#{WHITE} git add new-file.* modified-file.rb#{COLOR_END}
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}>#{WHITE} git status#{COLOR_END}
    On branch demo
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)
    
        #{GREEN}modified:   modified-file.rb
        new file:   new-file.pl#{COLOR_END}

    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}> 
  EOS

  slide <<-EOS, :block
#{header("Git Commit", 'white')}
Commit locally staged changes to the the local repo.

#{WHITE}git commit#{COLOR_END} will open the editor set in either the
.gitconfig or by the 'EDITOR' environment variable.

After save & quiting the editor the commit will completed.

Quiting the editor, w/o saving, will cancel the commit.
  EOS

  slide <<-EOS, :block
    $:~/my_repo/ #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git commit -m "NEATO commit message"#{COLOR_END}
    [master (root-commit) 0bde0dd] Initial commit
    1 file changed, 1 insertion(+)
    create mode 100644 hello_git.txt
    
    $:~/my_repo/ #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git log#{COLOR_END}
    commit 0bde0dddcc1107344e3bdbabc0cefb5a183c3a47
    Author: Derek Smith <derek@clokwork.net>
    Date:   Wed Jan 9 12:18:28 2013 -0800

        NEATO commit message
     
    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
#{header("Git Rm", 'white')}
Remove a tracked file from version control and the file system.

If a file is not tracked within the repo, #{WHITE}git rm#{COLOR_END} will ignore the file.

   EOS

  slide <<-EOS, :block
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}>#{WHITE} ls#{COLOR_END}
    hello_git.txt  file_to_delete
    
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}>#{WHITE} git rm file_to_delete #{COLOR_END}
    rm 'file_to_delete'
    
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}>#{WHITE} git status#{COLOR_END}
    On branch demo
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

        #{GREEN}deleted:    file_to_delete#{COLOR_END}
    
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}>#{WHITE} git commit -m "Removed file_to_delete from repo"#{COLOR_END}
    [demo 40f4fd4] Removed file_to_delete from repo
     1 file changed, 1 deletion(-)
     delete mode 100644 file_to_delete
    
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}>#{WHITE} ls#{COLOR_END}
    hello_git.txt
    
    $:~/my_repo/ #{RED_BOLD}(git::demo)#{COLOR_END}> 
  EOS

  slide <<-EOS, :block
#{header("Git Help", 'white')}
Each git command is like a Swiss Army knife.

#{GREEN}git checkout#{COLOR_END} = #{BLUE}hg branch#{COLOR_END} + #{BLUE}hg update#{COLOR_END} + #{BLUE}hg revert#{COLOR_END}

So, using #{WHITE}git help <cmd>#{COLOR_END} is always advised when you have
questions... Oh, and your peers... and Google... 
  EOS
end

section "Let's Recap" do
  slide <<-EOS, :block
#{header("Basic Workflow", 'blue')}
1. #{WHITE}git status#{COLOR_END} to view all files changed, untracked or deleted.
2. #{WHITE}git diff <file>#{COLOR_END} to view the delta to be committed.
3. #{WHITE}git add <file>#{COLOR_END} to add file to staging area.
4. #{WHITE}git commit -m "<commit msg>"#{COLOR_END}
  EOS
end

section "Working with a Remote Repository" do
  slide <<-EOS, :block
                 -___________-
                #{RED_BOLD}(#{COLOR_END}/     _     \\#{RED_BOLD})#{COLOR_END}
                /_____(#{BLUE}O#{COLOR_END})_____\\
                // / / | \\ \\ \\\\
               =================
               // / | | | | \\ \\\\      "COLLABORATE! COLLABORATE!"
              ===================    /
             //// || || || || \\\\\\\\
             |||| || || || || ||||
            /---___-----------,---\\
            |  /   \\         -o-  |
            /  \\___/          '   \\
            +---------------------+
           /_   __    ___    __   _\\
          (__) (__)  (___)  (__) (__)
          |_    __    ___    __    _|
         (__)  (__)  (___)  (__)  (__) 
         /_    ___    ___    ___    _\\ 
        (__)  (___)  (___)  (___)  (__) 
        |_     ___    ___    ___     _| 
       (__)   (___)  (___)  (___)   (__)   
       /_______________________________\\
  EOS

  slide <<-EOS, :block
#{header("Clone a repository from a remote", 'blue')}

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
$:~/github/git #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git status#{COLOR_END}
On branch master
Your branch is up-to-date with 'origin/master'.

nothing to commit, working directory clean

$:~/github/git #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git remote -v#{COLOR_END}
origin  git@github.com:git/git.git (fetch)
origin  git@github.com:git/git.git (push)

$:~/github/git #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git branch -a#{COLOR_END}
#{GREEN}* master#{COLOR_END}
  #{RED}remotes/origin/HEAD -> origin/master
  remotes/origin/maint
  remotes/origin/master
  remotes/origin/next
  remotes/origin/pu
  remotes/origin/todo#{COLOR_END}

  EOS

  slide <<-EOS, :block
#{header("Git Fetch", 'white')}
Retrieve updates from a remote repo.
    
# Fetch all remote/branches
#{WHITE}git fetch#{COLOR_END}

# Fetch only a specific remote/branch
#{WHITE}git fetch <remote alias> <branch name>#{COLOR_END}

  EOS

  slide <<-EOS, :block
#{header("Git Merge", 'white')}
Straight forward, merge branch into current working branch.

Git merges are VERY fast and VERY cheap.

By default, git will attempt to #{BLUE}fast-forward#{COLOR_END} the merge.

A #{BLUE}fast-forward#{COLOR_END} merge will not create a merge commit. It will fail if there
are any merge conflicts.

Use #{WHITE}--no-ff#{COLOR_END} to have a merge commit created.
  EOS

  slide <<-EOS, :block
#{BLUE}Perform the fetch#{COLOR_END}
$:~/github/redis/ #{RED_BOLD}(git::unstable)#{COLOR_END}>#{WHITE} git fetch origin unstable#{COLOR_END}
From github.com:antirez/redis
 * branch            unstable   -> FETCH_HEAD

#{BLUE}Check the status#{COLOR_END}
$:~/github/redis/ #{RED_BOLD}(git::unstable)#{COLOR_END}>#{WHITE} git status#{COLOR_END}
On branch unstable
Your branch is behind 'origin/unstable' by 3 commits, and can be fast-forwarded.
  (use "git pull" to update your local branch)

nothing to commit, working directory clean

#{BLUE}Perform the merge#{COLOR_END}
$:~/github/redis/ #{RED_BOLD}(git::unstable)#{COLOR_END}>#{WHITE} git merge origin unstable#{COLOR_END}
Updating b9bb7e2..7eb47ae
Fast-forward
 src/hyperloglog.c |  12 #{GREEN}+++++++++#{COLOR_END}#{RED}--#{COLOR_END}
 src/util.c        | 102 #{GREEN}++++++++++++++++++++++++++++++++++++++++++#{COLOR_END}#{RED}----------#{COLOR_END}
 2 files changed, 91 insertions(+), 23 deletions(-)
  EOS

  slide <<-EOS, :block
#{header("Git Pull", 'white')}
A #{WHITE}'fetch + merge'#{COLOR_END} in one command.

This is not recommended for standard use when working with an active codebase.
  EOS

  slide <<-EOS, :block
#{header("Perform the pull", 'blue')}

$:~/github/redis/ #{RED_BOLD}(git::unstable)#{COLOR_END}>#{WHITE} git pull origin unstable#{COLOR_END}
remote: Counting objects: 9, done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 7 (delta 4), reused 5 (delta 2)
Unpacking objects: 100% (7/7), done.
From git://github.com/antirez/redis
    776d987..a785986  master     -> origin/unstable
Updating 776d987..a785986
Fast-forward
  README.markdown |   28 #{GREEN}++++++++++++++++++++++++++++#{COLOR_END}
  1 file changed, 28 insertions(+)

$:~/github/redis/ #{RED_BOLD}(git::unstable)#{COLOR_END}>
  EOS

  slide <<-EOS, :block
#{header("Git log", 'white')}

#{WHITE}git log#{COLOR_END} is a versitile command for viewing local and remote history.

Standard command will open the commit history for the working branch that
is interactive and serachable.

  EOS

  slide <<-EOS, :block
#{header("View incoming commits from a branch (can be remote)", 'blue')}

$:~/github/fast-export #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git fetch origin master#{COLOR_END}
From github.com:frej/fast-export
 * branch            master     -> FETCH_HEAD

$:~/github/fast-export #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git log HEAD..origin/master#{COLOR_END}
#{BLUE}commit 1d85321bdb35cfe7c056ca4c6249d252348a1fec#{COLOR_END}
Author: Piotr Święcicki <swietopel@gmail.com>
Date:   Tue Apr 22 23:00:44 2014 +0200

    Annotate commits with the hg hash as git notes in the hg namespace

    If the --hg-hash argument is given, the converted commits are
    annotated with the original hg hash as a git note in the "hg"
    namespace.

    The notes can be shown by git log using the "--notes=hg" argument.
  EOS

  slide <<-EOS, :block
#{header("View outgoing commits from a branch (can be remote)", 'blue')}

$:~/github/fast-export #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git log origin/master..HEAD#{COLOR_END}
#{BLUE}commit cda7e0d684652d077c9b5b9c89e13dce8733d4ee#{COLOR_END}
Author: Derek Smith <derek@clokwork.net>
Date:   Mon Jul 21 21:52:02 2014 -0500

    Added a new .tmp file for some reason

$:~/github/fast-export #{RED_BOLD}(git::master)#{COLOR_END}>
  EOS

  slide <<-EOS, :block
#{WHITE}Git Push
--------#{COLOR_END}
Attempt to push all commits in local repo to remote repo.

This will fail if the remote repo is ahead of the local repo.

  EOS

  slide <<-EOS, :block
#{header("Perform a push", 'blue')}

$:~/github/git-demo/ #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git push github master#{COLOR_END}
Counting objects: 8, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 4.00 KiB, done.
Total 5 (delta 3), reused 0 (delta 0)
To git@github.com:clok/git-tuts.git
    20f47b7..9b404fb  master -> master

$:~/github/git-demo/ #{RED_BOLD}(git::master)#{COLOR_END}>
  EOS
end

section "Let's Recap... Again" do
  slide <<-EOS, :block
#{header("Remote Workflow", 'blue')}

# Incoming
1. #{WHITE}git fetch#{COLOR_END} to retrieve changesets from remote.
2. #{WHITE}git log <local_branch>..<remote/local_branch>#{COLOR_END} to view incoming commits.
3. #{WHITE}git merge#{COLOR_END} to merge the retrieved changeset.

# Outgoing
1. #{WHITE}git log <remote/local_branch>..<local_branch>#{COLOR_END} to view outgoing commits.
2. #{WHITE}git push <remote_alias> <branch>#{COLOR_END} to push committed changes to remote.
  EOS
end

section "Branching & Tracking" do
  slide <<-EOS, :block
#{header("Git Branch", 'white')}
Branching is fast and simple within git.

When a remote branch is checked out on a local copy it forms a tracked pair
with the local and remote branch.

What this means is that you will be notfied of branch changes on the remote
after the changes have been fetched.

If you create a new local branch and push your changes, it will default to
a tracked branch on the remote you pushed to.
  EOS

  slide <<-EOS, :block
    # Create a new branch named 'features'
    $:~/my_repo/ #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git branch features#{COLOR_END}
    
    # List all local branches
    $:~/my_repo/ #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git branch#{COLOR_END}
      feature
    #{GREEN}* master#{COLOR_END}

    # List all remote branches
    $:~/dev/malarkey #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git branch -r#{COLOR_END}
      #{RED}stash/master
      stash/v4
      origin/master
      origin/v4#{COLOR_END}

  EOS

  slide <<-EOS, :block

$:~/my_repo/ #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git remote -v#{COLOR_END}
origin  git@github.com:clok/scrimps.git (fetch)
origin  git@github.com:clok/scrimps.git (push)
stash ssh://git@stash.phmgmt.com:7999/~derek/scrimps.git (fetch)
stash ssh://git@stash.phmgmt.com:7999/~derek/scrimps.git (push)

$:~/my_repo/ #{RED_BOLD}(git::master)#{COLOR_END}>#{WHITE} git branch -vv#{COLOR_END}
  demo          2ca62eb [#{BLUE}stash/demo#{COLOR_END}: behind 1] added sql hackery
#{GREEN}* master#{COLOR_END}        175fa5f [#{BLUE}origin/master#{COLOR_END}] simplified autoGit and added a new script
  bugfix        29017c1 fixed branch bug
  ta            175fa5f [#{BLUE}stash/test-alias#{COLOR_END}] simplified autoGit and added a new script
  test-alias    175fa5f [#{BLUE}stash/test-alias#{COLOR_END}] simplified autoGit and added a new script
  woot          dc11003 [#{BLUE}stash/woot#{COLOR_END}] added new script for converting bare repo to stash

  EOS
end

section "Git Checkout" do
  slide <<-EOS, :block
#{header("Git Checkout", 'white')}

Remember the Swiss Army Knife comment earlier?

#{GREEN}git checkout#{COLOR_END} = #{BLUE}hg branch#{COLOR_END} + #{BLUE}hg update#{COLOR_END} + #{BLUE}hg revert#{COLOR_END}

  EOS

  slide <<-EOS, :block
# Checkout a previously created branch.
$:~/my_repo/>#{WHITE} git checkout <branch name>#{COLOR_END}

# Create and checkout a newly named branch.
# #{RED}(will break if branch already exist)#{COLOR_END}
$:~/my_repo/>#{WHITE} git checkout -b <branch name>#{COLOR_END}

# Create and checkout a newly named branch
# #{RED}(will checkout branch if already exist)#{COLOR_END}
$:~/my_repo/>#{WHITE} git checkout -B <branch name>#{COLOR_END}
    
# Discard any uncommitted modifications and move the file back to the HEAD.
$:~/my_repo/>#{WHITE} git checkout -- <file name>#{COLOR_END} 

# Checkout a specific commit to a #{RED_BOLD}detached HEAD#{COLOR_END} state
$:~/my_repo/>#{WHITE} git checkout <commit>#{COLOR_END}

  EOS
end

section "Some fun tools to use ..." do
  slide <<-EOS, :block
#{header("The Stash Hash", 'white')}
The #{WHITE}git stash#{COLOR_END} command will move unstaged changes to stash hash
within the local repo.

This will reset the repo back to #{RED_BOLD}HEAD#{COLOR_END}. 

A useful tool when merge conflicts arise or you just want to quickly discard
changes. 

The stash hash can be accessed at anytime within git and will always be
there unless you drop the stash.
  EOS

  slide <<-EOS, :block
    #{BLUE}Move uncommitted changes to stash hash#{COLOR_END}

    $:~/my_repo/>#{WHITE} git stash#{COLOR_END}
    Saved working directory and index state WIP on master: 42b6efc Added sanitize functions for table mode in Parser.pm
    HEAD is now at 42b6efc Added sanitize functions for table mode in Parser.pm
    
    #{BLUE}List all available stash objects#{COLOR_END}

    $:~/my_repo/>#{WHITE} git stash list#{COLOR_END}
    stash@{0}: WIP on master: 42b6efc Added sanitize functions for table mode in Parser.pm
    stash@{1}: WIP on v4: 4bfd79e Updated documentation for DeviceAtlas.pm
    stash@{2}: WIP on master: 3fa9ee6 Added logging
    stash@{3}: WIP on v2.0: f8f1f98 Testing out RedisDB.pm
    
  EOS

  slide <<-EOS, :block
#{header("Git Remote", 'white')}

Remote allows you to add and remove remote repo paths.

  EOS

  slide <<-EOS, :block
    #{BLUE}Add a new remote repo#{COLOR_END}

    $:~/stash/git-demo/>#{WHITE} git remote add github git@github.com:clok/git-tuts.git#{COLOR_END}

    #{BLUE}List all remote linked repos#{COLOR_END}

    $:~/stash/git-demo/>#{WHITE} git remote -v#{COLOR_END}
    github  git@github.com:clok/git-tuts.git (fetch)
    github  git@github.com:clok/git-tuts.git (push)
    origin  derek@clokwork.net:/mnt/repos/git-demo.git (fetch)
    origin  derek@clokwork.net:/mnt/repos/git-demo.git (push)

    #{BLUE}Remove a remote repo link#{COLOR_END}

    $:~/stash/git-demo/>#{WHITE} git remote rm github#{COLOR_END}
    $:~/stash/git-demo/>#{WHITE} git remote -v#{COLOR_END}
    origin  derek@clokwork.net:/mnt/repos/git-demo.git (fetch)
    origin  derek@clokwork.net:/mnt/repos/git-demo.git (push)
  EOS

  slide <<-EOS, :block
#{header("Detached Checkout", 'white')}

#{WHITE}git checkout <commit>#{COLOR_END}
    
Checkout a commit into a detached state from the commit tree.

Will not have the ability to commit back to the repo unless given
a new branch name.

The new branch will be created off of the commit that was detached.

Useful for code inspection and experimentation.
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

end

section "Thank you! Questions?" do
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

    Use #{WHITE}git submodule#{COLOR_END} to link the desired external code to your repo.

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

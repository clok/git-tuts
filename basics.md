
Git Basics
==========

Config File (*.gitconfig*)
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

Git Ingnore (*.gitignore*)
--------------------------
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


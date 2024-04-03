# Git Commands

git init - Initializes a new git repository in current directory

```
git init
```

git config --global user.name "Your Name"

```
git config --global user.email "Your Email" - Sets user name and email for git
git config --global user.name "Your Name" 
git config --global user.email "Your Email"
```

git clone - This command allows you to create a local copy of a remote repository. It downloads the entire repository, including all branches and commit history.

```
git clone https://github.com/example/repository.git
```

git remote -v - used to check all the remotes associated with local repository.
```
git remote -v
```

git add - adds files to staging area
```
git add <filename>
```

git commit - saving the changes made to the files in the staging area. It's essential to provide a descriptive commit message to document the changes
```
git commit -m "This is first commit"
```

Local repositories reside on the computers of team members. In contrast, remote repositories are hosted on a server that is accessible for all team members - most likely on the internet or on a local network.

git remote add origin <Http Url> - connects local repository with remote repository.

```
git remote add origin <Http Url>
```

git push -u origin main - We push changes from local repository to origin main.

```
git push -u origin main
```

git pull - fetches changes from remote repository.

```
git pull origin main
```

git status = Used to show status of reposiroty.

```
git status
```

git branch - It is used to create , delete or list branches

```
git branch feature-branch
git branch -d feature-branch
git branch
```

git checkout - used to switch between branches.

```
git checkout feature-branch
```

git merge - merge changes from different branch

```
git merge feature-branch
```

git log - show history of commits
```
git log
```

git rm <file> - removes file from staging area
```
git rm <file>
```
git diff - git diff returns the list of all the delta changes introduced in various files in our working directory between HEAD and the current index including untracked files.

git diff

git mv - Used to move a file

git mv <file>

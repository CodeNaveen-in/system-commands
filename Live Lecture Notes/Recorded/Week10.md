# Version Control
- Every save is a new version of code.
- version control is trace back to a working version of code.
- **SVN** - centrally hosted version control system
- **GIT** - distributed version control system.
  - Every user has a copy so it's not easy to be wiped off.
  - Have remote access
  - works with git protocol
- **RAID** - Redundant Array of inexpensive disk to data can be preserved. 
  - Usable sapce is less than actual space.
- **Two Factor Authentication**
  - Way 1 is password
  - Way 2 is OTP that's immediately confirmed.

## Git Functionality
- Create a repo on github
- Clone that repo
  - `git clone <repo-link>`
- Add your data by adjusting files
  - `git add .`
  - `git commit -m "Changes"`
  - `git push`

## Git group working
- Create a private repo
- Get yourself the personal access token
- clone the repo on your system
- Configure the remote
- Make changes
- Add the changes
- Commit them
- Push them

## Git branching
- Create a new branch
- Check out the branch
- All changes now to branch
- Merge the branch

## Contributing to other's branch
- Fork their repo
- Create your branch
- Add your changes


```bash
git clone <repolink>
cd <repolink>
git init
git config --global user.name "<User name>"
git config --global user.email "<User email>"
git remote add <branch name> <repolink>
git add .
git commit -m "YOUR MESSAGE"
git push
```
# Collaborating and Versioning - Introduction to GitHub
How to interact with GitHub

* Create a new repository on GitHub
* Make sure readme.md is initialized
* Open Git Bash
* Navigate to the folder you want the repo in

cd stands for 'change directory'
```cd Documents/1\ SMU/DoingDataScience/Unit4```

Clone the repository.  On GitHub, the root directory has a Clone button to receive the link.
```git clone https://github.com/tptibbett/SMUDoingDataScience.git```

Navigate into that folder
```cd SMUDoingDataScience```

To push something to GitHub:
If it's the first time being put on GitHub, it may be 'untracked.'  You need to stage it for being shot off to GitHub.

* ```git add filename.R``` 
* ```git commit -am 'commit message'```
* ```git push```
* Enter User/Password
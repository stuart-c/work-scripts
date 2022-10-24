# work-scripts
Useful Mac script

Those two scripts `repos` and `sync-repos` require `gh` and `hub` to be present. These can be installed with:
```
brew install gh
```
and
```
brew install hub
```

once installed 
you need to authenicate both with github for gh run:
```
gh auth login
```

and for the hub:
```
export GITHUB_TOKEN=<YOUR GITHUB TOKEN>
```

The scripts are expecting following directories structure:
~/git/<ORG-NAME>/

For `ORG-NAME` - ommit prefix `GLOBAL-`

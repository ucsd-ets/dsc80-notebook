# JupyterHub container for DSC 80


How to create a release
Go to the Releases page on github
"Create a new release"
Under "Choose a Tag" enter "sp23" and press enter
Then "Publish Release"
Or, instead of using github, push a tag "sp23" using the git command line interface: git tag sp23; git push origin sp23
How to re-release
Go to the Releases page
Click the Tags tab
Delete the tag
Or, instead of using github, delete the tag "sp23" use the git command line interface to delete the tag: git -d sp23; git push ---delete origin sp23
Follow instructions above to recreate the tag

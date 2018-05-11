# bitbucket-server-side-hooks

Collection of server-side hooks for Atlassian Bitbucket.

## post-receive: auto-tag puppet PR
*Script:* `post-receive_auto-tag_puppet_pr`

*Hook type:* Git server side, post-receive

Creates a tag on merging PRs to the target branch (first parameter, defaults to `master`)

This is intended ot be used in puppet modules since the tag name is taken from the value of `version` in the file `metadata.json`

### Parameters
* `${1}` When the target branch of the PR matches this name, the script is triggered. Default value is `master`.
* `${2}` Log level [DEBUG, INFO, WARNING, ERROR]. Default is INFO


# Ver 0.2

- Fixed `artifactName` parameter in `archive` so that now it uses `deparse` instead of `digest` and one can now archive artifacts with their names.

# Ver 0.1

Extensions to [archivist](https://github.com/pbiecek/archivist)

* GitHub Archiving
- `archive()`

* GitHub and archivist Repository Creation
- `createGitHubRepo()`, `cloneGitHubRepo()`, `deletGitHubRepo()`

* GitHub and archivist Repository Synchronization
- `pullGitHubRepo()`, `puchGitHubRepo()`
# Ver 0.2.0

* New functions
  - `authoriseGitHub()` - easier GitHub token creation
  - `addHooksToPrintGitHub()` - equivalent of `archivist::addHooksToPrint` but with `archivist.github::archive()` usage instead of `archivist::asave()/saveToLocalRepo()`

* Other
  - Added vignette.

# Ver 0.1.1

- Fixed `artifactName` parameter in `archive` so that now it uses `deparse` instead of `digest` and one can now archive artifacts with their names.

# Ver 0.1

Extensions to [archivist](https://github.com/pbiecek/archivist)

* GitHub Archiving
- `archive()`

* GitHub and archivist Repository Creation/Deletion
- `createGitHubRepo()`, `cloneGitHubRepo()`, `deletGitHubRepo()`

* GitHub and archivist Repository Synchronization
- `pullGitHubRepo()`, `puchGitHubRepo()`
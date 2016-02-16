.onAttach <- function(...) {
   setDefaultArchivistEnv()
   packageStartupMessage("archivist.github ver ", utils::packageVersion("archivist"), "")
}

.onLoad <- function(...) {
  
  assign( x = "sqlite", value = dbDriver( "SQLite" ), envir = .ArchivistEnv )
  assign( x = "readmeDescription", value = "A Repository of Artifacts supported by [archivist](https://github.com/pbiecek/archivist) \n\n
  [`Repository`](https://github.com/pbiecek/archivist/wiki/archivist-package-Repository) stores specific values of an artifact,
  different for various artifact's classes and artifacts themselves. To learn more about artifacts visit [wiki](https://github.com/pbiecek/archivist/wiki).",
  envir = .ArchivistEnv )
  assign( x = "repoDescription", value = "A Repository of Artifacts supported by archivist https://github.com/pbiecek/archivist",
  envir = .ArchivistEnv )
  
}

onUnload <- function( libpath ){
  dbUnloadDriver(get( "sqlite", envir = .ArchivistEnv )) 
}

## no S4 methodology here; speedup :
.noGenerics <- TRUE

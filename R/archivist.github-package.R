##    archivist package for R
##		archivist.github package for R
##
#' @title Tools for Archiving, Managing and Sharing R Objects via GitHub
#'
#' @description
#' GitHub integration extension of the \pkg{archivist} package - tool for dtoring, 
#' restoring and searching for R objects.
#'
#' @details
#' For more detailed information visit \pkg{archivist} \code{wiki} on 
#' \href{https://github.com/pbiecek/archivist/wiki}{Github}.
#'
#' @author
#' Marcin Kosinski [aut, cre] \email{m.p.kosinski@@gmail.com} \cr
#' Przemyslaw Biecek [aut] \email{przemyslaw.biecek@@gmail.com} 
#' 
#' @importFrom httr DELETE
#' @importFrom httr config
#' @importFrom httr POST
#' @importFrom jsonlite unbox
#' @importFrom RCurl url.exists
#' @importFrom digest digest
#' @import archivist
#' @importMethodsFrom git2r add
#' @importMethodsFrom git2r commit
#' @importMethodsFrom git2r push
#' @importMethodsFrom git2r pull
#' @importMethodsFrom git2r init
#' @importMethodsFrom git2r remote_add
#' @importMethodsFrom git2r clone
#' @importMethodsFrom git2r repository
#' @importMethodsFrom git2r discover_repository
#' @importMethodsFrom git2r in_repository
#' @importMethodsFrom git2r cred_user_pass
#' @importClassesFrom git2r cred_user_pass
#' @importClassesFrom git2r git_repository
#' 
#' 
#' @family archivist
#' @name archivist-package
#' @docType package
invisible(NULL)

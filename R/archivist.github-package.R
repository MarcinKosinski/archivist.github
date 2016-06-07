##  archivist package for R
##  archivist.github package for R
##
#' @title Tools for Archiving, Managing and Sharing R Objects via GitHub
#'
#' @description
#' GitHub integration extension of the \pkg{archivist} package - tool for storing, 
#' restoring and searching for R objects. More about \pkg{archivis.github} can be found on 
#' \href{http://marcinkosinski.github.io/archivist.github/}{marcinkosinski.github.io/archivist.github/}
#'
#' @details
#' More about \pkg{archivis.github} can be found on 
#' \href{http://marcinkosinski.github.io/archivist.github/}{marcinkosinski.github.io/archivist.github/} 
#' and about \pkg{archivist} in posts' history on \href{http://pbiecek.github.io/archivist/Posts.html}{http://pbiecek.github.io/archivist/Posts.html}#'
#' @author
#' Marcin Kosinski [aut, cre] \email{m.p.kosinski@@gmail.com} \cr
#' Przemyslaw Biecek [aut] \email{przemyslaw.biecek@@gmail.com} 
#' 
#' @note 
#' Bug reports and feature requests can be sent to \href{https://github.com/MarcinKosinski/archivist.github/issues}{https://github.com/MarcinKosinski/archivist.github/issues}
#' 
#' 
#' @importFrom httr DELETE
#' @importFrom httr config
#' @importFrom httr POST
#' @importFrom httr oauth_app
#' @importFrom httr oauth2.0_token
#' @importFrom httr oauth_endpoints
#' @importFrom jsonlite unbox
#' @importFrom digest digest
#' @importFrom utils tail
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
#' @family archivist.github
#' @name archivist.github-package
#' @docType package
invisible(NULL)

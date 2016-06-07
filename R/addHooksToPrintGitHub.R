##  archivist package for R
##  archivist.github package for R
##
#' @title Add \pkg{archivist} Hooks to \pkg{rmarkdown} HTML Report and Archive Artifact on GitHub
#'
#' @description
#' \code{addHooksToPrintGitHub} adds an overloaded version of the print function for objects of selected class. 
#' The overloaded function will add all objects of selected class to the \link{Repository} and then will add hooks to the HTML report (generated in \pkg{rmarkdown}) for these objects (\code{artifacts} - \link{archivist-package}).
#' This is GitHub version of \code{addHooksToPrint} and it automatically stores artifacts on GitHub - see examples.
#' 
#' @param class A character containing a name of class (one or more) that should be archived.
#' @param repo A character containing a name of a GitHub repository on which the Repository is archived.
#' If \code{repo = NULL} then hooks will be added to files in local directories.
#' @param user A character containing a name of a GitHub user on whose account the \code{repo} is created.
#' @param password A character denoting GitHub user password. Can be set globally with \code{aoptions("password", password)}.
#' See \link{agithub}.
#' 
#' @author 
#' Przemyslaw Biecek (\link{addHooksToPrint}), \email{przemyslaw.biecek@@gmail.com} \cr
#' Marcin Kosinski (\link{addHooksToPrintGitHub}), \email{m.p.kosinski@@gmail.com} 
#'  
#' @note
#' One can specify \code{userTags} as in \link{archive} for artifacts by adding \code{"tags"} attribute.
#' See note secion about that in \link{archive}.
#' 
#' Bug reports and feature requests can be sent to \href{https://github.com/pbiecek/archivist/issues}{https://github.com/pbiecek/archivist/issues}
#'  
#' @references 
#' More about \pkg{archivis.github} can be found on 
#' \href{http://marcinkosinski.github.io/archivist.github/}{marcinkosinski.github.io/archivist.github/} 
#' and about \pkg{archivist} in posts' history on \href{http://pbiecek.github.io/archivist/Posts.html}{http://pbiecek.github.io/archivist/Posts.html}
#'  
#' @examples
#' 
#' \dontrun{
#' # only in Rmd report, links to GitHub repository and archive artifact
#' #' # empty GitHub Repository creation
#' authoriseGitHub(ClientID, ClientSecret) -> github_token
#' # authoriseGitHub also does: aoptions("github_token", github_token)
#' aoptions("user", user.name)
#' aoptions("password", user.password)
#' createGitHubRepo("Museum", default = TRUE) # it does aoptions("repo", "Museum")
#' 
#' addHooksToPrintGitHub(class="ggplot") # takes default parameters from ?aoptions
#' qplot(mpg, wt, data = mtcars, geom = "path")
#' }
#' @family archivist
#' @rdname addHooksToPrintGitHub
#' @export
addHooksToPrintGitHub <- function(class = "ggplot",
                                  repo = aoptions("repo"),
																	user = aoptions("user"),
																	password = aoptions("password")){
  stopifnot( is.character( class ), 
             is.character( repoDir ), 
             (is.null(repo) || is.character( repo )), 
             is.character( user ) )
  
  # set local repo to repoDir
  if (!file.exists( repoDir )) 
    createLocalRepo(repoDir)  
  setLocalRepo(repoDir)
  
  for (class1 in class) {
    namespace <- gsub(grep(getAnywhere(paste0("print.",class1))$where, 
                           pattern="namespace:", value=T), 
                      pattern="namespace:", replacement="")
    
    if (length(namespace) == 0) {
      stop(paste0("The function print.", class1, " has not been found."))
    }
    
    if (is.null(repo)) { # local version
      fun <- paste0('function(x, ...) {
                  hash <- saveToRepo(x)
                    cat("Load: [",hash,"](", repoDir, "/gallery/",hash,".rda)\n", sep="")
                    ',namespace,':::print.',class1,'(x, ...)
    }')
    } else { # remote version
      fun <- paste0('function(x, ...) {
                  hash <- saveToRepo(x)
                  al <- alink(hash, repo = "',repo,'", user = "',user,'", subdir = "',subdir,'")
                  cat("Load: ", al, "\n", sep="")
                  ',namespace,':::print.',class1,'(x, ...)
    }')
    }

    fun <- eval(parse(text=fun))
    veryDirtyHack <- 1
    assign(paste0("print.", class1), fun, pos=veryDirtyHack) # 1 should stand for Global Env
  }
  invisible(NULL)
}

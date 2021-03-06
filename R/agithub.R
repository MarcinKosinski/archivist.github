##  archivist package for R
##  archivist.github package for R
##
#' @title Archivist Integration With GitHub
#' 
#' @description
#' Set of functions to integrate \link[archivist]{archivist-package} with
#' GitHub API \href{https://developer.github.com/v3/}{https://developer.github.com/v3/}.
#' 
#' To start working with \pkg{archivist.github} one should run \link{authoriseGitHub} to create an
#' \code{OAuth} token which is required by every function in this package.
#' 
#' It is possible to create new GitHub repository with an empty \pkg{archivist}-like \link{Repository}
#' with \link{createGitHubRepo} function. 
#' 
#' \link{archive} stores artifacts in the Local
#' \code{Repository} and automatically pushes archived artifacts to the GitHub
#' \code{Repository} with which the Local \code{Repository} is synchronized. 
#' 
#' \link{cloneGitHubRepo} clones GitHub Repository into the local directory.
#' 
#' \link{deleteGitHubRepo} can delete whole GitHub-Repository or only archivist-like Repository
#' stored on a GitHub-Repository.
#' 
#' \link{pushGitHubRepo} and \link{pullGitHubRepo} synchronize Local and GitHub (remote) Repository.
#' 
#' @references 
#' More about \pkg{archivist.github} can be found on 
#' \href{http://marcinkosinski.github.io/archivist.github/}{marcinkosinski.github.io/archivist.github/} 
#' and about \pkg{archivist} in posts' history on \href{http://pbiecek.github.io/archivist/Posts.html}{http://pbiecek.github.io/archivist/Posts.html}
#' 
#' @details
#' 
#' To use this set of functionalities, one firstly has to authorize himselft to the GitHub API.
#' It can be done by creating \href{OAuth application on GitHub}{https://github.com/settings/developers}
#' (register new application). If you do not know what should be included as \code{callback url}, you may 
#' use \code{http://localhost:1410} for testing purposes.
#' When application is created, one will have to copy its \code{Client ID} and
#' \code{Client Secret} and authorize his github user with this application by running those commands:
#'  \itemize{
#'    \item \code{myapp <- oauth_app("github", key = Client_ID, secret = Client_Secret)},
#'    \item \code{github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, scope = "public_repo")}.
#'  } 
#' The \code{scope} limits can be found here 
#' \href{https://developer.github.com/v3/oauth/#scopes}{https://developer.github.com/v3/oauth/#scopes}.
#' Basically, this is how you grant an access to your application  and give permissions.
#' With such a token one is authorized and can work with GitHub API and \pkg{archivist}
#' functions devoted to GitHub integration.
#'  
#' To perform GitHub integration operations such as \code{push}, \code{pull}, \code{commit}, \code{add} etc.
#' a user has to pass his GitHub user name (\code{user.name} parameter), user email (\code{user.email}
#' parameter) and user password (\code{user.password} parameter). Those parameters can be set globbaly
#' with \code{aoptions("user.email", user.email)}, \code{aoptions("user.name", user.name)}
#' and \code{aoptions("user.password", user.password)}.
#'  
#' 
#' @note
#' 
#' Note that global configuration of the \code{git config} is used for initial commit.
#' One can later specify local configuration for the repository with \link[git2r]{config}, e.g
#' \code{config(repoName, user.name = "Alice", user.email = "mail_at_gmail.com")}.
#' 
#' @author 
#' Marcin Kosinski, \email{m.p.kosinski@@gmail.com}
#' 
#' @note 
#' Bug reports and feature requests can be sent to \href{https://github.com/MarcinKosinski/archivist.github/issues}{https://github.com/MarcinKosinski/archivist.github/issues}
#' 
#' 
#' @examples
#' \dontrun{
#' authoriseGitHub(ClientID, ClientSecret) -> github_token
#' # authoriseGitHub also does: aoptions("github_token", github_token)
#' aoptions("user", user.name)
#' aoptions("password", user.password)
#' 
#' ## here github_token is used
#' createGitHubRepo("Museum")
#' createGitHubRepo("Museum-Extras", response = TRUE)
#' createGitHubRepo("Gallery", readme = NULL)
#' createGitHubRepo("Landfill", 
#' repoDescription = "My models and stuff")
#'
#' }
#' @family archivist
#' @name archivist-github-integration
#' @aliases agithub
#' @docType class
invisible(NULL)

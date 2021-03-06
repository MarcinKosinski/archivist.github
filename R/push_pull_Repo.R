##  archivist package for R
##  archivist.github package for R
##
#' @title Push and Pull for Repository
#'
#' @description
#' 
#' \code{pushGitHubRepo} adds files, commits them and pushes from Local \link{Repository} to synchronized GitHub one. 
#' \code{pullGitHubRepo} pulls (\code{git pull}) changes from remote GitHub \code{Repository} to the correspoding Local one.
#' 
#' This function is well explained on this \href{http://r-bloggers.com/r-hero-saves-backup-city-with-archivist-and-github}{http://r-bloggers.com/r-hero-saves-backup-city-with-archivist-and-github} blog post.
#' 
#' @details
#' To learn more about  \code{Archivist Integration With GitHub} visit \link{agithub}.
#' To check the \code{status} (\code{git status}) of the Repository use \code{git2r::status(repository(repoDir))}. See examples.
#'  
#' @param repoDir A character specifing the directory to Local \code{Repository} to/from which artifacts will be pulled/pushed to GitHub.
#' @param commitMessage A character denoting a message added to the commit while performing push.
#' By default specified to \code{NULL} which corresponds to commit message \code{archivist: pushGitHubRepo}.
#' @param repo A character denoting GitHub repository name and synchronized local existing directory in which an artifact will be saved.
#' @param user A character denoting GitHub user name. Can be set globally with \code{aoptions("user", user)}.
#'  See \link{archivist-github-integration}.
#' @param password A character denoting GitHub user password. Can be set globally with \code{aoptions("password", password)}.
#' See \link{archivist-github-integration}.
#' @param files A character vector containing directories to files that should be commited and pushed. The working directory
#' is \code{repoDir}. By default all uncommited artifacts and \code{backpack.db} will be pushed.
#' @param ... Further arguments passed to \link[git2r]{push} or \link[git2r]{pull}.
#' 
#' 
#' 
#' @author 
#' Marcin Kosinski, \email{m.p.kosinski@@gmail.com}
#' 
#' @note 
#' Bug reports and feature requests can be sent to \href{https://github.com/MarcinKosinski/archivist.github/issues}{https://github.com/MarcinKosinski/archivist.github/issues}
#' 
#' @references 
#' More about \pkg{archivist.github} can be found on 
#' \href{http://marcinkosinski.github.io/archivist.github/}{marcinkosinski.github.io/archivist.github/} 
#' and about \pkg{archivist} in posts' history on \href{http://pbiecek.github.io/archivist/Posts.html}{http://pbiecek.github.io/archivist/Posts.html} 
#' 
#' 
#' @examples 
#' \dontrun{
#' 
#' authoriseGitHub(ClientID, ClientSecret) -> github_token
#' # authoriseGitHub also does: aoptions("github_token", github_token)
#' aoptions("user", user.name)
#' aoptions("password", user.password)
#' 
#' createGitHubRepo("Museum", default = TRUE) # here github_token is used
#' data(iris)
#' saveToLocalRepo(iris)
#' git2r::status(repository('Museum'))
#' pushGitHubRepo(commitMessage = "add iris")
#' git2r::status(repository('Museum'))
#' 
#' }
#' @aliases pullGithubRepo
#' @family archivist.github
#' @rdname pushGitHubRepo
#' @export
pushGitHubRepo <- function(repoDir = aoptions('repoDir'), 
										 commitMessage = aoptions("commitMessage"),
										 repo = aoptions("repo"), 
										 user = aoptions("user"),
										 password = aoptions("password"),
										 files = c("gallery", "backpack.db"),
										 ...) {
	stopifnot(is.character(repo) & length(repo) == 1)
	stopifnot(is.character(user) & length(user) == 1)
	stopifnot(is.character(password) & length(password) == 1)
	stopifnot(is.character(repoDir) & length(repoDir) == 1)
	stopifnot(is.null(commitMessage) | (is.character(commitMessage) & length(commitMessage) == 1))
	stopifnot(is.character(files))
	
	repo <- git2r::repository(repoDir)
	
	git2r::add(repo, files)
	
	if (is.null(commitMessage)){
		commitMessage <- "archivist: pushGitHubRepo"
	} 
	new_commit <- git2r::commit(repo, commitMessage)

	# authentication with GitHub
	cred <- git2r::cred_user_pass(user,
												 password)
	
	# wyslanie do repozytorium na githubie
	git2r::push(repo,
							#name = "upstream2",
							refspec = "refs/heads/master",
							credentials = cred,
							...)
}

#' @rdname pushGitHubRepo
#' @export
pullGitHubRepo <- function(repoDir = aoptions('repoDir'), 
										 user = aoptions("user"),
										 password = aoptions("password"),
										 ...) {
	stopifnot(is.character(user) & length(user) == 1)
	stopifnot(is.character(password) & length(password) == 1)
	stopifnot(is.character(repoDir) & length(repoDir) == 1)
	
	repo <- git2r::repository(repoDir)
	# authentication with GitHub
	cred <- git2r::cred_user_pass(user,
												 password)
	git2r::pull(repo, credentials = cred, ...)
	
}

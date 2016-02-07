##    archivist package for R
##		archivist.github package for R
##
#' @title Archive Artifact to Local and GitHub Repository
#'
#' @description
#' \code{archive} stores artifacts in the local \link{Repository} and automatically pushes archived
#' artifacts to the Github \code{Repository} with which the local \code{Repository} is synchronized
#' (via \link{createEmptyGithubRepo} or \link{cloneGithubRepo}). Function stores artifacts on the same
#' way as \link{saveToRepo} function. 
#' 
#' @details
#' To learn more about  \code{Archivist Integration With GitHub} visit \link{agithub}.
#'  
#' @param artifact An artifact to be archived on Local and Github \link{Repository}.
#' @param commitMessage A character denoting a message added to the commit while archiving \code{artifact} on GitHub Repository.
#' By default, an artifact's \link{md5hash} is added to the commit message when it is specified to \code{NULL}.
#' @param repo A character denoting GitHub repository name and synchronized local existing directory in which an artifact will be saved.
#' @param user A character denoting GitHub user name. Can be set globally with \code{aoptions("user", user)}.
#'  See \link{agithub}.
#' @param password A character denoting GitHub user password. Can be set globally with \code{aoptions("password", password)}.
#' See \link{agithub}.
#' @param ... Further arguments passed to \link{alink} and \link{saveToRepo} functions.
#' 
#' @param alink Logical. Whether the result should be put into \link{alink} function. Pass further arguments with \code{...}
#' parameter.
#' 
#' @author 
#' Marcin Kosinski, \email{m.p.kosinski@@gmail.com}
#' 
#' @examples 
#' \dontrun{
#' 
#' # empty Github Repository creation
#' 
#' library(httr)
#' myapp <- oauth_app("github",
#'                    key = app_key,
#'                    secret = app_secret)
#' github_token <- oauth2.0_token(oauth_endpoints("github"),
#'                                myapp,
#'                                scope = "public_repo")
#' # setting options                              
#' aoptions("github_token", github_token)
#' aoptions("user", user)
#' aoptions("password", user)
#' 
#' createEmptyGithubRepo("archive-test4", default = TRUE)
#' ## artifact's archiving
#' exampleVec <- 1:100
#' 
#' # archiving
#' archive(exampleVec) -> md5hash_path
#' 
#' ## proof that artifact is really archived
#' showGithubRepo() # uses options from setGithubRepo
#' # let's remove exampleVec
#' rm(exampleVec)
#' # and load it back from md5hash_path
#' aread(md5hash_path)
#' 
#' 
#' # clone example
#' unlink("archive-test", recursive = TRUE)
#' cloneGithubRepo('https://github.com/MarcinKosinski/archive-test')
#' setGithubRepo(aoptions("user"), "archive-test")
#' data(iris)
#' archive(iris)
#' showGithubRepo()
#' 
#' ## alink() option
#' vectorLong <- 1:100
#' vectorShort <- 1:20
#' # archiving
#' alink(archive(vectorLong))
#' archive(vectorShort, alink = TRUE)
#' showGithubRepo()
#' 
#' 
#' }
#' @family archivist.github
#' @rdname archive
#' @export
archive <- function(artifact, 
										commitMessage = aoptions("commitMessage"),
										repo = aoptions("repo"), 
										user = aoptions("user"),
										password = aoptions("password"),
										alink = aoptions("alink"),
										...){
	stopifnot(is.character(c(repo, user, password, commitMessage)))
	stopifnot(length(repo) == 1, 
						length(user) == 1,
						length(password) == 1,
						length(commitMessage) == 1)
	stopifnot(is.logical(alink) & length(alink) == 1)
		
	archivist::saveToRepo(artifact = artifact, ...) -> md5hash
	
	# commit
	# new rows in backpack.db
	# and new files for artifact
	repoName <- repo
	repo <- git2r::repository(repo)
	
	git2r::add(repo, c("backpack.db",  
										 grep(md5hash,
										 		 x = file.path("gallery",
										 		 							list.files(file.path(repoName, "gallery"))),
										 		 value = TRUE)))
	
	if (is.null(commitMessage)){
		new_commit <- git2r::commit(repo, paste0("archivist: add ", md5hash))
	} else {
		new_commit <- git2r::commit(repo, commitMessage)
	}
	
	# authentication with GitHub
	cred <- cred_user_pass(user, password)
	
	# push to github
	git2r::push(repo, refspec = "refs/heads/master", credentials = cred)
	
  if (alink) {
		alink(paste0(user,"/",repoName,"/",md5hash),...)
	} else {
		return(paste0(user,"/",repoName,"/",md5hash))
	}
	
}

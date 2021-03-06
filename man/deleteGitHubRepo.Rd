% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deleteGitHubRepo.R
\name{deleteGitHubRepo}
\alias{deleteGitHubRepo}
\title{Delete the Existing GitHub Repository}
\usage{
deleteGitHubRepo(repo, github_token = aoptions("github_token"),
  user = aoptions("user"), password = aoptions("password"), unset = FALSE,
  deleteRoot = FALSE, subdir = NULL, response = aoptions("response"))
}
\arguments{
\item{repo}{While working with a Github repository. A character denoting GitHub repository name to be deleted.}

\item{github_token}{While working with a Github repository. An OAuth GitHub Token created with the \link{oauth2.0_token} function. To delete GitHub Repository you
need to have \code{delete_repo} scope set - see examples. See \link{archivist-github-integration}.
Can be set globally with \code{aoptions("github_token", github_token)}.}

\item{user}{While working with a Github repository. A character denoting GitHub user name. Can be set globally with \code{aoptions("user", user)}.
See \link{archivist-github-integration}.}

\item{password}{Only when \code{deleteRoot = FALSE}. While working with a Github repository. A character denoting GitHub user password. Can be set globally with \code{aoptions("password", password)}.
See \link{archivist-github-integration}.}

\item{unset}{A logical. If deleted \code{repoDir/repo} was set to be default Local/GitHub Repository
and \code{unset} is TRUE, then \code{repoDir/repo} is unset as a default Local/GitHub Repository (\code{aoptions('repoDir/repo', NULL, T)}).}

\item{deleteRoot}{A logical value that specifies if the repository root directory
should be deleted for Local Repository or for GitHub whether to delete whole GitHub-Repository.}

\item{subdir}{Only when \code{deleteRoot = FALSE}. Subdirectory in which the archivist-Repository is stored on a GitHub Repository.
If it's in main directory, then specify to \code{NULL} (default).}

\item{response}{A logical value. Should the GitHub API response be returned (only when \code{deleteRoot = TRUE}).}
}
\description{
\code{deleteGitHubRepo} can delete whole GitHub-Repository or only archivist-like \link{Repository}
stored on a GitHub-Repository (then it requires more parameters to be specified).

This function is well explained on this \href{http://r-bloggers.com/r-hero-saves-backup-city-with-archivist-and-github}{http://r-bloggers.com/r-hero-saves-backup-city-with-archivist-and-github} blog post.
}
\details{
To learn more about  \code{Archivist Integration With GitHub} visit \link{agithub}.
To delete GitHub Repository you
need to have \code{delete_repo} scope set - see examples.
}
\note{
Bug reports and feature requests can be sent to \href{https://github.com/MarcinKosinski/archivist.github/issues}{https://github.com/MarcinKosinski/archivist.github/issues}
}
\examples{
\dontrun{

authoriseGitHub(ClientID, ClientSecret, 
                scope = c("public_repo", "delete_repo")) -> github_token
# authoriseGitHub also does: aoptions("github_token", github_token)
aoptions("user", user.name)
aoptions("password", user.password)

createGitHubRepo("Museum")
deleteGitHubRepo(repo = "Museum", deleteRoot = TRUE, response = TRUE)

}

}
\references{
More about \pkg{archivist.github} can be found on 
\href{http://marcinkosinski.github.io/archivist.github/}{marcinkosinski.github.io/archivist.github/} 
and about \pkg{archivist} in posts' history on \href{http://pbiecek.github.io/archivist/Posts.html}{http://pbiecek.github.io/archivist/Posts.html}
}
\seealso{
Other archivist.github: \code{\link{archive}},
  \code{\link{archivist.github-package}},
  \code{\link{authoriseGitHub}},
  \code{\link{cloneGitHubRepo}},
  \code{\link{createGitHubRepo}},
  \code{\link{pushGitHubRepo}}
}
\author{
Marcin Kosinski, \email{m.p.kosinski@gmail.com}
}

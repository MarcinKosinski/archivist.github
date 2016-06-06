#' @title Authorise with GitHub API
#'
#' @description
#' 
#' \code{authoriseGitHub} is function that performes OAuth authorisation with GitHub API 
#' and stores resulting token in the \code{github_token} variable.
#' In order to authorise your app you need ClinetID and ClientSecret.
#' They can be found here: https://github.com/settings/applications/new
#' 
#' @param ClientID A 20 characters long string with Client ID. See https://github.com/settings/applications/ for more details.
#' 
#' @param ClientSecret A 40 characters long string with Client Secret. See https://github.com/settings/applications/ for more details.
#' 
#' @author 
#' Przemyslaw Biecek, \email{przemyslaw.biecek@@gmail.com}
#'
#' @note 
#' Bug reports and feature requests can be sent to \href{https://github.com/MarcinKosinski/archivist.github/issues}{https://github.com/MarcinKosinski/archivist.github/issues}
#' 
#'
#' @examples
#' \dontrun{
#' ## GitHub version
#' authoriseGitHub(ClientID, ClientSecret)
#' }
#' @family archivist.github
#' @rdname authoriseGitHub
#' @export
authoriseGitHub <- function(ClientID,	ClientSecret) {
	myapp <- oauth_app("github",
	                    key = ClientID,
	                    secret = ClientSecret)
	github_token <- oauth2.0_token(oauth_endpoints("github"),
	                                 myapp,
	                                 scope = "public_repo")
	aoptions("github_token", github_token)
	github_token
}

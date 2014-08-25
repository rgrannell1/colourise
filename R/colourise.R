
# Partly Adapted from Hadley Wickham's code in testthat.
#

supports_colour <- function () {
	# is a terminal colourisable?

	env_vars <- Sys.getenv()

	TERM      <- env_vars["TERM"]
	COLORTERM <- env_vars["COLORTERM"]

	set_env_vars <- names(env_vars)

	# -- term support color.
	matching_TERM <-
		("TERM" %in% set_env_vars) && !is_na(TERM) && TERM %in%
		c("screen", "screen-256color", "xterm-color", "xterm-256color")

	# -- colorterm is set at all. This is required for gnome-terminal.
	matching_COLORTERM <-
		("COLORTERM" %in% set_env_vars) && !is_na(COLORTERM)

	isTRUE(matching_TERM || matching_COLORTERM)

}

colouriser <- function (code) {
	function (message) {
		if (supports_colour()) {
			"\033[" %+% code %+% message %+% "\033[0m"
		} else {
			message
		}
	}
}

#' colourise
#'
#' add colour to a string.
#'
#' @param message. An arbitrary string.
#'
#' @return a string.
#'
#' @rdname colourise
#' @export

colouriseBlack  <- colouriser("0;30m")

#' @rdname colourise
#' @export

colouriseBlue   <- colouriser("0;34m")

#' @rdname colourise
#' @export

colouriseGreen  <- colouriser("0;32m")

#' @rdname colourise
#' @export

colouriseYellow <- colouriser("1;33m")

#' @rdname colourise
#' @export

colouriseRed    <- colouriser("0;31m")





#' @rdname colourise
#' @export

colourizeBlack  <- colouriseBlack

#' @rdname colourise
#' @export

colourizeBlue   <- colouriseBlue

#' @rdname colourise
#' @export

colourizeGreen  <- colouriseGreen

#' @rdname colourise
#' @export

colourizeYellow <- colouriseYellow

#' @rdname colourise
#' @export

colourizeRed    <- colouriseRed

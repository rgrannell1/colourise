
colourise <- local({
	# functions that add ANSI colour codes to strings, allowing them to
	# be colourised.

	# partly adapted from Hadley Wickham's colourising code in testthat.

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

})

colouriser <- function (code) {
	function (message) {
		if (supports_colour()) {
			"\033[" %+% code %+% message %+% "\033[0m"
		} else {
			message
		}
	}
}

#' colouriseBlack
#'
#' colour a string black.
#'
#' @param message a character vector. The string to colour.

colouriseBlack  <- colouriser("0;30m")

#' colouriseBlue
#'
#' colour a string blue.
#'
#' @param message a character vector. The string to colour.

colouriseBlue   <- colouriser("0;34m")

#' colouriseGreen
#'
#' colour a string green.
#'
#' @param message a character vector. The string to colour.

colouriseGreen  <- colouriser("0;32m")

#' colouriseYellow
#'
#' colour a string yellow.
#'
#' @param message a character vector. The string to colour.

colouriseYellow <- colouriser("1;33m")

#' colouriseRed
#'
#' colour a string red.
#'
#' @param message a character vector. The string to colour.

colouriseRed    <- colouriser("0;31m")





colouriseBlack  <- colourizeBlack
colouriseBlue   <- colourizeBlue
colouriseGreen  <- colourizeGreen
colouriseYellow <- colourizeYellow
colouriseRed    <- colourizeRed

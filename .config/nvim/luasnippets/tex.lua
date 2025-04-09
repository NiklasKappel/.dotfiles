local ls = require("luasnip")
local i = ls.insert_node
local s = ls.snippet
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

return {
	-- math
	s({ trig = "$$", snippetType = "autosnippet" }, fmta([[$<>$]], { i(1) })),
	s({ trig = "__", snippetType = "autosnippet", wordTrig = false }, fmta([[_{<>}]], { i(1) })),
	s({ trig = "^^", snippetType = "autosnippet", wordTrig = false }, fmta([[^{<>}]], { i(1) })),
	s({ trig = "//", snippetType = "autosnippet" }, fmta([[\frac{<>}{<>}]], { i(1), i(2) })),

	-- references
	s({ trig = "cite", wordTrig = false }, fmta([[~\cite{<>}]], { i(1) })),
	s({ trig = "ref", wordTrig = false }, fmta([[~\cref{<>}]], { i(1) })),
	s("Ref", fmta([[\Cref{<>}]], { i(1) })),

	-- graphics
	s("inc", fmta([[\includegraphics[width=\linewidth]{<>}]], { i(1) })),
	s(
		"fig",
		fmta(
			[[
        \begin{figure}
          \centering
          \includegraphics[width=\linewidth]{<>}
          \titledCaption{<>}{<>}\label{fig:<>}
        \end{figure}
      ]],
			{ i(1), i(3), i(4), i(2) }
		)
	),
	s(
		"mfig",
		fmta(
			[[
        \begin{figure}
          \centering
          \begin{subfigure}[t]{0.49\linewidth}
            \centering
            \caption{}\label{fig:<>}
            \includegraphics[width=\linewidth]{<>}
          \end{subfigure}
          \begin{subfigure}[t]{0.49\linewidth}
            \centering
            \caption{}\label{fig:<>}
            \includegraphics[width=\linewidth]{<>}
          \end{subfigure}
          \titledCaption{<>}{<>}\label{fig:<>}
        \end{figure}
      ]],
			{ i(2), i(1), i(4), i(3), i(6), i(7), i(5) }
		)
	),

	--environments
	s(
		"beg",
		fmta(
			[[
        \begin{<>}<>
          <>
        \end{<>}
      ]],
			{ i(1), i(2), i(3), rep(1) }
		)
	),
	s(
		"eq",
		fmta(
			[[
        \begin{equation}<>
          <>
        \end{equation}
      ]],
			{ i(1), i(2) }
		)
	),
}

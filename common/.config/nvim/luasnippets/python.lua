local ls = require("luasnip")
local i = ls.insert_node
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		"main",
		fmta(
			[[
        def main():
            <>


        if __name__ == '__main__':
            main()
      ]],
			{ i(1) }
		)
	),
	s(
		"docm",
		fmta(
			[[
        """One-line summary of the module or program.

        Overall description of the module or program. Optionally, a brief
        description of exported classes and functions and/or usage examples.

        Typical usage example:

            foo = ClassFoo()
            bar = foo.FunctionBar()
        """
      ]],
			{}
		)
	),
	s(
		"doct",
		fmta(
			[[
        """One-line summary of additional information about the test module.

        More additional information about the test module.
        """
      ]],
			{}
		)
	),
	s(
		"docf",
		fmta(
			[[
        """One-line summary of the function or method.

        Overall description of the function or method.

        Args:
            arg_name: Description of the argument.
                Indent long descriptions.

        Returns:
            Description of the return value.

        Yields:
            Description of the yield value.

        Raises:
            Error: Description of the error.
        """
      ]],
			{}
		)
	),
	s(
		"docc",
		fmta(
			[[
        """One-line summary of the class.

        Overall description of the class.

        Attributes:
            attribute_name: Description of the attribute.
                Indent long descriptions.
        """
      ]],
			{}
		)
	),
}

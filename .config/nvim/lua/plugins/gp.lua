return {
	"robitx/gp.nvim",
	opts = {
		chat_free_cursor = true,
		providers = {
			copilot = {
				endpoint = "https://api.githubcopilot.com/chat/completions",
				secret = {
					"bash",
					"-c",
					"cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
				},
			},
		},
		hooks = {
			UnitTestsPy = function(gp, params)
				local template = "I have the following code from {{filename}}:\n\n"
					.. "```{{filetype}}\n{{selection}}\n```\n\n"
					.. "Please respond by writing pytest unit tests for the code above. Organize test cases into test classes. Write one test class for each tested class or function. Write one test method for each test case. Write an error message for each assert statement. Do not write boilerplate code to run tests."
				local agent = gp.get_command_agent()
				gp.Prompt(params, gp.Target.vnew, agent, template)
			end,

			DocumentPy = function(gp, params)
				local template = "I have the following code from {{filename}}:\n\n"
					.. "```{{filetype}}\n{{selection}}\n```\n\n"
					.. "Please respond by writing a docstring for each class, method, and function in the code. Use the google docstring format. Place the summary lines of the docstrings directly after the opening quotation marks. Do not include type hints in the docstrings."
				local agent = gp.get_command_agent()
				gp.Prompt(params, gp.Target.vnew, agent, template)
			end,
		},
	},
}

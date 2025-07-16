vim.api.nvim_create_user_command("InsertDate", "put=strftime('%F')", {})

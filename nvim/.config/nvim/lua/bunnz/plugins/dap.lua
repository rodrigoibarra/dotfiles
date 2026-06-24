return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- ── DAP UI ──────────────────────────────────────────────────────────
			dapui.setup({
				icons = { expanded = "", collapsed = "", current_frame = "" },
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.33 },
							{ id = "breakpoints", size = 0.17 },
							{ id = "stacks", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						size = 0.30,
						position = "left",
					},
					{
						elements = {
							{ id = "repl", size = 0.45 },
							{ id = "console", size = 0.55 },
						},
						size = 0.27,
						position = "bottom",
					},
				},
			})

			-- auto open/close dapui with debug session
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- ── JS / TS adapter ─────────────────────────────────────────────────
			local js_debug_path = vim.fn.expand("~/.local/share/nvim/dap/vscode-js-debug")

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						js_debug_path .. "/out/src/vsDebugServer.js",
						"${port}",
					},
				},
			}

			for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach to process",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
				}
			end

			-- ── Python adapter (stub — enable when env is configured) ───────────
			-- dap.adapters.python = {
			--   type = "executable",
			--   command = "python",
			--   args = { "-m", "debugpy.adapter" },
			-- }
			-- dap.configurations.python = {
			--   {
			--     type = "python",
			--     request = "launch",
			--     name = "Launch file",
			--     program = "${file}",
			--     pythonPath = function()
			--       return vim.fn.exepath("python")
			--     end,
			--   },
			-- }

			-- ── Keymaps ─────────────────────────────────────────────────────────
			local map = vim.keymap.set

			map("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
			map("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "conditional breakpoint" })
			map("n", "<leader>dc", dap.continue, { desc = "continue" })
			map("n", "<leader>di", dap.step_into, { desc = "step into" })
			map("n", "<leader>do", dap.step_over, { desc = "step over" })
			map("n", "<leader>dO", dap.step_out, { desc = "step out" })
			map("n", "<leader>dr", dap.repl.open, { desc = "open repl" })
			map("n", "<leader>du", dapui.toggle, { desc = "toggle dap ui" })
			map("n", "<leader>dx", dap.terminate, { desc = "terminate" })
		end,
	},
}

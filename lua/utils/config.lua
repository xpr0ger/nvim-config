local M = { config = nil }

---Loads and merges YAML configuration files using 'lua-yaml' (via luarocks)
---Priority: ~/.config/cli-env/nvim.yml < CWD/nvim.yml
---@return table|nil The merged configuration or nil if none found
function M._load_config()
	local ok, yaml = pcall(require, "yaml")
	if not ok then
		-- Return empty config if yaml parser is not yet available
		return {}
	end

	-- Name of additional neovim's configuration file
	local config_file_name = "nvim.yml"
	-- Project level configuration
	local config_path_project = vim.fn.join({ vim.fn.getcwd(), config_file_name }, "/")
	-- User level configuration
	local config_path_user_parts = vim.fn.split(vim.fn.stdpath("config"), "/")
	config_path_user_parts[#config_path_user_parts] = config_file_name
	local config_path_user = vim.fn.join(config_path_user_parts, "/")
	-- Global level config
	local config_path_global = vim.fn.join({ vim.fn.stdpath("config"), config_file_name }, "/")

	local config = {}
	-- Iterates over configs and load them (global -> user -> project)
	local configs = { config_path_global, config_path_user, config_path_project }
	for _, config_path in ipairs(configs) do
		local file = io.open(config_path, "r")
		if file ~= nil then
			local config_content = file:read("*a")
			file:close()
			if config_content ~= nil then
				local decoded_config = yaml.eval(config_content)
				if type(decoded_config) == "table" and decoded_config ~= nil then
					config = vim.tbl_deep_extend("force", config, decoded_config)
				end
			end
		end
	end

	return config
end

function M.get_config()
	if M.config == nil or next(M.config) == nil then
		M.config = M._load_config()
	end

	return M.config
end

function M.is_minuet_ai_enabled()
	local config = M.get_config()
	if config == nil then
		return false
	end

	local enabled = (config.gemini or {}).enabled
	local model = (config.gemini or {}).model
	local api_key = (config.gemini or {}).api_key

	return enabled and model ~= nil and api_key ~= nil
end

return M

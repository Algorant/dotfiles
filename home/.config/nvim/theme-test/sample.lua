-- Verdigris Lua sample
-- Comments should be readable, subdued, and slightly green-gray.

local M = {}
local DEFAULT_TIMEOUT = 1500

---@param name string
---@param opts table|nil
function M.greet(name, opts)
	opts = opts or { excited = true, color = "aqua" }
	local message = string.format("Hello, %s", name)

	if opts.excited then
		message = message .. "!"
	else
		message = message .. "."
	end

	return {
		message = message,
		timeout = DEFAULT_TIMEOUT,
		ok = true,
	}
end

for _, user in ipairs({ "Ada", "Linus", "Grace" }) do
	local result = M.greet(user, { excited = user ~= "Linus" })
	print(result.message)
end

return M

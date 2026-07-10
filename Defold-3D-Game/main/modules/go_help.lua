local M = {}

-- Function to check if a game object exists
function M.exists(go_id)
	-- Trying to get the position and checking for error
	return pcall(function(id) go.get_position(id) end, go_id)
end

return M
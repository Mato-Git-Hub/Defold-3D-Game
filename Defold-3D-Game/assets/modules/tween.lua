local M = {}

-- Function to move an angle towards given target
function M.move_towards_angle(angle, target, difference)
	-- Calculating the shortest distance between the angles
	local distance = (target - angle + math.pi) % (2 * math.pi) - math.pi

	-- Checking if the angle is already close enough
	if math.abs(distance) < difference then
		return target
	end

	-- Updating the angle while makinig sure it is in the range of [0, 2pi]
	angle = (angle + difference * math.abs(distance) / distance) % (2 * math.pi)
	
	-- Returning the result
	return angle
end

return M
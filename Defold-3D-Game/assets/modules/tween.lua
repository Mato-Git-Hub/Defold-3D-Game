local M = {}

-- Function to move an angle towards given target
function M.move_towards_angle(angle, target, difference)
	-- Checking if the angle is already close enough to the target
	
	
	-- Checking the shortest direction
	if math.abs(target-angle) < math.pi then
		if angle < target then
			angle = angle + difference
		else
			angle = angle - difference
		end
	else
		if angle < target then
			angle = angle - difference
		else
			angle = angle + difference
		end
	end

	-- Making sure the angle stays within the range of [0, 2pi]
	if angle > 2 * math.pi then
		angle = angle - 2 * math.pi
	elseif angle < 0 then
		angle = angle + 2 * math.pi
	end
	
	-- Returning the result
	return angle
end

return M
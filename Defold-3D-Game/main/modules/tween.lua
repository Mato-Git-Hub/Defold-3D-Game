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

-- Function to move a vector towards given target
function M.move_towards_vector(vector, target, difference)
	-- Calculating the vector from vector to target
	local direction_vector = target - vector

	-- Checking if the vector is already close enough
	if vmath.length(direction_vector) < difference then
		return target
	end

	-- Normalizing the direction vector
	if vmath.length(direction_vector) > 0 then
		direction_vector = vmath.normalize(direction_vector)
	end

	-- Updating the vector
	vector = vector + direction_vector * difference

	-- Returning the result
	return vector
end

return M
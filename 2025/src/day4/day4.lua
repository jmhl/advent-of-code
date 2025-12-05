file = io.open("./src/day4/input.txt", "r")

local total = 0

function build_grid()
	local grid = {}
	local row = 1

	for line in file:lines() do
		local col= 1

		grid[row] = {}

		for char in string.gmatch(line, ".") do
			grid[row][col] = char

			col = col + 1
		end

		row = row + 1
	end

	return grid
end

function remove_rolls(grid)
	local marked_for_removal = {}

	for row, row_val in ipairs(grid) do
		for col, col_val in ipairs(row_val) do
			local can_forklift = true

			if col_val == "@" then
				local adjacent_roll_count = 0;

				if row_val[col - 1] == "@" then
					adjacent_roll_count = adjacent_roll_count + 1
				end
				if row_val[col + 1] == "@" then
					adjacent_roll_count = adjacent_roll_count + 1
				end
				if (grid[row - 1] and grid[row - 1][col] == "@") then
					adjacent_roll_count = adjacent_roll_count + 1
				end
				if (grid[row + 1] and grid[row + 1][col] == "@") then
					adjacent_roll_count = adjacent_roll_count + 1
				end
				if (grid[row - 1] and grid[row - 1][col - 1] == "@") then
					adjacent_roll_count = adjacent_roll_count + 1
				end
				if (grid[row - 1] and grid[row - 1][col + 1] == "@") then
					adjacent_roll_count = adjacent_roll_count + 1
				end
				if (grid[row + 1] and grid[row + 1][col - 1] == "@") then
					adjacent_roll_count = adjacent_roll_count + 1
				end
				if (grid[row + 1] and grid[row + 1][col + 1] == "@") then
					adjacent_roll_count = adjacent_roll_count + 1
				end

				if adjacent_roll_count >= 4 then
					can_forklift = false
				end
			else
				can_forklift = false
			end

			if can_forklift then
				total = total + 1

				table.insert(marked_for_removal, {row, col})
			end
		end
	end

	for k, v in pairs(marked_for_removal) do
		row = v[1]
		col = v[2]

		grid[row][col] = "."
	end

	if #marked_for_removal > 0 then
		remove_rolls(grid)
	end
end

local grid = build_grid()

remove_rolls(grid)

print(total)

file:close()

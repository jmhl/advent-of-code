utils = require("src.utils")

file = io.open("./src/day6/input.txt", "r")

local total = 0

local tbl = {}

for line in file:lines() do
	local idx = 1

	for entry in line:gmatch("%S+") do
		if not tbl[idx] then
			tbl[idx] = {}
		end

		if entry:match("%d+") then
			table.insert(tbl[idx], tonumber(entry))
		else
			table.insert(tbl[idx], entry)
		end

		idx = idx + 1
	end
end

for idx, sub_tbl in pairs(tbl) do
	local operation = sub_tbl[#sub_tbl]

	local sub_tbl_total = sub_tbl[1]

	for i = 2, #sub_tbl - 1, 1 do
		if operation == "+" then
			sub_tbl_total = sub_tbl_total + sub_tbl[i]
		elseif operation == "*" then
			sub_tbl_total = sub_tbl_total * sub_tbl[i]
		end
	end

	total = total + sub_tbl_total
end

file:close()

print(total)

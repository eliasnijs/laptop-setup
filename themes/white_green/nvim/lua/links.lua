local M = {}

local function get_selected_text()
    vim.cmd('noau normal! "vy"')
    local selected_text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})
    return selected_text
end

function M.open_file_or_url()
    local text = get_selected_text()
    local is_img = string.match(text, "%.png$") or string.match(text, "%.jpg$") or string.match(text, "%.jpeg$") or string.match(text, "%.gif$")
	local is_url = string.match(text, "^%a%a+://")

    if is_img then
        vim.fn.jobstart({"feh", text}, {detach = true})
    elseif is_url then
		vim.fn.jobstart({"xdg-open", text}, {detach = true})
	else
		local dir = vim.fn.expand("%:p:h")
        vim.fn.jobstart({"xdg-open", dir .. "/" .. text}, {detach = true})
	end

end

return M



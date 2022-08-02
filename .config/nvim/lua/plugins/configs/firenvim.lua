local present, _ = pcall(require, "firenvim")

if not present then
   return
end


local blacklistedSites = {".*atlassian\\.net/wiki/spaces/GENERAL/pages/edit.*"}
local localSettings = {
    [".*"] = {
        cmdline = "neovim"
    }
}
for _, site in pairs(blacklistedSites) do
    localSettings[site] = { takeover = "never" }
end
vim.g.firenvim_config = {
    localSettings = localSettings
}

-- Firenvim setup
function _G.FirenvimSetup(channel)
  local channel_info = vim.api.nvim_get_chan_info(channel)
  if channel_info.client and channel_info.client.name == "Firenvim" then
    vim.opt.laststatus = 0
  end
end

vim.cmd("autocmd UIEnter * call v:lua.FirenvimSetup(deepcopy(v:event.chan))")

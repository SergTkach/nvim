if vim.fn.has('nvim-0.6') == 0 then
  error('Need Neovim v0.7+ in order to run LazyNvim!')
end

do
  local answer, _ = pcall(require, 'impatient')
  if not answer then
    vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
  end
end

local answer, called_module = pcall(require, 'lazynvim')
if not answer then
  error(('Error loading ...\n\n%s'):format(called_module))
end

local modules = {
  'lazynvim.compiled',
  'lazynvim.core',
  'lazynvim.ui',
}

for _, current_module in ipairs(modules) do
  local answer, called_module = pcall(require, current_module)
  if current_module == 'lazynvim.compiled' and not answer then
   	vim.notify('Run :PackerCompile!', vim.log.levels.WARN, {
   	 	title = 'lazyNvim',
     })
  elseif not answer then
   	error(('lazyNvim. Error loading %s...\n\n%s'):format(current_module, called_module))
  end
end

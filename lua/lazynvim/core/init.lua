local modules = {
  'lazynvim.core.disabled',
  'lazynvim.core.load_options',
  'lazynvim.core.load_plugins',
  --'lazynvim.core.editor',
  --'lazynvim.core.pluginsInit',
  --'lazynvim.core.commands',
  --'lazynvim.core.mappings',
  --'lazynvim.config.editor',
}

for _, current_module in ipairs(modules) do
  local answer, called_module = pcall(require, current_module)
  if not answer then
    error(('Core. Error loading %s...\n\n%s'):format(current_module, called_module))
  end
end

-- [[
-- EditorConfig helps maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs. The EditorConfig project consists of a file format for defining coding styles and a collection of text editor plugins that enable editors to read the file format and adhere to defined styles. EditorConfig files are easily readable and they work nicely with version control systems.
-- ]]
return {
  "editorconfig/editorconfig-vim", -- editor config
  config = function()
    vim.cmd([[
      let g:EditorConfig_exclude_patterns = ['fugitive://.*']
    ]])
  end
}

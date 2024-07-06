vim.filetype.add {
  extension = {
    tf = 'terraform',
    mustache = 'html',
    yml = function()
      if vim.fn.getline(1) == '---' then
        return 'yaml.ansible'
      end
      return 'yaml'
    end,
  },
  filename = {
    ['pipeline.dsl'] = 'groovy',
    ['job.dsl'] = 'groovy',
  },
  pattern = {
    ['Jenkinsfile.*'] = 'groovy',
  },
}

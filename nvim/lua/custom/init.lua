local function inject_cpp_boilerplate()
  local line_count = vim.fn.line('$')
  local first_line = vim.fn.getline(1)

  -- Only insert if the file is EMPTY
  if line_count == 1 and first_line == '' then
    local template_path = vim.fn.expand("~\\AppData\\Local\\nvim\\templates\\template.cpp")
    if vim.fn.filereadable(template_path) == 1 then
      vim.cmd("0r " .. template_path)
      vim.cmd("normal! G") -- move to bottom
    else
      print("⚠️ Template not found at " .. template_path)
    end
  end
end


vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*.cpp",
  callback = inject_cpp_boilerplate,
})


-- Java template injection
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*.java",
  callback = function()
    local file = vim.fn.expand("%:t:r") -- filename without extension
    local template_path = vim.fn.expand("~\\AppData\\Local\\nvim\\templates\\template.java")

    if vim.fn.filereadable(template_path) == 1 and vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
      vim.cmd("0r " .. template_path)
      vim.cmd(string.format("%%s/__FILENAME__/%s/g", file))
      vim.cmd("normal! G")
    else
      print("⚠️ Java template not found or file not empty")
    end
  end,
})

require("custom.chatgpt_key")

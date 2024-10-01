{lib, pkgs,...}: 
  let 
    formatCmds =''
    local buf = (args and args.buf) or 0
      vim.fn.system('treefmt ' .. vim.api.nvim_buf_get_name(buf))
      vim.cmd('e!')
    '';
    formatFunc2 = ''
    :lua ${formatCmds} <cr>
    '';
    formatFunc = "<cmd>lua require('conform').format()<cr>";
  in
{ 
  plugins.conform-nvim = 
  { 
    enable = true; 
    settings = { 
      formatters = {
        nix-fmt = {
        command = "treefmt"; 
        args = ["--walk" "filesystem" "$FILENAME"]; 
        stdin=false;
        };
      };
      lsp_format = "never";
      log_level="trace";
      notify_on_error = true;
      notify_no_formatters = true;
      stop_after_first = true;
      formatters_by_ft = {
        "*" = ["nix-fmt"];
         # "_" = [
         #    "squeeze_blanks"
         #    "trim_whitespace"
         #    "trim_newlines"
         #  ];
      };
    };
  };

  keymaps = 
  [
  {
    mode = "n";
    key = "<leader>uf";
    action = ":FormatToggle<CR>";
    options = {
      desc = "Toggle Format";
      silent = true;
    };
  }
  {
    mode = "n";
    key = "<leader>cf";
    action = formatFunc;
    options = {
      silent = true;
      desc = "Format Buffer";
    };
  }

  {
    mode = "v";
    key = "<leader>cF";
    action = formatFunc;
    options = {
      silent = true;
      desc = "Format Lines";
    };
  }
  ];

  extraConfigLua = ''
    local conform = require("conform")
    local notify = require("notify")

    conform.setup({
      format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {}
      end,
    })

    local function show_notification(message, level)
      notify(message, level, { title = "Formatting" })
    end

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      local is_global = not args.bang
      if is_global then
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      if vim.g.disable_autoformat then
        show_notification("Autoformat-on-save disabled globally", "info")
      else
        show_notification("Autoformat-on-save enabled globally", "info")
      end
      else
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      if vim.b.disable_autoformat then
        show_notification("Autoformat-on-save disabled for this buffer", "info")
      else
        show_notification("Autoformat-on-save enabled for this buffer", "info")
        end
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })
  '';
}

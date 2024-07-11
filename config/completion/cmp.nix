{
  plugins = {
    cmp-nvim-lsp = {enable = true;}; # lsp
      cmp-buffer = {enable = true;};
    copilot-cmp = {enable = true;}; # copilot suggestions
      cmp-path = {enable = true;}; # file system paths
      cmp_luasnip = {enable = true;}; # snippets
      cmp-cmdline = {enable = true;}; # autocomplete for cmdline
      cmp = {
        enable = true;
        autoEnableSources = false;
        settings = {
          experimental = {
            ghost_text = true;
          };
        };
        settings = {
          mapping = {
            "<C-j>" =" cmp.mapping.select_next_item()";
            "<C-k>" =" cmp.mapping.select_prev_item()";
            "<C-e>" =" cmp.mapping.abort()";

            "<C-b>" =" cmp.mapping.scroll_docs(-4)";

            "<C-f>" =" cmp.mapping.scroll_docs(4)";

            "<C-Space>" =" cmp.mapping.complete()";

            "<C-y>" =" cmp.mapping.confirm({ select = true })";

            "<S-CR>" =" cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
          snippet = {
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          };
          sources = [
          {
            name = "nvim_lsp";
            group_index = 1;
          }{
            name = "copilot";
            group_index = 1;
          }
          {
            name = "path";
            group_index = 1;
          }
          {
            name = "luasnip";
            group_index = 1;
          }
          {
            name = "cmdline";
            group_index = 1;
          }
          {
            name = "buffer";
            group_index = 2;
          }
          ];

          performance = {
            debounce = 60;
            fetching_timeout = 200;
            max_view_entries = 30;
          };
          window = {
            completion = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
            };
            documentation = {
              border = "rounded";
            };
          };
          formatting = {
            fields = ["kind" "abbr" "menu"];
            expandable_indicator = true;
          };
        };
  cmdline = {
    "/" = {sources =[{name = "buffer";}];};
    "?" = {sources =[{name = "buffer";}];};
    ":" = {sources =[{name = "path";}];};
  };
      };
  };
  extraConfigLua = ''
    luasnip = require("luasnip")
    kind_icons = {
      Text = "󰊄",
      Method = "",
      Function = "󰡱",
      Constructor = "",
      Field = "",
      Variable = "󱀍",
      Class = "",
      Interface = "",
      Module = "󰕳",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    } 
  '';

}

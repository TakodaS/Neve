{
  plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          experimental = {
            ghost_text = true;
          };
        };
        settings = {
          mapping = {
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-y>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
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
            name = "fuzzy_path";
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
          {
            name = "fuzzy_buffer";
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
        cmdline = let
          addView = attr: attr // {
             mapping.__raw = "cmp.mapping.preset.cmdline()";
          };
      in builtins.mapAttrs (name: value: addView value)
      {
        "/" = {sources =[{name = "buffer";}];};
        "?" = {sources =[{name = "buffer";}];};
        ":" = {sources =[{name = "fuzzy_path";} {name = "cmdline"; option = {ignore_cmds = ["Man" "!"];};}];};
      };
      filetype = {
        gitcommit = {sources = [{name = "cmp_git";}{name="buffer";}];};
      };
      };
  };
  extraConfigLua = ''
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

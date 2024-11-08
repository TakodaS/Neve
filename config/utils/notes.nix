{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    vim-pencil
  ];

  keymaps = [
    {
      action = "<cmd> Telescope find_files search_dirs={\"~/second-brain\"} <CR>";
      key = "<leader>nf";
      options = {
        desc = "Find files in second brain";
      };
      mode = [
        "n"
      ];
    }
    {
      action = "<cmd> Telescope live_grep search_dirs={\"~/second-brain\"} <CR>";
      key = "<leader>ng";
      options = {
        desc = "Search contents in second brain";
      };
      mode = [
        "n"
      ];
    }
    {
      action = "<cmd> ObsidianToggleCheckbox <CR>";
      key = "<leader>nc";
      options = {
        desc = "Toggle checkbox";
      };
      mode = [
        "n"
      ];
    }
    {
      action = "<cmd> ObsidianDailies<CR>";
      key = "<leader>nd";
      options = {
        desc = "Open Obsidian daily notes";
      };
      mode = [
        "n"
      ];
    }
    {
      action = "<cmd> ObsidianTags<CR>";
      key = "<leader>nt";
      options = {
        desc = "Open Obsidian tags";
      };
      mode = [
        "n"
      ];
    }
  ];

  plugins = {
    twilight.enable = true;
    zen-mode.enable = true;
    headlines.enable = true;

    obsidian = 
    let
    path = "/home/austen/second-brain";
    in
    {
      enable = if builtins.pathExists path then true else false;
      settings = {
        workspaces = [
          {
            inherit path;
            name = "second-brain";
          }
        ];
        daily_notes = {
          folder = "dailies";
          dateFormat = "%Y-%m-%d";
          aliasFormat = "%B %-d, %Y";
          template = "my_templates/daily_log.md";
        };
        templates = {
          subdir = "templates";
          dateFormat = "%Y-%m-%d";
          timeFormat = "%H:%M";
          substitutions = {};
        };
      };
    };
  };
}

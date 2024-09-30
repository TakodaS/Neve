{
  plugins.lualine = {
    enable = false;
    settings = {
      extensions = ["fzf"];
      theme = "auto";
      options = {
        always_divide_middle = true;
        ignore_focus = ["neo-tree"];
        globalstatus = true;
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "█"; # 
          right = "█"; # 
        };
      };

      sections = {
        lualine_a = ["mode"];
        lualine_b = [
          {
            name = "branch";
            icon = "";
          }
          "diff"
          "diagnostics"
        ];
        lualine_c = ["filename"];
        lualine_x = ["filetype"];
        lualine_y = ["progress"];
        lualine_z = [''" " .. os.date("%R")''];
      };
    };
  };
}

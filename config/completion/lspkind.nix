{
  plugins.lspkind = {
    enable = true;
    symbolMap = {
      Copilot = "";
      Codeium = "{..}";
    };
    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}

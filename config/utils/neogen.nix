{
  plugins.neogen = {
    enable = true;
    snippetEngine = "luasnip";
    keymaps = {
      generate = "<leader>cg";
      # generateClass = "<leader>b";
      # generateFile = "<leader>c";
      # generateFunction = "<leader>d";
      # generateType = "<leader>e";
    };
    languages = {
      sh = {
        template.annotation_convention = "google_bash";
      };
      c = {
        template.annotation_convention = "doxygen";
      };
      cs = {
        template.annotation_convention = "doxygen";
      };
      cpp = {
        template.annotation_convention = "doxygen";
      };
      go = {
        template.annotation_convention = "godoc";
      };
      java = {
        template.annotation_convention = "javadoc";
      };
      javascript = {
        template.annotation_convention = "jsdoc";
      };
      javascriptreact = {
        template.annotation_convention = "jsdoc";
      };
      kotlin = {
        template.annotation_convention = "kdoc";
      };
      lua = {
        template.annotation_convention = "emmylua";
      };
      php = {
        template.annotation_convention = "phpdoc";
      };
      python = {
        template.annotation_convention = "numpydoc";
      };
      ruby = {
        template.annotation_convention = "yard";
      };
      rust = {
        template.annotation_convention = "rustdoc";
      };
      typescript = {
        template.annotation_convention = "tsdoc";
      };
      typescriptreact = {
        template.annotation_convention = "tsdoc";
      };
      vue = {
        template.annotation_convention = "jsdoc";
      };
    };
  };
}

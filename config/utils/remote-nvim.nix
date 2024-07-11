{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "remote-nvim.nvim";
      version = "2024-07-06";
      src = pkgs.fetchFromGitHub {
        owner = "amitds1997";
        repo = "remote-nvim.nvim";
        rev = "66fc20fd259401c7bb6ac5189ecb6283c2eb65d2";
        hash = "sha256-ado876vs1D1tEQu+Q3jDUaJA9hf/9Y5JLCWu3rf219s=";
      };
    })
  ];
  extraConfigLua = ''
    require("remote-nvim").setup({
      log = {
      level = "debug",
        }
      })
    '';
}

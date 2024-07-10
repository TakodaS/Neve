{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "lazydev.nvim";
      version = "2024-07-10";
      src = pkgs.fetchFromGitHub {
        owner = "folke";
        repo = "lazydev.nvim";
        rev = "cea5d0fb556cdc35122d9cae772e7e0ed65b4505";
        sha256 = "sha256-7GYIYg6YNmk1psZ02UCtlDiTg4rY7Dr4fcaaZIvbTGM=";
      };
    })
  ];
  extraConfigLua = ''
    require("lazydev").setup({
    })
  '';
}

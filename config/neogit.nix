{
  plugins.neogit = {
    enable = true;
    disableBuiltinNotifications = true;
  };
  keymaps = [
    {
      key = "<leader>g";
      action = "+git";
    }
    {
      key = "<leader>gg";
      action = "<cmd>Neogit<CR>";
    }
  ];
}
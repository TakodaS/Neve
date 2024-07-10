{
  plugins.copilot-chat = {
    enable = true;
  };
  keymaps = [
    {
      mode = ["n" "v"];
      key = "<leader>ae";
      action = "<cmd>CopilotChatExplain<CR>";
      options = {
        desc = "CopilotChat - Explain Code";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>at";
      action = "<cmd>CopilotChatTests<CR>";
      options = {
        desc = "CopilotChat - Generate Tests";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>ar";
      action = "<cmd>CopilotChatReview<CR>";
      options = {
        desc = "CopilotChat - Review Code";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>aR";
      action = "<cmd>CopilotChatRefactor<CR>";
      options = {
        desc = "CopilotChat - Refactor Code";
      };
    }

    {
      mode = "n";
      key = "<leader>am";
      action = "<cmd>CopilotChatCommitStaged<CR>";
      options = {
        desc = "CopilotChat - Generate commit message for all staged changes";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>at";
      action = "<cmd>CopilotChatToggle<CR>";
      options = {
        desc = "CopilotChat - Toggle";
      };
    }

    {
      mode = ["n" "v"];
      key = "<leader>af";
      action = "<cmd>CopilotChatFix<CR>";
      options = {
        desc = "CopilotChat - Fix Code";
      };
    }
    {
      mode = "n";
      key = "<leader>aF";
      action = "<cmd>CopilotChatFixDiagnostics<CR>";
      options = {
        desc = "CopilotChat - Fix Diagnostics";
      };
    }
  ];
}

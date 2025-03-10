pkgs: {
  enable = true;
  userName = "Danny Wray";
  userEmail = "48837241+dannywrayuk@users.noreply.github.com";
  extraConfig = {
    core = {
      editor = "nvim";
      autocrlf = "input";
    };
    push = {
      autoSetupRemote = true;
    };
    pull = {
      rebase = true;
    };
    advice = {
      statusHints = false;
    };
    credential = {
      helper = [
        "" # Empty string tells git to disregard any other config
        "${pkgs.git-credential-manager}/bin/git-credential-manager"
      ];
    };
  };
}

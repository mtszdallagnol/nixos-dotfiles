{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Mateus ZDA";
    userEmail = "mzanettindallagnol@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.askPass = "";
    };
  };
}

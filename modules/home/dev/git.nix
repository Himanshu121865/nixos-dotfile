{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Himanshu121865";
        email = "himanshujha1218@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}

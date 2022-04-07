{
  colored2 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jlbqa9q4mvrm73aw9mxh23ygzbjiqwisl32d8szfb5fxvbjng5i";
      type = "gem";
    };
    version = "3.1.2";
  };
  cri = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1h45kw2s4bjwgbfsrncs30av0j4zjync3wmcc6lpdnzbcxs7yms2";
      type = "gem";
    };
    version = "2.15.10";
  };
  faraday = {
    dependencies = ["multipart-post"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bs2lm0wd273kwq8nk1p8pk43n1wrizv4c1bdywkpcm9g2f5sp6p";
      type = "gem";
    };
    version = "0.17.5";
  };
  faraday_middleware = {
    dependencies = ["faraday"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x7jgvpzl1nm7hqcnc8carq6yj1lijq74jv8pph4sb3bcpfpvcsc";
      type = "gem";
    };
    version = "0.14.0";
  };
  fast_gettext = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ci71w9jb979c379c7vzm88nc3k6lf68kbrsgw9nlx5g4hng0s78";
      type = "gem";
    };
    version = "1.1.2";
  };
  gettext = {
    dependencies = ["locale" "text"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0764vj7gacn0aypm2bf6m46dzjzwzrjlmbyx6qwwwzbmi94r40wr";
      type = "gem";
    };
    version = "3.2.9";
  };
  gettext-setup = {
    dependencies = ["fast_gettext" "gettext" "locale"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vfnayz20xd8q0sz27816kvgia9z2dpj9fy7z15da239wmmnz7ga";
      type = "gem";
    };
    version = "0.34";
  };
  jwt = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "036i5fc09275ms49mw43mh4i9pwaap778ra2pmx06ipzyyjl6bfs";
      type = "gem";
    };
    version = "2.2.3";
  };
  locale = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0997465kxvpxm92fiwc2b16l49mngk7b68g5k35ify0m3q0yxpdn";
      type = "gem";
    };
    version = "2.1.3";
  };
  log4r = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ri90q0frfmigkirqv5ihyrj59xm8pq5zcmf156cbdv4r4l2jicv";
      type = "gem";
    };
    version = "1.1.10";
  };
  minitar = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "126mq86x67d1p63acrfka4zx0cx2r0vc93884jggxnrmmnzbxh13";
      type = "gem";
    };
    version = "0.9";
  };
  multi_json = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pb1g1y3dsiahavspyzkdy39j4q377009f6ix0bh1ag4nqw43l0z";
      type = "gem";
    };
    version = "1.15.0";
  };
  multipart-post = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zgw9zlwh2a6i1yvhhc4a84ry1hv824d6g2iw2chs3k5aylpmpfj";
      type = "gem";
    };
    version = "2.1.1";
  };
  puppet_forge = {
    dependencies = ["faraday" "faraday_middleware" "gettext-setup" "minitar" "semantic_puppet"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jp9jczc11vxr6y57lxhxxd59vqa763h4qbsbjh1j0yhfagcv877";
      type = "gem";
    };
    version = "2.3.4";
  };
  r10k = {
    dependencies = ["colored2" "cri" "fast_gettext" "gettext" "gettext-setup" "jwt" "log4r" "minitar" "multi_json" "puppet_forge"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "03hi93zhi5yz5279v4zgy6jmaddqfhp5kadpjxrxwshzv41pphrk";
      type = "gem";
    };
    version = "3.14.2";
  };
  semantic_puppet = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gg1bizlgb8wswxwy3irgppqvd6mlr27qsp0fzpm459wffzq10sx";
      type = "gem";
    };
    version = "1.0.4";
  };
  text = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x6kkmsr49y3rnrin91rv8mpc3dhrf3ql08kbccw8yffq61brfrg";
      type = "gem";
    };
    version = "1.3.1";
  };
}

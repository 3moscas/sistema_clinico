{ pkgs, ... }: {
  channel = "stable-24.05";
  packages = [
    pkgs.jdk17
    pkgs.unzip
    pkgs.gh
  ];
  env = {};
  idx = {
    extensions = [
      "Dart-Code.dart-code"
      "Dart-Code.flutter"
      "eamodio.gitlens"
    ];
    previews = {
      enable = true;
      previews = {
        web = {
          command = [
          "flutter"
          "run"
          "--machine"
          "-d"
          "web-server"
          "--web-hostname"
          "0.0.0.0"
          "--web-port"
          "$PORT"
          ];
          manager = "flutter";
          cwd = "src/sistema_clinico";
        };
        android = {
          command = [
          "flutter"
          "run"
          "--machine"
          "-d"
          "android"
          "-d"
          "localhost:5555"
          ];
          manager = "flutter";
          cwd = "src/sistema_clinico";
        };
      };
    };
    workspace = {
      onCreate = {};
      onStart = {};
    };
  };
}

{
  tmuxPlugins,
  evergarden-tmux,
}:

tmuxPlugins.mkTmuxPlugin {
  pluginName = "evergarden";
  version =
    let
      date = builtins.concatStringsSep "-" (
        builtins.match "(.{4})(.{2})(.{2}).*" evergarden-tmux.lastModifiedDate
      );
    in
    "0-unstable-${date}";
  src = "${evergarden-tmux}/themes";
  rtpFilePath = "evergarden.sh";
}

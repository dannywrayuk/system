let
  host = (import ../util/system-variables.nix).host;
  extraCasks = {
    DannysMacbookAir = [
      "surfshark"
      "raycast"
    ];
  };
in
{
  enable = true;
  caskArgs.no_quarantine = true;
  global.brewfile = true;
  masApps = { };
  casks = [
    "hammerspoon"
    "firefox"
  ] ++ (extraCasks.${host} or [ ]);
  taps = [ ];
  brews = [ ];
}

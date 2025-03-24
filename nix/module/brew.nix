let
  host = (import ../util/system-variables.nix).host;
  extraCasks = {
    DannysMacbookAir = [
      "surfshark"
      "firefox"
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
  ] ++ (extraCasks.${host} or [ ]);
  taps = [ ];
  brews = [ ];
}

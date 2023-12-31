{ lib, stdenvNoCC, fetchFromGitHub, libnotify }:

stdenvNoCC.mkDerivation {
  pname = "notify-send";
  version = "2020-02-24";

  src = fetchFromGitHub {
    owner = "emilazy";
    repo = "mpv-notify-send";
    rev = "a2bab8b2fd8e8d14faa875b5cc3a73f1276cd88a";
    sha256 = "sha256-EwVkhyB87TJ3i9xJmmZMSTMUKvfbImI1S+y1vgRWbDk=";
  };

  patchPhase = ''
    substituteInPlace notify-send.lua \
    --replace "notify-send" "${libnotify}/bin/notify-send" \
    --replace "local title = file" 'local title = mp.get_property_native("media-title") or file'
  '';

  installPhase = ''
    mkdir -p $out/share/mpv/scripts
    cp notify-send.lua $out/share/mpv/scripts
  '';

  passthru.scriptName = "notify-send.lua";

  meta = with lib; {
    description = "A Lua script for mpv to send notifications with notify-send";
    homepage = "https://github.com/emilazy/mpv-notify-send";
    license = licenses.wtfpl;
    platforms = platforms.all;
    maintainers = with maintainers; [ r3n3gad3p3arl ];
  };
}

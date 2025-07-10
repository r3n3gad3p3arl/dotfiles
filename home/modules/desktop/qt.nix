{ pkgs, ... }: {
  qt.style.name = "kvantum";

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=ColloidDark
    '';

    "Kvantum/Colloid".source = "${pkgs.colloid-kde}/share/Kvantum/Colloid";
  };
}

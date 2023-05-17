{
   networking.networkmanager.enable = true;

   # slows down boot time + unecessary for regular desktop usage
   systemd.services."NetworkManager-wait-online".enable = false;
}

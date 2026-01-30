{ ... }:

{
  xdg.desktopEntries = {
    rust-rover = {
      name = "RustRover";
      comment = "Rust IDE from JetBrains";
      genericName = "Rust IDE from JetBrains";
      exec = "rust-rover";
      terminal = false;
      icon = "rustrover";
      type = "Application";
      categories = [ "Development" ];
    };
  };
}

{
  shell = import ./services/shell.nix;
  gnome = import ./services/gnome.nix;
  zed =  import ./submodules/zed.nix;
}

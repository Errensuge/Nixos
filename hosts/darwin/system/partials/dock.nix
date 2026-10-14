{ config, lib, ... }:

with lib;
{
  system.defaults.dock.persistent-apps =
    [
      { app = "/System/Applications/Apps.app"; }
      { app = "/System/Applications/Mail.app"; }
    ]
    # 2. Applications Net
    ++ optional config.os.homebrew.zen.enable { app = "/Applications/Zen.app"; }
    ++ optional config.os.homebrew.microsoft.team.enable { app = "/Applications/Microsoft Teams.app"; }

    # 3. Applications Office
    ++ optional config.os.homebrew.microsoft.word.enable { app = "/Applications/Microsoft Word.app"; }
    ++ optional config.os.homebrew.microsoft.excel.enable { app = "/Applications/Microsoft Excel.app"; }
    ++ optional config.os.homebrew.microsoft.powerpoint.enable { app = "/Applications/Microsoft PowerPoint.app"; }
    ++ optional config.os.homebrew.obsidian.enable { app = "/Applications/Obsidian.app"; }
    ++ optional config.os.homebrew.zotero.enable { app = "/Applications/Zotero.app"; }

    # 4. Applications IDE
    ++ optional config.os.homebrew.zed.enable { app = "/Applications/Zed.app"; }
    ++ optional config.os.homebrew.jetbrain.intellij.enable { app = "/Applications/IntelliJ IDEA.app"; }
    ++ optional config.os.homebrew.jetbrain.pycharm.enable { app = "/Applications/PyCharm.app"; }
    ++ optional config.os.homebrew.jetbrain.phpstorm.enable { app = "/Applications/PhpStorm.app"; }
    ++ optional config.os.homebrew.jetbrain.clion.enable { app = "/Applications/CLion.app"; }
    ++ optional config.os.homebrew.jetbrain.goland.enable { app = "/Applications/GoLand.app"; }
    ++ optional config.os.homebrew.jetbrain.rubymine.enable { app = "/Applications/RubyMine.app"; }
    ++ optional config.os.homebrew.jetbrain.rustrover.enable { app = "/Applications/RustRover.app"; }

    # 5. Applications Système (Utilitaires)
    ++ optional config.os.homebrew.ghostty.enable { app = "/Applications/Ghostty.app"; };
}

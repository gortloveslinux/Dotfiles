import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.SetWMName
main = xmonad gnomeConfig
      { modMask = mod4Mask
      , terminal = "terminator"
      , startupHook = startupHook gnomeConfig >> setWMName "LG3D"
      }

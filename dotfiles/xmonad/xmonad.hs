import XMonad
-- Layout
import XMonad.Layout.Dwindle
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
-- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar.PP
-- Util
import XMonad.Util.NamedScratchpad
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)

myLayout = avoidStruts (smartBorders (Dwindle R CW 1 1 ||| smartBorders (Tall 1(3/100) (1/2)) ||| Full))

myPP :: PP
myPP = def 
      { ppCurrent = \name -> "\"" ++ name ++ "\": \"current active\", "
      , ppHidden = \name -> "\"" ++ name ++ "\": \"active\", "
      , ppOrder = \(ws : _ : _ : _) -> [ws]
      }

mySB :: StatusBarConfig
mySB = statusBarProp "eww open topbar" (pure myPP)

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "pipewire"
  spawnOnce "gammastep -l 56:27 -b 6500:3000"

myWorkspaces :: [String]
myWorkspaces = ["1","2","3","4"]

main :: IO ()
main = xmonad 
       . withSB mySB
       . ewmhFullscreen
       . ewmh
       . docks
       $ def
        { modMask = mod4Mask
        , layoutHook = smartSpacingWithEdge 3 $ myLayout
        , startupHook = myStartupHook 
        , focusedBorderColor = "#EBDBB2"
        , normalBorderColor = "#282828"
        }
        `additionalKeysP`
        [ ("M-q", spawn "ghostty")
        , ("M-b", spawn "/opt/brave/brave")
        , ("M-p", spawn "dmenu_run")
        , ("M-n", sendMessage NextLayout)
        , ("M-c", kill)
        -- Scratchpads
        , ("M-S-s", withFocused $ toggleDynamicNSP "dyn1")
        , ("M-s", dynamicNSPAction "dyn1")
        -- Reload config
        , ("M-S-c", spawn "$HOME/.config/xmonad/reload")]
        `removeKeysP`
        [ "M-space"]
       where
        defToggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
        defToggleStrutsKey XConfig{modMask = m} = (m, xK_u)

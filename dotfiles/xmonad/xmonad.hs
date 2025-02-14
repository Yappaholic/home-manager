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
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)

myLayout = avoidStruts (smartBorders (Dwindle R CW 1 1) ||| smartBorders (Tall 1(3/100) (1/2)) ||| Full)

myPP :: PP
myPP = def
       { ppCurrent = \name -> "'" ++ name ++ "': 'current active', "
       , ppHidden = \name -> "'" ++ name ++ "': 'active', "
       , ppOrder = \(ws : _ : _ : _) -> [ws]
       }

mySB :: StatusBarConfig
mySB = statusBarProp "eww open topbar" (pure myPP)


main :: IO ()
main = xmonad 
       . withSB mySB
       . ewmh
       . docks
       $ def
        { modMask = mod4Mask
        , layoutHook = smartSpacingWithEdge 3 $ myLayout}
        `additionalKeysP`
        [ ("M-q", spawn "ghostty")
        , ("M-b", spawn "zen")
        , ("M-p", spawn "bemenu-run --fn 'JetBrains Mono 13.8'")
        , ("M-S-k", spawn "QT_QPA_PLATFORM=xcb kotatogram-desktop")
        , ("M-n", sendMessage NextLayout)
        , ("M-c", kill)
        -- Scratchpads
        , ("M-S-s", withFocused $ toggleDynamicNSP "dyn1")
        , ("M-s", dynamicNSPAction "dyn1")
        -- Reload config
        , ("M-S-c", spawn "~/.config/xmonad/reload")]
        `removeKeysP`
        [ "M-space"]
       where
        defToggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
        defToggleStrutsKey XConfig{modMask = m} = (m, xK_u)

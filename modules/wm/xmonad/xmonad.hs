import XMonad
-- Layout
import XMonad.Layout.Dwindle
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
-- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
-- Util
import XMonad.Util.ClickableWorkspaces
import XMonad.Util.NamedScratchpad
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)

myLayout = smartBorders (Dwindle R CW 1 1) ||| smartBorders (Tall 1(3/100) (1/2)) ||| Full
main :: IO ()
main = xmonad 
       $ ewmh
       $ withEasySB (statusBarProp "xmobar ~/.config/xmonad/xmobarrc" (clickablePP xmobarPP)) defToggleStrutsKey
       $ def
        { modMask = mod4Mask
        , layoutHook = smartSpacingWithEdge 3 $ myLayout}
        `removeKeysP`
        [ "M-Space"]
        `additionalKeysP`
        [ ("M-q", spawn "wezterm start --always-new-process")
        , ("M-b", spawn "zen")
        , ("M-r", spawn "bemenu-run --fn 'JetBrains Mono 13.8'")
        , ("M-n", sendMessage NextLayout)
        , ("M-c", kill)
        -- Scratchpads
        , ("M-S-s", withFocused $ toggleDynamicNSP "dyn1")
        , ("M-s", dynamicNSPAction "dyn1")
        -- Reload config
        , ("M-S-c", spawn "~/.config/xmonad/reload")]
       where
        defToggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
        defToggleStrutsKey XConfig{modMask = m} = (m, xK_p)

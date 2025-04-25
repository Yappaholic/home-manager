import XMonad
import qualified XMonad.StackSet as W
-- Actions
import XMonad.Actions.Navigation2D
-- Prompt
import XMonad.Prompt
import XMonad.Prompt.Shell
-- Layout
import XMonad.Layout.Dwindle
import XMonad.Layout.SubLayouts
import XMonad.Layout.Spacing
import XMonad.Layout.BoringWindows
import XMonad.Layout.WindowNavigation
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
-- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar.PP
-- Util
import XMonad.Util.NamedScratchpad
import XMonad.Util.ClickableWorkspaces
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP, checkKeymap)

myLayout = windowNavigation $ subTabbed $ smartSpacingWithEdge 4 (smartBorders (Dwindle R CW 1 1) ||| smartBorders (Tall 1(3/100) (1/2)) ||| noBorders Full)

myPP :: PP
myPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "VBoth" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow
    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

mySB :: StatusBarConfig
mySB = statusBarProp "xmobar ~/.config/xmonad/xmobarrc" (clickablePP myPP)

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "gammastep -l 56:27 -b 6500:3000"
  spawnOnce "xset r rate 300 30"
  spawnOnce "setxkbmap -layout 'us,ru' -option 'grp:toggle,ctrl:nocaps' -variant 'colemak_dh_wide_iso,'"
  spawnOnce "feh --bg-fill ~/Pictures/solarized.jpg"
  spawnOnce "picom"

myWorkspaces :: [String]
myWorkspaces = ["1","2","3","4"]

main :: IO ()
main = xmonad 
       . withSB mySB
       . docks
       . ewmhFullscreen
       . ewmh
       . navigation2DP def
                       ("k","h","j","l")
                       [("M-", windowGo)
                       ,("M-S-", windowSwap)]
                       False
       $ def
        { modMask = mod4Mask
        , layoutHook = avoidStruts $ myLayout
        , startupHook = myStartupHook
        , terminal = "wezterm"
        , focusedBorderColor = "#EBDBB2"
        , normalBorderColor = "#282828"
        }
        `additionalKeysP`
        [ ("M-<Return>", spawn "wezterm")
        , ("M-z", spawn "zen")
        , ("M-e", spawn "emacsclient -c")
        , ("M-p", shellPrompt def)
        , ("M-<Tab>", sendMessage NextLayout)
        , ("M-c", kill)
        , ("M-<Space>", withFocused $ windows . W.sink)

        , ("M-C-h", sendMessage $ pullGroup L)
        , ("M-C-l", sendMessage $ pullGroup R)
        , ("M-C-k", sendMessage $ pullGroup U)
        , ("M-C-j", sendMessage $ pullGroup D)

        , ("M-m", withFocused (sendMessage . MergeAll))
        , ("M-u", withFocused (sendMessage . UnMerge))

        , ("M-,", onGroup W.focusUp')
        , ("M-.", onGroup W.focusDown')
        -- Scratchpads
        , ("M-S-s", withFocused $ toggleDynamicNSP "dyn1")
        , ("M-s", dynamicNSPAction "dyn1")
        -- Reload config
        , ("M-S-c", spawn "sh -c 'xmonad --recompile && xmonad --restart'")]

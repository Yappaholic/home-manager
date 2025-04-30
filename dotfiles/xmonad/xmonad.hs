import XMonad
import qualified XMonad.StackSet as W
-- Actions
import XMonad.Actions.Navigation2D
-- Prompt
import XMonad.Prompt
import XMonad.Prompt.Shell
-- Layout
import XMonad.Layout.SubLayouts
import XMonad.Layout.Spacing
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.BoringWindows
import XMonad.Layout.WindowNavigation
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Layout.Maximize
-- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageHelpers
-- Util
import XMonad.Util.NamedScratchpad
import XMonad.Util.ClickableWorkspaces
import XMonad.Util.Loggers
import XMonad.Util.Hacks
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.SessionStart (doOnce)
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP, checkKeymap)

myLayout = maximizeWithPadding 0 $ windowNavigation $ subTabbed $ smartSpacingWithEdge 4 (smartBorders(emptyBSP) ||| smartBorders (Tall 1(3/100) (1/2)))

myPP :: PP
myPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "VBoth" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, wins]
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
myStartupHook = doOnce $ do
  spawnOnce "emacs --fg-daemon"
  spawnOnce "gammastep -l 56:27 -t 6500:3000"
  spawnOnce "xset r rate 300 30"
  spawnOnce "setxkbmap -layout 'us,ru' -option 'grp:toggle,ctrl:nocaps' -variant 'colemak_dh_wide_iso,'"
  spawnOnce "feh --bg-fill ~/Pictures/solarized.jpg"
  spawnOnce "picom"
  spawnOnce "trayer --edge top --align right --widthtype request --tint 0x073642FF --transparent true"

myWorkspaces :: [String]
myWorkspaces = ["1","2","3","4"]

main :: IO ()
main = xmonad 
       . withSB mySB
       . ewmhFullscreen
       . ewmh
       . docks
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
        , manageHook = composeOne [isFullscreen -?> doFullFloat]
        , handleEventHook = handleEventHook def <> trayerPaddingXmobarEventHook
        , focusedBorderColor = "#EBDBB2"
        , normalBorderColor = "#282828"
        }
        `additionalKeysP`
        [ ("M-<Return>", spawn "alacritty")
        , ("M-z", spawn "zen")
        , ("M-e", spawn "emacsclient -c")
        , ("M-p", shellPrompt def)
        , ("M-S-<Space>", sendMessage NextLayout)
        , ("M-c", kill)
        , ("M-f", withFocused (sendMessage . maximizeRestore))

        , ("M-<Space>", withFocused $ windows . W.sink)

        , ("M-<Tab> h", sendMessage $ pullGroup L)
        , ("M-<Tab> l", sendMessage $ pullGroup R)
        , ("M-<Tab> k", sendMessage $ pullGroup U)
        , ("M-<Tab> j", sendMessage $ pullGroup D)

        , ("M-C-h", sendMessage $ ExpandTowards L)
        , ("M-C-l", sendMessage $ ExpandTowards R)
        , ("M-C-k", sendMessage $ ExpandTowards U)
        , ("M-C-j", sendMessage $ ExpandTowards D)

        , ("M-m", withFocused (sendMessage . MergeAll))
        , ("M-u", withFocused (sendMessage . UnMerge))

        , ("M-,", onGroup W.focusUp')
        , ("M-.", onGroup W.focusDown')
        -- Scratchpads
        , ("M-S-s", withFocused $ toggleDynamicNSP "dyn1")
        , ("M-s", dynamicNSPAction "dyn1")
        -- Reload config
        , ("M-S-c", spawn "sh -c 'xmonad --recompile && xmonad --restart'")]
        `removeKeysP`
        [("M1-<Return>")]

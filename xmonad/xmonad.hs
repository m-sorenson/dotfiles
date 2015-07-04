import XMonad
-- Actions
import XMonad.Actions.CycleWS
-- Layouts
import XMonad.Layout.Fullscreen
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
--Window Rules
import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
--import XMonad.Operations
import XMonad.Util.Run (spawnPipe)
import System.IO (hPutStrLn)

----
-- Workspace Rules
----

myLayout = onWorkspace (myWorkspaces !! 0) (fullScreen ||| fullTile)
        $ ((avoidStruts (tiled ||| fullScreen)) ||| fullScreen)
    where
        tiled = spacing 15 $ ResizableTall nmaster delta ratio []
        fullScreen = noBorders(fullscreenFull Full)
        fullTile = ResizableTall nmaster delta ratio []
        nmaster = 1
        delta = 5/100
        ratio = toRational (2/(1 + sqrt 5 :: Double))

----
-- Workspace Definitions
----

myWorkspaces =  ["1" , "2" , "3" , "4", "5", "6", "7", "8", "9"]

----
-- Application Specific Rules
----

myManageHook = composeAll [ resource =? "dmenu" --> doFloat
                , resource =? "dzen2" --> doIgnore
                , manageDocks]

newManageHook = myManageHook <+> manageHook defaultConfig

----
-- Status Bar
----

myLogHook h = dynamicLogWithPP ( defaultPP
    {
        ppCurrent   = dzenColor iconColor background . pad . (\x -> "^i(/home/michael/.icons/dzen2/full.xbm)")
      , ppVisible   = dzenColor color5 background . pad . (\x -> "^i(/home/michael/.icons/dzen2/full.xbm)")
      , ppHidden   = dzenColor color7 background . pad . (\x -> "^i(/home/michael/.icons/dzen2/full.xbm)")
      , ppHiddenNoWindows   = dzenColor color7 background . pad . (\x -> "^i(/home/michael/.icons/dzen2/empty.xbm)")
      , ppWsSep   = ""
      , ppSep   = "   "
      , ppLayout   = dzenColor background background . shorten 0
      , ppTitle   = dzenColor background background .shorten 0
      , ppOrder   = \(ws:l:t:_) -> [ws, l, t]
      , ppOutput   = hPutStrLn h
    } )

myWorkspaceBar = "dzen2 -x '0' -y '0' -h '18' -ta 'c' -fg '"++foreground++"' -bg '"++background++"' -fn "++myFont++" -e onstart=lower"
myStatusBar = "/home/michael/.xmonad/status_bar '"++foreground++"' '"++background++"' '"++ iconColor ++"' "++myFont
myUserBar = "/home/michael/.xmonad/user_bar '"++foreground++"' '"++background++"' '"++ iconColor ++"' "++myFont


main = do
  dzenLeftBar <- spawnPipe myWorkspaceBar
  dzenRightBar <- spawnPipe myStatusBar
  dzenCorner <- spawnPipe myUserBar
  xmonad $ defaultConfig
    { terminal = myTerminal
    , borderWidth = myBorderWidth
    , layoutHook = smartBorders $ myLayout
    , workspaces = myWorkspaces
    , manageHook = newManageHook
    , focusedBorderColor = color12
    , normalBorderColor = background
    , startupHook = setWMName "LG3D"
    , logHook = myLogHook dzenLeftBar
    }

    `additionalKeys`
    [((mod1Mask, xK_x), kill)
    ,((mod1Mask, xK_r), spawn "dmenu2_run")
    ,((mod1Mask, xK_o), swapNextScreen)
    ,((mod1Mask .|. shiftMask, xK_o), shiftNextScreen)
    ]

myTerminal = "urxvt"
myBorderWidth = 3
--myFont ="-*-terminus-*-r-*-*-*-*-*-*-*-*-*-*"
--myFont ="xft:hermit:pixelsize=14:antialias=true"
myFont ="-*-ohsnap-medium-r-*-*-12-*-*-*-*-*-*-*"
iconColor = color12
foreground = "#cacfd3"
background = "#181c20"
--black
color0 =       "#2a2e31"
color8 =       "#2e363d"
--red
color1 =       "#bb6d6d"
color9 =       "#ef7760"
--green
color2 =       "#6dbb6d"
color10 =      "#89E14B"
--yellow
color3 =       "#e5a458"
color11 =      "#e1d4a8"
--blue
color4 =       "#1E415E"
color12 =      "#489fd7"
--magenta
color5 =       "#AF81F4"
color13 =      "#9e7cd7"
--cyan
color6 =       "#2D7889"
color14 =      "#2ed6d7"
--white
color7 =       "#b0b0b0"
color15 =      "#dddddd"

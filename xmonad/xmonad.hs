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
        ppCurrent   = dzenColor active background . pad . (\x -> "^r(36x12)")
      , ppVisible   = dzenColor passive background . pad . (\x -> "^r(36x12)")
      , ppHidden   = dzenColor foreground background . pad . (\x -> "^ca(1, xdotool key alt+" ++ show x ++")^r(36x12)^ca()")
      , ppHiddenNoWindows   = dzenColor foreground  background . pad . (\x -> "^ca(1, xdotool key alt+" ++ show x ++ ")^ro(36x12)^ca()")
      , ppWsSep   = ""
      , ppSep   = "   "
      , ppLayout   = dzenColor background background . shorten 0
      , ppTitle   = dzenColor background background . shorten 0
      , ppOrder   = \(ws:l:t:_) -> [ws, l, t]
      , ppOutput   = hPutStrLn h
    } )

myWorkspaceBar = "dzen2 -x '0' -y '0' -h '36' -w '1420' -ta 'l' -fg '"++foreground++"' -bg '"++background++"' -fn "++myFont++" -e onstart=lower"
myStatusBar = "/home/michael/.xmonad/zen_bar '"++foreground++"' '"++background++"' '"++ iconColor ++"' "++myFont

main = do
  dzenLeftBar <- spawnPipe myWorkspaceBar
  dzenRightBar <- spawnPipe myStatusBar
  xmonad $ defaultConfig
    { terminal = myTerminal
    , borderWidth = myBorderWidth
    , layoutHook = smartBorders $ myLayout
    , workspaces = myWorkspaces
    , manageHook = newManageHook
    , focusedBorderColor = foreground
    , normalBorderColor = background
    , startupHook = setWMName "LG3D"
    , logHook = myLogHook dzenLeftBar
    }

    `additionalKeys`
    [((mod1Mask, xK_x), kill)
    ,((mod1Mask, xK_r), spawn "~/bin/dmenu2_run")
    ,((mod1Mask, xK_p), spawn "~/bin/dmenu2_run")
    ,((mod1Mask, xK_o), swapNextScreen)
    ,((mod1Mask .|. shiftMask, xK_o), shiftNextScreen)
    ]

myTerminal    = "urxvt"
myBorderWidth = 5
-- Font
myFont        = "-*-hermit-medium-r-*-*-16-*-*-*-*-*-*-*"
-- Colors
iconColor     = passive
foreground    = "#1DB5A2"
background    = "#151A21"
active        = "#25323A"
passive       = "#B5E8DA"

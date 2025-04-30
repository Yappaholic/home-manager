Config { lowerOnStart = True
       , overrideRedirect = False
       , font     = "xft:JetBrainsMono Nerd Font-12"
       , bgColor  = "#073642"
       , fgColor  = "#f8f8f2"
       , position = Static { xpos = 0 , ypos = 0, width = 1920, height = 24 }
       , commands = [Run Cpu
                        [ "-L", "3"
                        , "-H", "50"
                        , "--high"  , "red"
                        , "--normal", "green"
                        ] 10
                    , Run DiskU [("/", "<used>")]
                                ["-L", "20", "-H", "50", "-m", "1", "-p", "3"]
                                20
                    , Run Memory ["--template", "Mem: <usedratio>%"] 10
                    , Run Com "wpctl" ["get-volume", "@DEFAULT_SINK@"] "pulse" 10
                    , Run Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
                    , Run UnsafeStdinReader
                    ]
       , sepChar  = "^"
       , alignSep = "}{"
       , template = "^UnsafeStdinReader^ }{ ^cpu^ | Disk: ^disku^ | ^memory^ | <action=`wpctl set-volume @DEFAULT_SINK@ 5%+` button=1><action=`wpctl set-volume @DEFAULT_SINK@ 5%-` button=3>^pulse^%</action></action> | ^date^"
       }


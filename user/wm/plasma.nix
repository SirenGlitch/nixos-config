{
  config,
  userSettings,
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  programs.plasma = {
    enable = true;
    shortcuts = {
      "ActivityManager"."switch-to-activity-376f3971-0208-4ecf-8a0f-303d0c6f9912" = [ ];
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
      "kaccess"."Toggle Screen Reader On and Off" = "Meta+Alt+S";
      "kcm_touchpad"."Disable Touchpad" = "Touchpad Off";
      "kcm_touchpad"."Enable Touchpad" = "Touchpad On";
      "kcm_touchpad"."Toggle Touchpad" = [
        "Touchpad Toggle"
        "Meta+Ctrl+Touchpad Toggle"
        "Meta+Ctrl+Zenkaku Hankaku,Touchpad Toggle"
        "Touchpad Toggle"
        "Meta+Ctrl+Touchpad Toggle"
        "Meta+Ctrl+Zenkaku Hankaku"
      ];
      "kmix"."decrease_microphone_volume" = "Microphone Volume Down";
      "kmix"."decrease_volume" = "Volume Down";
      "kmix"."decrease_volume_small" = "Shift+Volume Down";
      "kmix"."increase_microphone_volume" = "Microphone Volume Up";
      "kmix"."increase_volume" = "Volume Up";
      "kmix"."increase_volume_small" = "Shift+Volume Up";
      "kmix"."mic_mute" = [
        "Microphone Mute"
        "Meta+Volume Mute,Microphone Mute"
        "Meta+Volume Mute,Mute Microphone"
      ];
      "kmix"."mute" = "Volume Mute";
      "ksmserver"."Halt Without Confirmation" = "none,,Shut Down Without Confirmation";
      "ksmserver"."Lock Session" = [
        "Meta+L"
        "Screensaver,Meta+L"
        "Screensaver,Lock Session"
      ];
      "ksmserver"."Log Out" = "Ctrl+Alt+Del";
      "ksmserver"."Log Out Without Confirmation" = "none,,Log Out Without Confirmation";
      "ksmserver"."LogOut" = "none,,Log Out";
      "ksmserver"."Reboot" = "none,,Reboot";
      "ksmserver"."Reboot Without Confirmation" = "none,,Reboot Without Confirmation";
      "ksmserver"."Shut Down" = "none,,Shut Down";
      "kwin"."Activate Window Demanding Attention" = "Meta+Ctrl+A";
      "kwin"."Cube" = "Meta+C";
      "kwin"."Cycle Overview" = [ ];
      "kwin"."Cycle Overview Opposite" = [ ];
      "kwin"."Decrease Opacity" = "none,,Decrease Opacity of Active Window by 5%";
      "kwin"."Edit Tiles" = "Meta+T";
      "kwin"."Expose" = "Ctrl+F9";
      "kwin"."ExposeAll" = [
        "Ctrl+F10"
        "Launch (C),Ctrl+F10"
        "Launch (C),Toggle Present Windows (All desktops)"
      ];
      "kwin"."ExposeClass" = "Ctrl+F7";
      "kwin"."ExposeClassCurrentDesktop" = [ ];
      "kwin"."Grid View" = "Meta+G";
      "kwin"."Increase Opacity" = "none,,Increase Opacity of Active Window by 5%";
      "kwin"."Invert" = "Meta+Ctrl+I";
      "kwin"."Invert Screen Colors" = [ ];
      "kwin"."InvertWindow" = "Meta+Ctrl+U";
      "kwin"."Kill Window" = "Meta+Ctrl+Esc";
      "kwin"."Move Tablet to Next Output" = [ ];
      "kwin"."MoveMouseToCenter" = "Meta+F6";
      "kwin"."MoveMouseToFocus" = "Meta+F5";
      "kwin"."MoveZoomDown" = [ ];
      "kwin"."MoveZoomLeft" = [ ];
      "kwin"."MoveZoomRight" = [ ];
      "kwin"."MoveZoomUp" = [ ];
      "kwin"."Overview" = [
        "Meta+Tab"
        "Meta+W,Meta+W,Toggle Overview"
      ];
      "kwin"."Setup Window Shortcut" = "none,,Setup Window Shortcut";
      "kwin"."Show Desktop" = "Meta+D";
      "kwin"."Switch One Desktop Down" = "Meta+Ctrl+Down";
      "kwin"."Switch One Desktop Up" = "Meta+Ctrl+Up";
      "kwin"."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      "kwin"."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      "kwin"."Switch Window Down" = "Meta+Alt+Down";
      "kwin"."Switch Window Left" = "Meta+Alt+Left";
      "kwin"."Switch Window Right" = "Meta+Alt+Right";
      "kwin"."Switch Window Up" = "Meta+Alt+Up";
      "kwin"."Switch to Desktop 1" = "Ctrl+F1";
      "kwin"."Switch to Desktop 10" = "none,,Switch to Desktop 10";
      "kwin"."Switch to Desktop 11" = "none,,Switch to Desktop 11";
      "kwin"."Switch to Desktop 12" = "none,,Switch to Desktop 12";
      "kwin"."Switch to Desktop 13" = "none,,Switch to Desktop 13";
      "kwin"."Switch to Desktop 14" = "none,,Switch to Desktop 14";
      "kwin"."Switch to Desktop 15" = "none,,Switch to Desktop 15";
      "kwin"."Switch to Desktop 16" = "none,,Switch to Desktop 16";
      "kwin"."Switch to Desktop 17" = "none,,Switch to Desktop 17";
      "kwin"."Switch to Desktop 18" = "none,,Switch to Desktop 18";
      "kwin"."Switch to Desktop 19" = "none,,Switch to Desktop 19";
      "kwin"."Switch to Desktop 2" = "Ctrl+F2";
      "kwin"."Switch to Desktop 20" = "none,,Switch to Desktop 20";
      "kwin"."Switch to Desktop 3" = "Ctrl+F3";
      "kwin"."Switch to Desktop 4" = "Ctrl+F4";
      "kwin"."Switch to Desktop 5" = "none,,Switch to Desktop 5";
      "kwin"."Switch to Desktop 6" = "none,,Switch to Desktop 6";
      "kwin"."Switch to Desktop 7" = "none,,Switch to Desktop 7";
      "kwin"."Switch to Desktop 8" = "none,,Switch to Desktop 8";
      "kwin"."Switch to Desktop 9" = "none,,Switch to Desktop 9";
      "kwin"."Switch to Next Desktop" = "none,,Switch to Next Desktop";
      "kwin"."Switch to Next Screen" = "none,,Switch to Next Screen";
      "kwin"."Switch to Previous Desktop" = "none,,Switch to Previous Desktop";
      "kwin"."Switch to Previous Screen" = "none,,Switch to Previous Screen";
      "kwin"."Switch to Screen 0" = "none,,Switch to Screen 0";
      "kwin"."Switch to Screen 1" = "none,,Switch to Screen 1";
      "kwin"."Switch to Screen 2" = "none,,Switch to Screen 2";
      "kwin"."Switch to Screen 3" = "none,,Switch to Screen 3";
      "kwin"."Switch to Screen 4" = "none,,Switch to Screen 4";
      "kwin"."Switch to Screen 5" = "none,,Switch to Screen 5";
      "kwin"."Switch to Screen 6" = "none,,Switch to Screen 6";
      "kwin"."Switch to Screen 7" = "none,,Switch to Screen 7";
      "kwin"."Switch to Screen Above" = "none,,Switch to Screen Above";
      "kwin"."Switch to Screen Below" = "none,,Switch to Screen Below";
      "kwin"."Switch to Screen to the Left" = "none,,Switch to Screen to the Left";
      "kwin"."Switch to Screen to the Right" = "none,,Switch to Screen to the Right";
      "kwin"."Toggle" = "Meta+Ctrl+Alt+P";
      "kwin"."Toggle Night Color" = [ ];
      "kwin"."Toggle Window Raise/Lower" = "none,,Toggle Window Raise/Lower";
      "kwin"."Walk Through Windows" = "Alt+Tab";
      "kwin"."Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
      "kwin"."Walk Through Windows Alternative" = "none,,Walk Through Windows Alternative";
      "kwin"."Walk Through Windows Alternative (Reverse)" =
        "none,,Walk Through Windows Alternative (Reverse)";
      "kwin"."Walk Through Windows of Current Application" = "Alt+`";
      "kwin"."Walk Through Windows of Current Application (Reverse)" = "Alt+~";
      "kwin"."Walk Through Windows of Current Application Alternative" =
        "none,,Walk Through Windows of Current Application Alternative";
      "kwin"."Walk Through Windows of Current Application Alternative (Reverse)" =
        "none,,Walk Through Windows of Current Application Alternative (Reverse)";
      "kwin"."Window Above Other Windows" = "none,,Keep Window Above Others";
      "kwin"."Window Below Other Windows" = "none,,Keep Window Below Others";
      "kwin"."Window Close" = "Alt+F4";
      "kwin"."Window Custom Quick Tile Bottom" = "none,,Custom Quick Tile Window to the Bottom";
      "kwin"."Window Custom Quick Tile Left" = "none,,Custom Quick Tile Window to the Left";
      "kwin"."Window Custom Quick Tile Right" = "none,,Custom Quick Tile Window to the Right";
      "kwin"."Window Custom Quick Tile Top" = "none,,Custom Quick Tile Window to the Top";
      "kwin"."Window Fullscreen" = "none,,Make Window Fullscreen";
      "kwin"."Window Grow Horizontal" = "none,,Expand Window Horizontally";
      "kwin"."Window Grow Vertical" = "none,,Expand Window Vertically";
      "kwin"."Window Lower" = "none,,Lower Window";
      "kwin"."Window Maximize" = "Meta+PgUp";
      "kwin"."Window Maximize Horizontal" = "none,,Maximise Window Horizontally";
      "kwin"."Window Maximize Vertical" = "none,,Maximise Window Vertically";
      "kwin"."Window Minimize" = "Meta+PgDown";
      "kwin"."Window Move" = "none,,Move Window";
      "kwin"."Window Move Center" = "none,,Move Window to the Centre";
      "kwin"."Window No Border" = "none,,Toggle Window Titlebar and Frame";
      "kwin"."Window On All Desktops" = "none,,Keep Window on All Desktops";
      "kwin"."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      "kwin"."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      "kwin"."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      "kwin"."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      "kwin"."Window One Screen Down" = "none,,Move Window One Screen Down";
      "kwin"."Window One Screen Up" = "none,,Move Window One Screen Up";
      "kwin"."Window One Screen to the Left" = "none,,Move Window One Screen to the Left";
      "kwin"."Window One Screen to the Right" = "none,,Move Window One Screen to the Right";
      "kwin"."Window Operations Menu" = "Alt+F3";
      "kwin"."Window Pack Down" = "none,,Move Window Down";
      "kwin"."Window Pack Left" = "none,,Move Window Left";
      "kwin"."Window Pack Right" = "none,,Move Window Right";
      "kwin"."Window Pack Up" = "none,,Move Window Up";
      "kwin"."Window Quick Tile Bottom" = "Meta+Down";
      "kwin"."Window Quick Tile Bottom Left" = "none,,Quick Tile Window to the Bottom Left";
      "kwin"."Window Quick Tile Bottom Right" = "none,,Quick Tile Window to the Bottom Right";
      "kwin"."Window Quick Tile Left" = "Meta+Left";
      "kwin"."Window Quick Tile Right" = "Meta+Right";
      "kwin"."Window Quick Tile Top" = "Meta+Up";
      "kwin"."Window Quick Tile Top Left" = "none,,Quick Tile Window to the Top Left";
      "kwin"."Window Quick Tile Top Right" = "none,,Quick Tile Window to the Top Right";
      "kwin"."Window Raise" = "none,,Raise Window";
      "kwin"."Window Resize" = "none,,Resize Window";
      "kwin"."Window Shade" = "none,,Shade Window";
      "kwin"."Window Shrink Horizontal" = "none,,Shrink Window Horizontally";
      "kwin"."Window Shrink Vertical" = "none,,Shrink Window Vertically";
      "kwin"."Window to Desktop 1" = "none,,Window to Desktop 1";
      "kwin"."Window to Desktop 10" = "none,,Window to Desktop 10";
      "kwin"."Window to Desktop 11" = "none,,Window to Desktop 11";
      "kwin"."Window to Desktop 12" = "none,,Window to Desktop 12";
      "kwin"."Window to Desktop 13" = "none,,Window to Desktop 13";
      "kwin"."Window to Desktop 14" = "none,,Window to Desktop 14";
      "kwin"."Window to Desktop 15" = "none,,Window to Desktop 15";
      "kwin"."Window to Desktop 16" = "none,,Window to Desktop 16";
      "kwin"."Window to Desktop 17" = "none,,Window to Desktop 17";
      "kwin"."Window to Desktop 18" = "none,,Window to Desktop 18";
      "kwin"."Window to Desktop 19" = "none,,Window to Desktop 19";
      "kwin"."Window to Desktop 2" = "none,,Window to Desktop 2";
      "kwin"."Window to Desktop 20" = "none,,Window to Desktop 20";
      "kwin"."Window to Desktop 3" = "none,,Window to Desktop 3";
      "kwin"."Window to Desktop 4" = "none,,Window to Desktop 4";
      "kwin"."Window to Desktop 5" = "none,,Window to Desktop 5";
      "kwin"."Window to Desktop 6" = "none,,Window to Desktop 6";
      "kwin"."Window to Desktop 7" = "none,,Window to Desktop 7";
      "kwin"."Window to Desktop 8" = "none,,Window to Desktop 8";
      "kwin"."Window to Desktop 9" = "none,,Window to Desktop 9";
      "kwin"."Window to Next Desktop" = "none,,Window to Next Desktop";
      "kwin"."Window to Next Screen" = "Meta+Shift+Right";
      "kwin"."Window to Previous Desktop" = "none,,Window to Previous Desktop";
      "kwin"."Window to Previous Screen" = "Meta+Shift+Left";
      "kwin"."Window to Screen 0" = "none,,Move Window to Screen 0";
      "kwin"."Window to Screen 1" = "none,,Move Window to Screen 1";
      "kwin"."Window to Screen 2" = "none,,Move Window to Screen 2";
      "kwin"."Window to Screen 3" = "none,,Move Window to Screen 3";
      "kwin"."Window to Screen 4" = "none,,Move Window to Screen 4";
      "kwin"."Window to Screen 5" = "none,,Move Window to Screen 5";
      "kwin"."Window to Screen 6" = "none,,Move Window to Screen 6";
      "kwin"."Window to Screen 7" = "none,,Move Window to Screen 7";
      "kwin"."disableInputCapture" = "Meta+Shift+Esc";
      "kwin"."view_actual_size" = "Meta+0";
      "kwin"."view_zoom_in" = [
        "Meta++"
        "Meta+=,Meta++"
        "Meta+=,Zoom In"
      ];
      "kwin"."view_zoom_out" = "Meta+-";
      "mediacontrol"."mediavolumedown" = "none,,Media volume down";
      "mediacontrol"."mediavolumeup" = "none,,Media volume up";
      "mediacontrol"."nextmedia" = "Media Next";
      "mediacontrol"."pausemedia" = "Media Pause";
      "mediacontrol"."playmedia" = "none,,Play media playback";
      "mediacontrol"."playpausemedia" = "Media Play";
      "mediacontrol"."previousmedia" = "Media Previous";
      "mediacontrol"."stopmedia" = "Media Stop";
      "org_kde_powerdevil"."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
      "org_kde_powerdevil"."Decrease Screen Brightness" = "Monitor Brightness Down";
      "org_kde_powerdevil"."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
      "org_kde_powerdevil"."Hibernate" = "Hibernate";
      "org_kde_powerdevil"."Increase Keyboard Brightness" = "Keyboard Brightness Up";
      "org_kde_powerdevil"."Increase Screen Brightness" = "Monitor Brightness Up";
      "org_kde_powerdevil"."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
      "org_kde_powerdevil"."PowerDown" = "Power Down";
      "org_kde_powerdevil"."PowerOff" = "Power Off";
      "org_kde_powerdevil"."Sleep" = "Sleep";
      "org_kde_powerdevil"."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
      "org_kde_powerdevil"."Turn Off Screen" = [ ];
      "org_kde_powerdevil"."powerProfile" = [
        "Battery"
        "Meta+B,Battery"
        "Meta+B,Switch Power Profile"
      ];
      "plasmashell"."activate application launcher" = [
        "Meta"
        "Alt+F1,Meta"
        "Alt+F1,Activate Application Launcher"
      ];
      "plasmashell"."activate task manager entry 1" = "Meta+1";
      "plasmashell"."activate task manager entry 10" = "none,,Activate Task Manager Entry 10";
      "plasmashell"."activate task manager entry 2" = "Meta+2";
      "plasmashell"."activate task manager entry 3" = "Meta+3";
      "plasmashell"."activate task manager entry 4" = "Meta+4";
      "plasmashell"."activate task manager entry 5" = "Meta+5";
      "plasmashell"."activate task manager entry 6" = "Meta+6";
      "plasmashell"."activate task manager entry 7" = "Meta+7";
      "plasmashell"."activate task manager entry 8" = "Meta+8";
      "plasmashell"."activate task manager entry 9" = "Meta+9";
      "plasmashell"."clear-history" = "none,,Clear Clipboard History";
      "plasmashell"."clipboard_action" = "Meta+Ctrl+X";
      "plasmashell"."cycle-panels" = "Meta+Alt+P";
      "plasmashell"."cycleNextAction" = "none,,Next History Item";
      "plasmashell"."cyclePrevAction" = "none,,Previous History Item";
      "plasmashell"."manage activities" = "Meta+Q";
      "plasmashell"."next activity" = "Meta+A,none,Walk through activities";
      "plasmashell"."previous activity" = "Meta+Shift+A,none,Walk through activities (Reverse)";
      "plasmashell"."repeat_action" = "none,,Manually Invoke Action on Current Clipboard";
      "plasmashell"."show dashboard" = "Ctrl+F12";
      "plasmashell"."show-barcode" = "none,,Show Barcode…";
      "plasmashell"."show-on-mouse-pos" = "Meta+V";
      "plasmashell"."stop current activity" = "Meta+S";
      "plasmashell"."switch to next activity" = "none,,Switch to Next Activity";
      "plasmashell"."switch to previous activity" = "none,,Switch to Previous Activity";
      "plasmashell"."toggle do not disturb" = "none,,Toggle do not disturb";
    };
    configFile = {
      "baloofilerc"."General"."dbVersion" = 2;
      "baloofilerc"."General"."exclude filters" =
        "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.tfstate*,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,.terraform,.venv,venv,core-dumps,lost+found";
      "baloofilerc"."General"."exclude filters version" = 9;
      "dolphinrc"."General"."ViewPropsTimestamp" = "2025,8,26,22,31,42.644";
      "dolphinrc"."KFileDialog Settings"."Places Icons Auto-resize" = false;
      "dolphinrc"."KFileDialog Settings"."Places Icons Static Size" = 22;
      "kactivitymanagerdrc"."activities"."376f3971-0208-4ecf-8a0f-303d0c6f9912" = "Default";
      "kactivitymanagerdrc"."main"."currentActivity" = "376f3971-0208-4ecf-8a0f-303d0c6f9912";
      "katerc"."General"."Allow Tab Scrolling" = true;
      "katerc"."General"."Auto Hide Tabs" = false;
      "katerc"."General"."Close After Last" = false;
      "katerc"."General"."Close documents with window" = true;
      "katerc"."General"."Cycle To First Tab" = true;
      "katerc"."General"."Days Meta Infos" = 30;
      "katerc"."General"."Diagnostics Limit" = 12000;
      "katerc"."General"."Diff Show Style" = 0;
      "katerc"."General"."Elide Tab Text" = false;
      "katerc"."General"."Enable Context ToolView" = false;
      "katerc"."General"."Expand Tabs" = false;
      "katerc"."General"."Icon size for left and right sidebar buttons" = 32;
      "katerc"."General"."Modified Notification" = false;
      "katerc"."General"."Mouse back button action" = 0;
      "katerc"."General"."Mouse forward button action" = 0;
      "katerc"."General"."Open New Tab To The Right Of Current" = false;
      "katerc"."General"."Output History Limit" = 100;
      "katerc"."General"."Output With Date" = false;
      "katerc"."General"."Recent File List Entry Count" = 10;
      "katerc"."General"."Restore Window Configuration" = true;
      "katerc"."General"."SDI Mode" = false;
      "katerc"."General"."Save Meta Infos" = true;
      "katerc"."General"."Show Full Path in Title" = false;
      "katerc"."General"."Show Menu Bar" = true;
      "katerc"."General"."Show Status Bar" = true;
      "katerc"."General"."Show Symbol In Navigation Bar" = true;
      "katerc"."General"."Show Tab Bar" = true;
      "katerc"."General"."Show Tabs Close Button" = true;
      "katerc"."General"."Show Url Nav Bar" = true;
      "katerc"."General"."Show output view for message type" = 1;
      "katerc"."General"."Show text for left and right sidebar" = false;
      "katerc"."General"."Show welcome view for new window" = true;
      "katerc"."General"."Startup Session" = "manual";
      "katerc"."General"."Stash new unsaved files" = true;
      "katerc"."General"."Stash unsaved file changes" = false;
      "katerc"."General"."Sync section size with tab positions" = false;
      "katerc"."General"."Tab Double Click New Document" = true;
      "katerc"."General"."Tab Middle Click Close Document" = true;
      "katerc"."General"."Tabbar Tab Limit" = 0;
      "katerc"."KTextEditor Document"."Allow End of Line Detection" = true;
      "katerc"."KTextEditor Document"."Auto Detect Indent" = true;
      "katerc"."KTextEditor Document"."Auto Reload If State Is In Version Control" = true;
      "katerc"."KTextEditor Document"."Auto Save" = false;
      "katerc"."KTextEditor Document"."Auto Save Interval" = 0;
      "katerc"."KTextEditor Document"."Auto Save On Focus Out" = false;
      "katerc"."KTextEditor Document"."BOM" = false;
      "katerc"."KTextEditor Document"."Backup Local" = false;
      "katerc"."KTextEditor Document"."Backup Prefix" = "";
      "katerc"."KTextEditor Document"."Backup Remote" = false;
      "katerc"."KTextEditor Document"."Backup Suffix" = "~";
      "katerc"."KTextEditor Document"."Camel Cursor" = true;
      "katerc"."KTextEditor Document"."Encoding" = "UTF-8";
      "katerc"."KTextEditor Document"."End of Line" = 0;
      "katerc"."KTextEditor Document"."Indent On Backspace" = true;
      "katerc"."KTextEditor Document"."Indent On Tab" = true;
      "katerc"."KTextEditor Document"."Indent On Text Paste" = true;
      "katerc"."KTextEditor Document"."Indentation Mode" = "normal";
      "katerc"."KTextEditor Document"."Indentation Width" = 2;
      "katerc"."KTextEditor Document"."Keep Extra Spaces" = false;
      "katerc"."KTextEditor Document"."Line Length Limit" = 10000;
      "katerc"."KTextEditor Document"."Newline at End of File" = true;
      "katerc"."KTextEditor Document"."On-The-Fly Spellcheck" = false;
      "katerc"."KTextEditor Document"."Overwrite Mode" = false;
      "katerc"."KTextEditor Document"."PageUp/PageDown Moves Cursor" = false;
      "katerc"."KTextEditor Document"."Remove Spaces" = 1;
      "katerc"."KTextEditor Document"."ReplaceTabsDyn" = true;
      "katerc"."KTextEditor Document"."Show Spaces" = 0;
      "katerc"."KTextEditor Document"."Show Tabs" = true;
      "katerc"."KTextEditor Document"."Smart Home" = true;
      "katerc"."KTextEditor Document"."Swap Directory" = "";
      "katerc"."KTextEditor Document"."Swap File Mode" = 1;
      "katerc"."KTextEditor Document"."Swap Sync Interval" = 15;
      "katerc"."KTextEditor Document"."Tab Handling" = 2;
      "katerc"."KTextEditor Document"."Tab Width" = 2;
      "katerc"."KTextEditor Document"."Trailing Marker Size" = 1;
      "katerc"."KTextEditor Document"."Use Editor Config" = true;
      "katerc"."KTextEditor Document"."Word Wrap" = false;
      "katerc"."KTextEditor Document"."Word Wrap Column" = 80;
      "katerc"."KTextEditor Renderer"."Animate Bracket Matching" = false;
      "katerc"."KTextEditor Renderer"."Auto Color Theme Selection" = true;
      "katerc"."KTextEditor Renderer"."Color Theme" = "Breeze Dark";
      "katerc"."KTextEditor Renderer"."Line Height Multiplier" = 1;
      "katerc"."KTextEditor Renderer"."Show Indentation Lines" = true;
      "katerc"."KTextEditor Renderer"."Show Whole Bracket Expression" = false;
      "katerc"."KTextEditor Renderer"."Text Font" =
        "JetBrainsMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "katerc"."KTextEditor Renderer"."Text Font Features" = "";
      "katerc"."KTextEditor Renderer"."Word Wrap Marker" = false;
      "katerc"."KTextEditor View"."Allow Mark Menu" = true;
      "katerc"."KTextEditor View"."Auto Brackets" = true;
      "katerc"."KTextEditor View"."Auto Center Lines" = 0;
      "katerc"."KTextEditor View"."Auto Completion" = true;
      "katerc"."KTextEditor View"."Auto Completion Preselect First Entry" = true;
      "katerc"."KTextEditor View"."Backspace Remove Composed Characters" = false;
      "katerc"."KTextEditor View"."Bookmark Menu Sorting" = 0;
      "katerc"."KTextEditor View"."Bracket Match Preview" = false;
      "katerc"."KTextEditor View"."Chars To Enclose Selection" = "<>(){}[]'\"";
      "katerc"."KTextEditor View"."Cycle Through Bookmarks" = true;
      "katerc"."KTextEditor View"."Default Mark Type" = 1;
      "katerc"."KTextEditor View"."Dynamic Word Wrap" = true;
      "katerc"."KTextEditor View"."Dynamic Word Wrap Align Indent" = 80;
      "katerc"."KTextEditor View"."Dynamic Word Wrap At Static Marker" = false;
      "katerc"."KTextEditor View"."Dynamic Word Wrap Indicators" = 1;
      "katerc"."KTextEditor View"."Dynamic Wrap not at word boundaries" = false;
      "katerc"."KTextEditor View"."Enable Accessibility" = true;
      "katerc"."KTextEditor View"."Enable Tab completion" = false;
      "katerc"."KTextEditor View"."Enter To Insert Completion" = true;
      "katerc"."KTextEditor View"."Fold First Line" = false;
      "katerc"."KTextEditor View"."Folding Bar" = true;
      "katerc"."KTextEditor View"."Folding Preview" = true;
      "katerc"."KTextEditor View"."Icon Bar" = false;
      "katerc"."KTextEditor View"."Input Mode" = 1;
      "katerc"."KTextEditor View"."Keyword Completion" = true;
      "katerc"."KTextEditor View"."Line Modification" = true;
      "katerc"."KTextEditor View"."Line Numbers" = true;
      "katerc"."KTextEditor View"."Max Clipboard History Entries" = 20;
      "katerc"."KTextEditor View"."Maximum Search History Size" = 100;
      "katerc"."KTextEditor View"."Mouse Paste At Cursor Position" = false;
      "katerc"."KTextEditor View"."Multiple Cursor Modifier" = 134217728;
      "katerc"."KTextEditor View"."Persistent Selection" = false;
      "katerc"."KTextEditor View"."Scroll Bar Marks" = false;
      "katerc"."KTextEditor View"."Scroll Bar Mini Map All" = true;
      "katerc"."KTextEditor View"."Scroll Bar Mini Map Width" = 60;
      "katerc"."KTextEditor View"."Scroll Bar MiniMap" = true;
      "katerc"."KTextEditor View"."Scroll Bar Preview" = true;
      "katerc"."KTextEditor View"."Scroll Past End" = false;
      "katerc"."KTextEditor View"."Search/Replace Flags" = 140;
      "katerc"."KTextEditor View"."Shoe Line Ending Type in Statusbar" = false;
      "katerc"."KTextEditor View"."Show Documentation With Completion" = true;
      "katerc"."KTextEditor View"."Show File Encoding" = true;
      "katerc"."KTextEditor View"."Show Folding Icons On Hover Only" = true;
      "katerc"."KTextEditor View"."Show Line Count" = false;
      "katerc"."KTextEditor View"."Show Scrollbars" = 2;
      "katerc"."KTextEditor View"."Show Statusbar Dictionary" = true;
      "katerc"."KTextEditor View"."Show Statusbar Highlighting Mode" = true;
      "katerc"."KTextEditor View"."Show Statusbar Input Mode" = true;
      "katerc"."KTextEditor View"."Show Statusbar Line Column" = true;
      "katerc"."KTextEditor View"."Show Statusbar Tab Settings" = true;
      "katerc"."KTextEditor View"."Show Word Count" = false;
      "katerc"."KTextEditor View"."Smart Copy Cut" = true;
      "katerc"."KTextEditor View"."Statusbar Line Column Compact Mode" = true;
      "katerc"."KTextEditor View"."Text Drag And Drop" = true;
      "katerc"."KTextEditor View"."User Sets Of Chars To Enclose Selection" = "";
      "katerc"."KTextEditor View"."Vi Input Mode Steal Keys" = false;
      "katerc"."KTextEditor View"."Vi Relative Line Numbers" = true;
      "katerc"."KTextEditor View"."Word Completion" = true;
      "katerc"."KTextEditor View"."Word Completion Minimal Word Length" = 3;
      "katerc"."KTextEditor View"."Word Completion Remove Tail" = true;
      "katerc"."Konsole"."AutoSyncronizeMode" = 0;
      "katerc"."Konsole"."KonsoleEscKeyBehaviour" = true;
      "katerc"."Konsole"."KonsoleEscKeyExceptions" = "vi,vim,nvim,git";
      "katerc"."Konsole"."RemoveExtension" = false;
      "katerc"."Konsole"."RunPrefix" = "";
      "katerc"."Konsole"."SetEditor" = false;
      "katerc"."filetree"."editShade" = "183,220,246";
      "katerc"."filetree"."listMode" = false;
      "katerc"."filetree"."middleClickToClose" = false;
      "katerc"."filetree"."shadingEnabled" = true;
      "katerc"."filetree"."showCloseButton" = false;
      "katerc"."filetree"."showFullPathOnRoots" = false;
      "katerc"."filetree"."showToolbar" = true;
      "katerc"."filetree"."sortRole" = 0;
      "katerc"."filetree"."viewShade" = "211,190,222";
      "katerc"."lspclient"."AllowedServerCommandLines" = "/run/current-system/sw/bin/nil";
      "katerc"."lspclient"."AutoHover" = true;
      "katerc"."lspclient"."AutoImport" = true;
      "katerc"."lspclient"."BlockedServerCommandLines" = "";
      "katerc"."lspclient"."CompletionDocumentation" = true;
      "katerc"."lspclient"."CompletionParens" = true;
      "katerc"."lspclient"."Diagnostics" = true;
      "katerc"."lspclient"."FormatOnSave" = true;
      "katerc"."lspclient"."HighlightGoto" = true;
      "katerc"."lspclient"."IncrementalSync" = false;
      "katerc"."lspclient"."InlayHints" = true;
      "katerc"."lspclient"."Messages" = true;
      "katerc"."lspclient"."ReferencesDeclaration" = true;
      "katerc"."lspclient"."SemanticHighlighting" = true;
      "katerc"."lspclient"."ServerConfiguration" = "";
      "katerc"."lspclient"."ShowCompletions" = true;
      "katerc"."lspclient"."SignatureHelp" = true;
      "katerc"."lspclient"."SymbolDetails" = false;
      "katerc"."lspclient"."SymbolExpand" = true;
      "katerc"."lspclient"."SymbolSort" = false;
      "katerc"."lspclient"."SymbolTree" = true;
      "katerc"."lspclient"."TypeFormatting" = false;
      "kcminputrc"."Keyboard"."NumLock" = 0;
      "kcminputrc"."Libinput/5426/171/Razer Razer Basilisk V3 Pro"."PointerAccelerationProfile" = 1;
      "kded5rc"."Module-browserintegrationreminder"."autoload" = false;
      "kded5rc"."Module-device_automounter"."autoload" = false;
      "kdeglobals"."General"."UseSystemBell" = true;
      "kdeglobals"."General"."XftAntialias" = true;
      "kdeglobals"."General"."XftHintStyle" = "hintslight";
      "kdeglobals"."General"."XftSubPixel" = "rgb";
      "kdeglobals"."General"."fixed" = "JetBrainsMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."KFileDialog Settings"."Allow Expansion" = false;
      "kdeglobals"."KFileDialog Settings"."Automatically select filename extension" = true;
      "kdeglobals"."KFileDialog Settings"."Breadcrumb Navigation" = true;
      "kdeglobals"."KFileDialog Settings"."Decoration position" = 2;
      "kdeglobals"."KFileDialog Settings"."LocationCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."PathCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."Show Bookmarks" = false;
      "kdeglobals"."KFileDialog Settings"."Show Full Path" = false;
      "kdeglobals"."KFileDialog Settings"."Show Inline Previews" = true;
      "kdeglobals"."KFileDialog Settings"."Show Preview" = false;
      "kdeglobals"."KFileDialog Settings"."Show Speedbar" = true;
      "kdeglobals"."KFileDialog Settings"."Show hidden files" = false;
      "kdeglobals"."KFileDialog Settings"."Sort by" = "Name";
      "kdeglobals"."KFileDialog Settings"."Sort directories first" = true;
      "kdeglobals"."KFileDialog Settings"."Sort hidden files last" = false;
      "kdeglobals"."KFileDialog Settings"."Sort reversed" = false;
      "kdeglobals"."KFileDialog Settings"."Speedbar Width" = 140;
      "kdeglobals"."KFileDialog Settings"."View Style" = "DetailTree";
      "kdeglobals"."WM"."activeBackground" = "49,54,59";
      "kdeglobals"."WM"."activeBlend" = "252,252,252";
      "kdeglobals"."WM"."activeForeground" = "252,252,252";
      "kdeglobals"."WM"."inactiveBackground" = "42,46,50";
      "kdeglobals"."WM"."inactiveBlend" = "161,169,177";
      "kdeglobals"."WM"."inactiveForeground" = "161,169,177";
      "kiorc"."Confirmations"."ConfirmDelete" = true;
      "ksplashrc"."KSplash"."Theme" = "Watch_Dogs_Theme";
      "kwalletrc"."Wallet"."First Use" = false;
      "kwinrc"."Activities/LastVirtualDesktop"."376f3971-0208-4ecf-8a0f-303d0c6f9912" =
        "fe21e3f0-c215-4888-9878-0ea2b5b5ee65";
      "kwinrc"."Desktops"."Id_1" = "fe21e3f0-c215-4888-9878-0ea2b5b5ee65";
      "kwinrc"."Desktops"."Number" = 1;
      "kwinrc"."Desktops"."Rows" = 1;
      "kwinrc"."Effect-overview"."BorderActivate" = 9;
      "kwinrc"."Plugins"."cubeEnabled" = true;
      "kwinrc"."Plugins"."magiclampEnabled" = true;
      "kwinrc"."Plugins"."squashEnabled" = false;
      "kwinrc"."Tiling"."padding" = 4;
      "kwinrc"."Tiling/79e4f1f2-e151-5bac-971e-641d6738703d"."tiles" =
        "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/d02c035d-eef0-5c68-aa2f-2e83d0ba08b1"."tiles" =
        "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Xwayland"."Scale" = 1.75;
      "plasma-localerc"."Formats"."LANG" = "en_GB.UTF-8";
      "plasmanotifyrc"."Applications/vesktop"."Seen" = true;
      "spectaclerc"."GuiConfig"."captureMode" = 0;
      "spectaclerc"."ImageSave"."translatedScreenshotsFolder" = "Screenshots";
      "spectaclerc"."VideoSave"."translatedScreencastsFolder" = "Screencasts";
    };
  };
}

{ ... }:
let
  primaryMod = "Ctrl";
  secondaryMod = "Alt";
in
{
  home.programs.zellij = {
    enable = true;
    extraConfig = ''
      default_mode "locked"
      keybinds clear-defaults=true {
        normal {
        }
        locked {
            bind "${primaryMod} g" { SwitchToMode "normal"; }
        }
        resize {
            bind "r" { SwitchToMode "normal"; }
            bind "h" "Left" { Resize "Increase Left"; }
            bind "j" "Down" { Resize "Increase Down"; }
            bind "k" "Up" { Resize "Increase Up"; }
            bind "l" "Right" { Resize "Increase Right"; }
            bind "H" { Resize "Decrease Left"; }
            bind "J" { Resize "Decrease Down"; }
            bind "K" { Resize "Decrease Up"; }
            bind "L" { Resize "Decrease Right"; }
            bind "=" "+" { Resize "Increase"; }
            bind "-" { Resize "Decrease"; }
        }
        pane {
            bind "p" { SwitchToMode "normal"; }
            bind "h" "Left" { MoveFocus "Left"; }
            bind "l" "Right" { MoveFocus "Right"; }
            bind "j" "Down" { MoveFocus "Down"; }
            bind "k" "Up" { MoveFocus "Up"; }
            bind "Tab" { SwitchFocus; }
            bind ";" { FocusLastPane; }
            bind "n" { NewPane; SwitchToMode "locked"; }
            bind "d" { NewPane "Down"; SwitchToMode "locked"; }
            bind "r" { NewPane "Right"; SwitchToMode "locked"; }
            bind "s" { NewPane "stacked"; SwitchToMode "locked"; }
            bind "x" { CloseFocus; SwitchToMode "locked"; }
            bind "f" { ToggleFocusFullscreen; SwitchToMode "locked"; }
            bind "Shift f" { ToggleFocusNoUiFullscreen; SwitchToMode "locked"; }
            bind "z" { TogglePaneFrames; SwitchToMode "locked"; }
            bind "w" { ToggleFloatingPanes; SwitchToMode "locked"; }
            bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "locked"; }
            bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0;}
            bind "i" { TogglePanePinned; SwitchToMode "locked"; }
        }
        move {
            bind "m" { SwitchToMode "normal"; }
            bind "n" "Tab" { MovePane; }
            bind "p" { MovePaneBackwards; }
            bind "h" "Left" { MovePane "Left"; }
            bind "j" "Down" { MovePane "Down"; }
            bind "k" "Up" { MovePane "Up"; }
            bind "l" "Right" { MovePane "Right"; }
        }
        tab {
            bind "t" { SwitchToMode "normal"; }
            bind "r" { SwitchToMode "renametab"; TabNameInput 0; }
            bind "h" "Left" "Up" "k" { GoToPreviousTab; }
            bind "l" "Right" "Down" "j" { GoToNextTab; }
            bind "n" { NewTab; SwitchToMode "locked"; }
            bind "x" { CloseTab; SwitchToMode "locked"; }
            bind "s" { ToggleActiveSyncTab; SwitchToMode "locked"; }
            bind "b" { BreakPane; SwitchToMode "locked"; }
            bind "]" { BreakPaneRight; SwitchToMode "locked"; }
            bind "[" { BreakPaneLeft; SwitchToMode "locked"; }
            bind "1" { GoToTab 1; SwitchToMode "locked"; }
            bind "2" { GoToTab 2; SwitchToMode "locked"; }
            bind "3" { GoToTab 3; SwitchToMode "locked"; }
            bind "4" { GoToTab 4; SwitchToMode "locked"; }
            bind "5" { GoToTab 5; SwitchToMode "locked"; }
            bind "6" { GoToTab 6; SwitchToMode "locked"; }
            bind "7" { GoToTab 7; SwitchToMode "locked"; }
            bind "8" { GoToTab 8; SwitchToMode "locked"; }
            bind "9" { GoToTab 9; SwitchToMode "locked"; }
            bind "Tab" { ToggleTab; }
        }
        scroll {
            bind "s" { SwitchToMode "normal"; }
            bind "e" { EditScrollback; SwitchToMode "locked"; }
            bind "f" { SwitchToMode "entersearch"; SearchInput 0; }
            bind "Ctrl c" { ScrollToBottom; SwitchToMode "locked"; }
            bind "j" "Down" { ScrollDown; }
            bind "k" "Up" { ScrollUp; }
            bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
            bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp; }
            bind "Alt left" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
            bind "Alt down" { MoveFocus "down"; SwitchToMode "locked"; }
            bind "Alt up" { MoveFocus "up"; SwitchToMode "locked"; }
            bind "Alt right" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
            bind "Alt h" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
            bind "Alt j" { MoveFocus "down"; SwitchToMode "locked"; }
            bind "Alt k" { MoveFocus "up"; SwitchToMode "locked"; }
            bind "Alt l" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
            bind "[" { ScrollToPreviousPrompt; }
            bind "]" { ScrollToNextPrompt; }
            bind "m" { SelectCommandAtScrollPosition; }
            bind "c" { CopyLastCommandOutput; SwitchToMode "locked"; }
        }
        search {
            bind "Ctrl c" { ScrollToBottom; SwitchToMode "locked"; }
            bind "j" "Down" { ScrollDown; }
            bind "k" "Up" { ScrollUp; }
            bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
            bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp; }
            bind "n" { Search "down"; }
            bind "p" { Search "up"; }
            bind "c" { SearchToggleOption "CaseSensitivity"; }
            bind "w" { SearchToggleOption "Wrap"; }
            bind "o" { SearchToggleOption "WholeWord"; }
            bind "[" { ScrollToPreviousPrompt; }
            bind "]" { ScrollToNextPrompt; }
            bind "m" { SelectCommandAtScrollPosition; }
        }
        entersearch {
            bind "Ctrl c" "Esc" { SwitchToMode "scroll"; }
            bind "Enter" { SwitchToMode "search"; }
        }
        renametab {
            bind "Ctrl c" "Enter" { SwitchToMode "locked"; }
            bind "Esc" { UndoRenameTab; SwitchToMode "tab"; }
        }
        renamepane {
            bind "Ctrl c" "Enter" { SwitchToMode "locked"; }
            bind "Esc" { UndoRenamePane; SwitchToMode "pane"; }
        }
        session {
            bind "o" { SwitchToMode "normal"; }
            bind "d" { Detach; }
            bind "]" { FocusHostSession; SwitchToMode "locked"; }
            bind "[" { FocusGuestSession; SwitchToMode "locked"; }
            bind "f" { ToggleHostFullscreen; SwitchToMode "locked"; }
            bind "w" {
                LaunchOrFocusPlugin "session-manager" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "locked"
            }
            bind "c" {
                LaunchOrFocusPlugin "configuration" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "locked"
            }
            bind "p" {
                LaunchOrFocusPlugin "plugin-manager" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "locked"
            }
            bind "a" {
                LaunchOrFocusPlugin "zellij:about" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "locked"
            }
            bind "s" {
                LaunchOrFocusPlugin "zellij:share" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "locked"
            }
            bind "l" {
                LaunchOrFocusPlugin "zellij:layout-manager" {
                    floating true
                    move_to_focused_tab true
                };
                SwitchToMode "locked"
            }
        }
        shared_except "locked" "renametab" "renamepane" {
            bind "${primaryMod} g" { SwitchToMode "locked"; }
            bind "${primaryMod} q" { Quit; }
        }
        shared_except "renamepane" "renametab" "entersearch" "locked" {
            bind "esc" { SwitchToMode "locked"; }
        }
        shared_among "normal" "locked" {
            bind "${secondaryMod} n" { NewPane; }
            bind "${secondaryMod} f" { ToggleFloatingPanes; }
            bind "${secondaryMod} i" { MoveTab "Left"; }
            bind "${secondaryMod} o" { MoveTab "Right"; }
            bind "${secondaryMod} h" "${secondaryMod} Left" { MoveFocusOrTab "Left"; }
            bind "${secondaryMod} l" "${secondaryMod} Right" { MoveFocusOrTab "Right"; }
            bind "${secondaryMod} j" "${secondaryMod} Down" { MoveFocus "Down"; }
            bind "${secondaryMod} k" "${secondaryMod} Up" { MoveFocus "Up"; }
            bind "${secondaryMod} =" "${secondaryMod} +" { Resize "Increase"; }
            bind "${secondaryMod} -" { Resize "Decrease"; }
            bind "${secondaryMod} [" { PreviousSwapLayout; }
            bind "${secondaryMod} ]" { NextSwapLayout; }
            bind "${secondaryMod} p" { TogglePaneInGroup; }
            bind "${secondaryMod} Shift p" { ToggleGroupMarking; }
        }
        shared_except "locked" "renametab" "renamepane" {
            bind "Enter" { SwitchToMode "locked"; }
        }
        shared_except "pane" "locked" "renametab" "renamepane" "entersearch" {
            bind "p" { SwitchToMode "pane"; }
        }
        shared_except "resize" "locked" "renametab" "renamepane" "entersearch" {
            bind "r" { SwitchToMode "resize"; }
        }
        shared_except "scroll" "locked" "renametab" "renamepane" "entersearch" {
            bind "s" { SwitchToMode "scroll"; }
        }
        shared_except "session" "locked" "renametab" "renamepane" "entersearch" {
            bind "o" { SwitchToMode "session"; }
        }
        shared_except "tab" "locked" "renametab" "renamepane" "entersearch" {
            bind "t" { SwitchToMode "tab"; }
        }
        shared_except "move" "locked" "renametab" "renamepane" "entersearch" {
            bind "m" { SwitchToMode "move"; }
        }
      }
    '';
  };
}

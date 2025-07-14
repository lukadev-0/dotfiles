import { createBinding, createComputed, For } from "ags";
import { Gtk } from "ags/gtk4";
import Hyprland from "gi://AstalHyprland";

const hyprland = Hyprland.get_default();

const workspaces = createBinding(hyprland, "workspaces").as(() =>
  Array.from({ length: 9 }, (_, idx) => {
    const id = idx + 1;
    return hyprland.get_workspace(id) ?? Hyprland.Workspace.dummy(id, null);
  }),
);

const focusedWorkspace = createBinding(hyprland, "focused_workspace");

export function BarWorkspaces() {
  return (
    <box
      class="BarWorkspaces"
      orientation={Gtk.Orientation.VERTICAL}
      halign={Gtk.Align.CENTER}
      spacing={2}
    >
      <For each={workspaces}>
        {(workspace, idx) => {
          const id = idx.as((idx) => idx + 1);

          const empty = createBinding(workspace, "clients").as(
            (c) => c.length === 0,
          );
          const focused = createComputed(
            [focusedWorkspace, id],
            (focusedWorkspace, id) => focusedWorkspace.get_id() === id,
          );

          const className = createComputed(
            [empty, focused],
            (empty, focused) => {
              const classes = ["BarWorkspaces-workspace-indicator"];
              if (empty) classes.push("BarWorkspaces-workspace-empty");
              if (focused) classes.push("BarWorkspaces-workspace-focused");
              return classes.join(" ");
            },
          );

          return (
            <box class="BarWorkspaces-workspace" halign={Gtk.Align.CENTER}>
              <box class={className} valign={Gtk.Align.CENTER} />
            </box>
          );
        }}
      </For>
    </box>
  );
}

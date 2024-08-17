import { applications } from "resource:///com/github/Aylur/ags/service/applications.js";
import type { Application } from "types/service/applications";

export const applicationMap = Variable(getApplicationMap());

applications.connect("changed", () => {
  applicationMap.value = getApplicationMap();
});

function getApplicationMap() {
  const map = new Map<string, Application>();

  for (const application of applications.list) {
    const classes = getApplicationClasses(application);
    for (const applicationClass of classes) {
      map.set(applicationClass, application);
    }
  }

  return map;
}

function getApplicationClasses(application: Application) {
  const classes = new Set<string>();

  const wmClass = application.wm_class;

  if (wmClass !== null && wmClass !== "") {
    classes.add(wmClass);
  }

  if (application.desktop !== null) {
    const match = application.desktop.match(/^(.*)\.desktop$/);
    if (match !== null) {
      classes.add(match[1]);
    }
  }

  return classes;
}

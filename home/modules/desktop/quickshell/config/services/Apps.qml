pragma Singleton

import "../scripts/fuzzysort.js" as Fuzzy
import Quickshell

Singleton {
  readonly property list<DesktopEntry> list: [...DesktopEntries.applications.values]
    .sort((a, b) => a.name.localeCompare(b.name))

  readonly property list<var> preppedApps: list.map(a => ({
    name: Fuzzy.prepare(a.name),
    description: Fuzzy.prepare(a.genericName || a.comment),
    keywords: Fuzzy.prepare(a.keywords.join()),
    entry: a
  }))

  function fuzzyQuery(search: string): list<var> {
    return Fuzzy.go(search, preppedApps, {
      all: true,
      keys: ["name", "description", "keywords"]
    }).map(r => r.obj.entry)
  }

  function launch(entry: DesktopEntry): void {
    Quickshell.execDetached(["sh", "-c",
      `uwsm app -- ${entry.id}.desktop || uwsm app -- ${entry.execString}`])
  }
}

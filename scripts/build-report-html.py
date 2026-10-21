#!/usr/bin/env python3
"""Build deliverables/report.html from deliverables/report.md.

Self-contained HTML: readable typography, styled tables, light/dark via prefers-color-scheme,
a table of contents built from the H2/H3 headings. HTML comments in the Markdown (the
`<!-- TODO-... -->` placeholders) are preserved verbatim so the page can be rebuilt after they are
filled in. Requires the `markdown` package (`pip install markdown`).

Usage: python3 scripts/build-report-html.py            (from anywhere)
       python3 scripts/build-report-html.py in.md out.html
"""
from __future__ import annotations

import html
import re
import sys
from pathlib import Path

import markdown

ROOT = Path(__file__).resolve().parent.parent
SRC = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT / "deliverables" / "report.md"
OUT = Path(sys.argv[2]) if len(sys.argv) > 2 else ROOT / "deliverables" / "report.html"

CSS = """
:root {
  color-scheme: light dark;
  --bg: #ffffff; --fg: #1d2330; --muted: #5b6474; --line: #d9dee7; --accent: #0b5d8a;
  --code-bg: #f3f5f8; --row: #f7f9fb; --head: #e9eef4; --todo: #fff4d6; --todo-fg: #6b4b00;
}
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #12161d; --fg: #e4e8ee; --muted: #a0a8b6; --line: #2d3542; --accent: #7fc1ea;
    --code-bg: #1b2029; --row: #171c25; --head: #202734; --todo: #3a2f12; --todo-fg: #f0d28a;
  }
}
* { box-sizing: border-box; }
html { font-size: 16px; }
body {
  margin: 0; background: var(--bg); color: var(--fg);
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  line-height: 1.55;
}
.wrap { display: grid; grid-template-columns: 260px minmax(0, 1fr); gap: 2rem; max-width: 1360px; margin: 0 auto; padding: 1.5rem 16px 4rem; }
nav.toc { position: sticky; top: 1rem; align-self: start; max-height: calc(100vh - 2rem); overflow: auto; font-size: 0.86rem; border-right: 1px solid var(--line); padding-right: 1rem; }
nav.toc h2 { font-size: 0.8rem; text-transform: uppercase; letter-spacing: .06em; color: var(--muted); margin: 0 0 .5rem; }
nav.toc ul { list-style: none; margin: 0; padding: 0; }
nav.toc li { margin: .15rem 0; }
nav.toc li.h3 { padding-left: .9rem; color: var(--muted); }
nav.toc a { color: inherit; text-decoration: none; }
nav.toc a:hover { color: var(--accent); }
main { min-width: 0; }
h1 { font-size: 1.9rem; line-height: 1.2; margin: 0 0 .5rem; }
h2 { font-size: 1.4rem; margin: 2.4rem 0 .8rem; padding-top: .6rem; border-top: 1px solid var(--line); }
h3 { font-size: 1.1rem; margin: 1.8rem 0 .6rem; }
p, li { max-width: 78ch; }
a { color: var(--accent); }
code, pre { font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace; font-size: .9em; }
code { background: var(--code-bg); padding: .1em .3em; border-radius: 3px; }
pre { background: var(--code-bg); padding: .8rem 1rem; border-radius: 6px; overflow-x: auto; line-height: 1.4; }
pre code { background: none; padding: 0; }
blockquote { margin: 1rem 0; padding: .2rem 1rem; border-left: 3px solid var(--line); color: var(--muted); }
hr { border: 0; border-top: 1px solid var(--line); margin: 2rem 0; }
.table-wrap { overflow-x: auto; margin: 1rem 0; }
table { border-collapse: collapse; width: 100%; font-size: .88rem; }
th, td { border: 1px solid var(--line); padding: .4rem .55rem; vertical-align: top; text-align: left; }
th { background: var(--head); font-weight: 600; }
tbody tr:nth-child(even) { background: var(--row); }
td { word-break: break-word; }
.todo { background: var(--todo); color: var(--todo-fg); border: 1px dashed var(--todo-fg); padding: .6rem .9rem; border-radius: 6px; margin: 1rem 0; font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace; font-size: .85rem; }
.meta { color: var(--muted); font-size: .9rem; }
input[type=checkbox] { margin-right: .4rem; }
@media (max-width: 900px) {
  .wrap { grid-template-columns: 1fr; }
  nav.toc { position: static; max-height: none; border-right: 0; border-bottom: 1px solid var(--line); padding: 0 0 1rem; margin-bottom: 1rem; }
}
@media print { nav.toc { display: none; } .wrap { display: block; } }
"""

TODO_RE = re.compile(r"<!--\s*(TODO-[A-Z0-9]+:.*?)-->", re.DOTALL)


def slugify(text: str) -> str:
    s = re.sub(r"[^\w\s-]", "", text.lower()).strip()
    return re.sub(r"[\s_]+", "-", s)


def main() -> None:
    text = SRC.read_text(encoding="utf-8")

    # Keep the TODO comments verbatim and also show them as visible callouts.
    placeholders: dict[str, str] = {}

    def keep(m: re.Match) -> str:
        key = f"TODOPLACEHOLDER{len(placeholders)}X"
        placeholders[key] = m.group(0)
        return f"\n\n{key}\n\n"

    text = TODO_RE.sub(keep, text)

    md = markdown.Markdown(
        extensions=["tables", "fenced_code", "toc", "sane_lists", "attr_list"],
        extension_configs={"toc": {"slugify": lambda v, s: slugify(v), "toc_depth": "2-3"}},
    )
    body = md.convert(text)

    for key, comment in placeholders.items():
        visible = html.escape(comment.strip("<!-> ").strip())
        body = body.replace(f"<p>{key}</p>", f"{comment}\n<div class=\"todo\">{visible}</div>")
        body = body.replace(key, f"{comment}\n<div class=\"todo\">{visible}</div>")

    # Wrap tables so wide ones scroll instead of breaking the layout.
    body = body.replace("<table>", '<div class="table-wrap"><table>').replace("</table>", "</table></div>")
    # Markdown task-list checkboxes.
    body = body.replace("<li>[ ] ", '<li><input type="checkbox" disabled> ').replace("<li>[x] ", '<li><input type="checkbox" checked disabled> ')

    # Table of contents from the toc extension's tokens (H2 and H3).
    items = []
    for tok in md.toc_tokens:
        items.append(f'<li class="h2"><a href="#{tok["id"]}">{html.escape(tok["name"])}</a></li>')
        for sub in tok.get("children", []):
            items.append(f'<li class="h3"><a href="#{sub["id"]}">{html.escape(sub["name"])}</a></li>')
    toc = "<nav class=\"toc\"><h2>Contents</h2><ul>" + "\n".join(items) + "</ul></nav>"

    title_m = re.search(r"^# (.+)$", text, re.MULTILINE)
    title = html.escape(title_m.group(1)) if title_m else "Report"

    page = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="noindex">
<title>{title}</title>
<style>{CSS}</style>
</head>
<body>
<div class="wrap">
{toc}
<main>
{body}
</main>
</div>
</body>
</html>
"""
    OUT.write_text(page, encoding="utf-8")
    print(f"wrote {OUT} ({len(page):,} bytes; {len(placeholders)} TODO placeholder(s) preserved)")


if __name__ == "__main__":
    main()

#tags: #KeyboardShortcuts #Photoshop #GIMP #Krita #PNG #ImageEditing #Layers #Selection #Crop #Transform #CLI #ImageMagick #DAO

# Keyboard-only image editing cheat-sheet (Windows)

Below is a compact, task-oriented reference that maps the most common **keyboard-only** actions across **Photoshop**, **GIMP**, and **Krita**. (Shortcuts can be customized; the ones shown are the **defaults** per vendors’ docs.)
**Tip:** If two apps disagree, I listed the *most native* choice for that app.

> Official references for the shortcuts below: Adobe’s default list; GIMP quick-reference + “Export As” docs; Krita manual (Selections, Layers, Crop, and “from Photoshop” guide). ([Adobe Help Center][1])

---

## Most-used actions (side-by-side)

| Task                                         | **Photoshop**                                   | **GIMP**                                       | **Krita**                                                                                                                     |
| -------------------------------------------- | ----------------------------------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **Deselect** (clear a selection)             | **Ctrl+D**                                      | **Ctrl+Shift+A**                               | **Ctrl+Shift+A** ([Adobe Help Center][1])                                                                                     |
| **Reselect** (bring back last selection)     | **Ctrl+Shift+D**                                | *(—)*                                          | **Ctrl+Shift+D** ([Adobe Help Center][1])                                                                                     |
| **Invert selection**                         | **Ctrl+Shift+I**                                | **Ctrl+I**                                     | **Ctrl+Shift+I** ([Adobe Help Center][1])                                                                                     |
| **Select all**                               | **Ctrl+A**                                      | **Ctrl+A**                                     | **Ctrl+A** ([Adobe Help Center][1])                                                                                           |
| **Move tool**                                | **V**                                           | **M**                                          | **T** (Move) ([Adobe Help Center][1])                                                                                         |
| **Crop tool**                                | **C** → **Enter** to commit, **Esc** cancel     | **Shift+C** → **Enter** commit                 | **C** → **Enter** commit ([Adobe Help Center][1])                                                                             |
| **Free Transform** (scale/rotate)            | **Ctrl+T**                                      | **Shift+T** (Scale tool), **Shift+R** (Rotate) | **Ctrl+T** (Transform tool) ([Adobe Help Center][1])                                                                          |
| **Brush**                                    | **B**                                           | **P**aintbrush = **P** (or **N** Pencil)       | **B** (Freehand Brush), **E** toggles eraser mode ([Adobe Help Center][1])                                                    |
| **Eraser**                                   | **E**                                           | **Shift+E**                                    | **E** toggles erase mode (same brush) ([Adobe Help Center][1])                                                                |
| **Zoom in / out**                            | **Ctrl +** / **Ctrl −**                         | **+** / **-**                                  | **Ctrl +** / **Ctrl −** (configurable) ([Adobe Help Center][1])                                                               |
| **Hand/Pan**                                 | **H** (or hold **Space**)                       | **Space** (hold)                               | **Space** (hold) ([Adobe Help Center][1])                                                                                     |
| **Rotate canvas** (view)                     | **R**                                           | *(via tools/menus)*                            | **Shift+Space** (drag) or **Ctrl+[ / Ctrl+]**; reset **5** ([Adobe Help Center][1])                                           |
| **New layer**                                | **Ctrl+Shift+N**                                | **Ctrl+Shift+N**                               | **Insert** (new paint layer) ([Adobe Help Center][1])                                                                         |
| **Duplicate layer / selection to new layer** | **Ctrl+J**                                      | **Ctrl+Shift+D** (Duplicate Layer)             | **Ctrl+J** ([Adobe Help Center][1])                                                                                           |
| **Group / Ungroup layers**                   | **Ctrl+G / Ctrl+Shift+G**                       | *(—)*                                          | **Ctrl+G** (group) ([Adobe Help Center][1])                                                                                   |
| **Merge down / Flatten**                     | **Ctrl+E** / **Ctrl+Shift+E** (merge visible)   | **Ctrl+M** (merge down)*                       | **Ctrl+E** (merge down) / **Ctrl+Shift+E** (flatten all) ([Adobe Help Center][1])                                             |
| **Hide “marching ants”**                     | **Ctrl+H** (Hide Extras)                        | **Shift+Q** (Quick Mask toggle)                | *(Use Deselect or hide Selection Mask)* ([Adobe Help Center][1])                                                              |
| **Export PNG**                               | **Ctrl+Alt+Shift+W** → choose PNG (“Export As”) | **Ctrl+Shift+E** → type `.png` → **Enter**     | **Export** (assign shortcut in Settings) or save then export; flatten via **Ctrl+Shift+E** if needed ([Adobe Help Center][1]) |

* GIMP’s exact merge-down shortcut can vary by version / keymap; use **Layer → Merge Down** if **Ctrl+M** isn’t mapped in yours. ([GIMP Documentation][2])

---

## PNG export — quick keyboard recipes

* **Photoshop:** **Ctrl+Alt+Shift+W** → set format to **PNG** → **Enter**. (You can also bind “Quick Export as PNG” to a shortcut via Edit → Keyboard Shortcuts.) ([Adobe Help Center][1])
* **GIMP:** **Ctrl+Shift+E** → type file name **ending in `.png`** → **Enter**, then **Enter** to confirm options. ([GIMP Documentation][3])
* **Krita:** Save work as `.kra`; optionally **Ctrl+Shift+E** to **Flatten All**, then **File → Export…** (assign your own shortcut in **Settings → Configure Krita → Shortcuts**). ([Krita Manual][4])

---

## Bonus: pure-keyboard CLI (ImageMagick)

If you want *no GUI at all* (still “keyboard-only”), these are handy:

```bash
# Crop to 1200x900 from top-left (0,0) and save PNG
magick in.jpg -crop 1200x900+0+0 +repage out.png

# Resize to width 1600 (keep aspect), sharpen a touch, save PNG
magick in.png -resize 1600 -unsharp 0x1 out.png

# Rotate 90° clockwise and trim transparent edges
magick in.png -rotate 90 -trim +repage out.png

# Batch convert JPGs to PNG in-place (keeps names)
magick mogrify -format png *.jpg
```

---

## DAO-style prompts (to guide your setup)

1. **Simplicity vs. sovereignty:** Which editor will be your team’s **standard** (Krita/GIMP/PS) so we can unify muscle-memory, templates, and training?
2. **Governance of assets:** Do we **mandate PNG** (lossless, transparency) for UI/docs, with SVG for vector and JPEG/WEBP only when size budgets demand? *(PNG history & modern spec support make it a safe default.)* ([Wikipedia][5])
3. **Provenance:** Do we require **export checklists** (color space, bit depth, alpha) and store **.kra/.xcf/.psd** sources alongside PNGs for auditability?

---

## Key terms & origins (quick glossary)

| Term              | Definition                                                                  | Etymology / shift (origin · earliest noted use)                                                                                                                          |
| ----------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Layer**         | Independent stackable image plane(s) you can edit non-destructively.        | Popularized in **Photoshop 3.0 (1994)**. “Layer” from Lat. *lavare*→late Lat. *lamina* (plate); digital “layers” became mainstream with PS 3.0. ([Web Design Museum][6]) |
| **Selection**     | A mask delimiting editable pixels. Can be inverted, reselected, or cleared. | “Select” from Lat. *seligere* (choose). Digital “marching ants” UI dates to early paint apps; modern invert/deselect shortcuts standardized in 1990s tools.              |
| **Crop**          | Permanently trim canvas to a rectangle.                                     | From agriculture (“to cut”) Middle Eng. *croppe*; in photography since early 20th c.; digitized with first paint programs.                                               |
| **Transform**     | Scale/rotate/skew with a bounding box (PS **Ctrl+T**).                      | From Lat. *transformare* (“to change shape”); “Free Transform” label standardized by Adobe in the 1990s. ([Adobe Help Center][1])                                        |
| **Alpha channel** | Extra channel that encodes transparency (RGBA).                             | Coined by **Alvy Ray Smith** (late 1970s; paper 1995 documents the history). ([CS at Princeton][7])                                                                      |
| **PNG**           | Lossless raster format with transparency; web-safe standard.                | **1996** release; **RFC 2083 (1997)**; standardized ISO/IEC 15948 (2004); **W3C PNG 3.0 (2025)** adds HDR/APNG/Exif. ([Wikipedia][5])                                    |

---

If you tell me which editor you’ll standardize on (Photoshop, **GIMP**, or **Krita**), I’ll generate a **print-ready 1-page cheat-sheet** (your keybinds only) and an **export QA checklist**—both in Markdown for your docs repo.

[1]: https://helpx.adobe.com/photoshop/using/default-keyboard-shortcuts.html?utm_source=chatgpt.com "Default keyboard shortcuts in Adobe Photoshop"
[2]: https://docs.gimp.org/quickreference/gimp-keys-en.pdf?utm_source=chatgpt.com "GIMP Quickreference"
[3]: https://docs.gimp.org/2.10/en/gimp-file-export-as.html?utm_source=chatgpt.com "2.13. Export As…"
[4]: https://docs.krita.org/en/tutorials/saving-for-the-web.html?utm_source=chatgpt.com "Saving For The Web"
[5]: https://en.wikipedia.org/wiki/PNG?utm_source=chatgpt.com "PNG"
[6]: https://www.webdesignmuseum.org/software/adobe-photoshop-3-0-in-1994?utm_source=chatgpt.com "Adobe Photoshop 3.0 in 1994"
[7]: https://www.cs.princeton.edu/courses/archive/spr05/cos426/papers/smith95c.pdf?utm_source=chatgpt.com "Alpha and the History of Digital Compositing"

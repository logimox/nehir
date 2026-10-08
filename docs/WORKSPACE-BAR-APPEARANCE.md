# Workspace Bar Appearance

Nehir's workspace bar can use a named colour theme and an optional animated background. Configure both in **Settings → Workspace Bar → Appearance**. The selected values are saved in `settings.toml` and applied to every workspace bar.

## Themes

The **Theme** picker provides:

- System
- Catppuccin Mocha
- Nord
- Dracula
- Gruvbox
- Tokyo Night
- Rosé Pine
- Solarized Dark
- One Dark
- Kanagawa
- Everforest
- Cyberpunk
- Monochrome

A named theme supplies three palette values:

- Bar background
- Bar text colour
- Accent colour for focused workspace pills and other highlighted bar controls

Named themes use a sufficiently opaque surface to remain visually distinct from the desktop. The **System** theme preserves the existing bar appearance and allows the custom Accent Color and Text Color controls to determine those values.

For a named theme, the palette's text colour takes precedence over Custom Text Color. This keeps the text readable against the theme's own background. Theme accents also colour focused window borders when **Settings → Borders → Enable Window Borders** is enabled. Changing a theme refreshes the focused border immediately; an unfocused or unavailable managed window has no border to display.

## Animated backgrounds

The **Animated Background** picker provides:

- None
- Aurora
- Drifting Stars
- Neon Grid
- Plasma
- Matrix Rain

When an effect is selected:

- **Animate Background** starts or pauses its timeline.
- **Background Effect Intensity** ranges from `0%` to `300%`. The value is passed directly to the renderer, so values above `100%` increase the visual effect rather than being reduced to the normal range.
- **Background Effect Speed** ranges from `0.1x` to `5.0x`.

Nehir pauses background animation when macOS Reduce Motion is enabled. The bar falls back to an opaque system surface when Reduce Transparency is enabled.

## TOML

The corresponding `settings.toml` values are in `[workspaceBar]`:

```toml
[workspaceBar]
theme = "cyberpunk"
backgroundEffect = "neonGrid"
backgroundEffectAnimated = true
backgroundEffectIntensity = 3.0
backgroundEffectSpeed = 1.0
```

Valid theme values are the lower-camel-case identifiers: `system`, `catppuccinMocha`, `nord`, `dracula`, `gruvbox`, `tokyoNight`, `rosePine`, `solarizedDark`, `oneDark`, `kanagawa`, `everforest`, `cyberpunk`, and `monochrome`.

Valid background effect values are `none`, `aurora`, `driftingStars`, `neonGrid`, `plasma`, and `matrixRain`.

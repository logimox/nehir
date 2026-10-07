// SPDX-FileCopyrightText: 2026 Nehir contributors
// SPDX-License-Identifier: GPL-2.0-only

import Foundation

struct WorkspaceBarThemePalette: Equatable {
    let background: SettingsColor
    let foreground: SettingsColor
    let accent: SettingsColor
    /// A named palette needs enough contrast to remain recognizable above the
    /// translucent workspace-bar material. The user's opacity setting can make
    /// it more opaque, but a theme never becomes visually indistinguishable.
    let minimumSurfaceOpacity: Double
}

enum WorkspaceBarTheme: String, CaseIterable, Codable, Identifiable {
    case system
    case catppuccinMocha
    case nord
    case dracula
    case gruvbox
    case tokyoNight
    case rosePine

    var id: String {
        rawValue
    }

    var displayName: String {
        switch self {
        case .system: "System"
        case .catppuccinMocha: "Catppuccin Mocha"
        case .nord: "Nord"
        case .dracula: "Dracula"
        case .gruvbox: "Gruvbox"
        case .tokyoNight: "Tokyo Night"
        case .rosePine: "Rosé Pine"
        }
    }

    var palette: WorkspaceBarThemePalette? {
        switch self {
        case .system:
            nil
        case .catppuccinMocha:
            .init(
                background: color(0x1E1E2E),
                foreground: color(0xCDD6F4),
                accent: color(0x89B4FA),
                minimumSurfaceOpacity: 0.78
            )
        case .nord:
            .init(
                background: color(0x2E3440),
                foreground: color(0xD8DEE9),
                accent: color(0x88C0D0),
                minimumSurfaceOpacity: 0.78
            )
        case .dracula:
            .init(
                background: color(0x282A36),
                foreground: color(0xF8F8F2),
                accent: color(0xBD93F9),
                minimumSurfaceOpacity: 0.78
            )
        case .gruvbox:
            .init(
                background: color(0x282828),
                foreground: color(0xEBDBB2),
                accent: color(0xD79921),
                minimumSurfaceOpacity: 0.78
            )
        case .tokyoNight:
            .init(
                background: color(0x1A1B26),
                foreground: color(0xC0CAF5),
                accent: color(0x7AA2F7),
                minimumSurfaceOpacity: 0.78
            )
        case .rosePine:
            .init(
                background: color(0x191724),
                foreground: color(0xE0DEF4),
                accent: color(0xC4A7E7),
                minimumSurfaceOpacity: 0.78
            )
        }
    }

    private func color(_ hex: UInt32) -> SettingsColor {
        SettingsColor(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            alpha: 1
        )
    }
}

enum WorkspaceBarBackgroundEffect: String, CaseIterable, Codable, Identifiable {
    case none
    case aurora
    case driftingStars
    case neonGrid
    case plasma
    case matrixRain

    var id: String {
        rawValue
    }

    var displayName: String {
        switch self {
        case .none: "None"
        case .aurora: "Aurora"
        case .driftingStars: "Drifting Stars"
        case .neonGrid: "Neon Grid"
        case .plasma: "Plasma"
        case .matrixRain: "Matrix Rain"
        }
    }
}

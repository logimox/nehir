// SPDX-FileCopyrightText: 2026 BarutSRB
// SPDX-FileCopyrightText: 2026 Aleksei Gurianov and Nehir contributors
// SPDX-FileComment: Provenance=upstream-derived; Upstream-Project=OmniWM; Upstream-Author=BarutSRB; Nehir-Changes-Since=2026; See=NOTICE.md
//
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
    case solarizedDark
    case oneDark
    case kanagawa
    case everforest
    case cyberpunk
    case monochrome

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
        case .solarizedDark: "Solarized Dark"
        case .oneDark: "One Dark"
        case .kanagawa: "Kanagawa"
        case .everforest: "Everforest"
        case .cyberpunk: "Cyberpunk"
        case .monochrome: "Monochrome"
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
                minimumSurfaceOpacity: 0.9
            )
        case .nord:
            .init(
                background: color(0x2E3440),
                foreground: color(0xD8DEE9),
                accent: color(0x88C0D0),
                minimumSurfaceOpacity: 0.9
            )
        case .dracula:
            .init(
                background: color(0x282A36),
                foreground: color(0xF8F8F2),
                accent: color(0xBD93F9),
                minimumSurfaceOpacity: 0.9
            )
        case .gruvbox:
            .init(
                background: color(0x282828),
                foreground: color(0xEBDBB2),
                accent: color(0xD79921),
                minimumSurfaceOpacity: 0.9
            )
        case .tokyoNight:
            .init(
                background: color(0x1A1B26),
                foreground: color(0xC0CAF5),
                accent: color(0x7AA2F7),
                minimumSurfaceOpacity: 0.9
            )
        case .rosePine:
            .init(
                background: color(0x191724),
                foreground: color(0xE0DEF4),
                accent: color(0xC4A7E7),
                minimumSurfaceOpacity: 0.9
            )
        case .solarizedDark:
            .init(
                background: color(0x002B36),
                foreground: color(0xFDF6E3),
                accent: color(0x2AA198),
                minimumSurfaceOpacity: 0.9
            )
        case .oneDark:
            .init(
                background: color(0x282C34),
                foreground: color(0xABB2BF),
                accent: color(0x61AFEF),
                minimumSurfaceOpacity: 0.9
            )
        case .kanagawa:
            .init(
                background: color(0x1F1F28),
                foreground: color(0xDCD7BA),
                accent: color(0x7E9CD8),
                minimumSurfaceOpacity: 0.9
            )
        case .everforest:
            .init(
                background: color(0x2D353B),
                foreground: color(0xD3C6AA),
                accent: color(0xA7C080),
                minimumSurfaceOpacity: 0.9
            )
        case .cyberpunk:
            .init(
                background: color(0x090014),
                foreground: color(0xF4EFFF),
                accent: color(0xFF00C8),
                minimumSurfaceOpacity: 0.94
            )
        case .monochrome:
            .init(
                background: color(0x050505),
                foreground: color(0xF5F5F5),
                accent: color(0xFFFFFF),
                minimumSurfaceOpacity: 0.96
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

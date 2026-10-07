// SPDX-FileCopyrightText: 2026 Nehir contributors
// SPDX-License-Identifier: GPL-2.0-only

import SwiftUI

struct WorkspaceBarBackgroundEffectView: View {
    let effect: WorkspaceBarBackgroundEffect
    let accentColor: Color
    let intensity: Double
    let speed: Double
    let isAnimated: Bool

    var body: some View {
        TimelineView(.animation(minimumInterval: 1.0 / 20.0, paused: !isAnimated || effect == .none)) { timeline in
            Canvas { context, size in
                let phase = timeline.date.timeIntervalSinceReferenceDate * speed
                let alpha = intensity.clamped(to: 0 ... 1)

                switch effect {
                case .none:
                    break
                case .aurora:
                    drawAurora(in: &context, size: size, phase: phase, alpha: alpha)
                case .driftingStars:
                    drawStars(in: &context, size: size, phase: phase, alpha: alpha)
                case .neonGrid:
                    drawGrid(in: &context, size: size, phase: phase, alpha: alpha)
                case .plasma:
                    drawPlasma(in: &context, size: size, phase: phase, alpha: alpha)
                case .matrixRain:
                    drawMatrixRain(in: &context, size: size, phase: phase, alpha: alpha)
                }
            }
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }

    private func drawAurora(in context: inout GraphicsContext, size: CGSize, phase: Double, alpha: Double) {
        for band in 0 ..< 4 {
            let y = size.height * (0.15 + CGFloat(band) * 0.24) + sin(phase + Double(band)) * 14
            let rect = CGRect(x: -24, y: y, width: size.width + 48, height: 18)
            context.fill(
                Path(ellipseIn: rect),
                with: .linearGradient(
                    Gradient(colors: [
                        accentColor.opacity(0.08 * alpha),
                        .green.opacity(0.22 * alpha),
                        .purple.opacity(0.08 * alpha)
                    ]),
                    startPoint: CGPoint(x: 0, y: y),
                    endPoint: CGPoint(x: size.width, y: y)
                )
            )
        }
    }

    private func drawStars(in context: inout GraphicsContext, size: CGSize, phase: Double, alpha: Double) {
        guard size.width > 0, size.height > 0 else { return }
        for index in 0 ..< 24 {
            let x = CGFloat((index * 83) % max(1, Int(size.width)))
            let y = (CGFloat((index * 47) % max(1, Int(size.height))) + phase * CGFloat(6 + index % 5))
                .truncatingRemainder(dividingBy: size.height)
            let radius: CGFloat = index.isMultiple(of: 3) ? 1.8 : 0.8
            context.fill(
                Path(ellipseIn: CGRect(x: x, y: y, width: radius, height: radius)),
                with: .color(.white.opacity(0.65 * alpha))
            )
        }
    }

    private func drawGrid(in context: inout GraphicsContext, size: CGSize, phase: Double, alpha: Double) {
        let spacing: CGFloat = 18
        let offset = CGFloat(phase).truncatingRemainder(dividingBy: spacing)
        for x in stride(from: -spacing + offset, through: size.width, by: spacing) {
            context.stroke(
                Path(CGRect(x: x, y: 0, width: 0.7, height: size.height)),
                with: .color(accentColor.opacity(0.25 * alpha)),
                lineWidth: 0.7
            )
        }
        for y in stride(from: -spacing + offset, through: size.height, by: spacing) {
            context.stroke(
                Path(CGRect(x: 0, y: y, width: size.width, height: 0.7)),
                with: .color(.purple.opacity(0.16 * alpha)),
                lineWidth: 0.7
            )
        }
    }

    private func drawPlasma(in context: inout GraphicsContext, size: CGSize, phase: Double, alpha: Double) {
        for band in 0 ..< 8 {
            let y = size.height * CGFloat(band) / 8 + sin(phase * 1.7 + Double(band)) * 12
            let hue = (sin(phase + Double(band)) + 1) / 2
            context.fill(
                Path(CGRect(x: 0, y: y, width: size.width, height: 14)),
                with: .color(Color(hue: hue, saturation: 0.72, brightness: 0.9).opacity(0.16 * alpha))
            )
        }
    }

    private func drawMatrixRain(in context: inout GraphicsContext, size: CGSize, phase: Double, alpha: Double) {
        guard size.height > 0 else { return }
        let cell: CGFloat = 12
        let offset = CGFloat(phase * 42)
        for column in stride(from: CGFloat(0), to: size.width + cell, by: cell) {
            let seed = CGFloat(Int(column / cell) * 17 % 31)
            for row in 0 ..< Int(size.height / cell) + 3 {
                let y = (CGFloat(row) * cell + offset + seed)
                    .truncatingRemainder(dividingBy: size.height + cell) - cell
                let trail = max(0, 1 - CGFloat(row % 9) / 10)
                let glyph = String(UnicodeScalar(0x30A0 + UInt32((row * 7 + Int(column)) % 96))!)
                context.draw(
                    Text(glyph).font(.system(size: 9, design: .monospaced))
                        .foregroundStyle(.green.opacity(0.65 * trail * alpha)),
                    at: CGPoint(x: column + 5, y: y + 5)
                )
            }
        }
    }
}

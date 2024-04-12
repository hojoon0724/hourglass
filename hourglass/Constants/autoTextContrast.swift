//
//  autoTextContrast.swift
//  hourglass
//
//  Created by Hojoon Kim on 4/12/24.
//

import Foundation
import SwiftUI

extension Text {
    func getContrastText(backgroundColor: Color) -> some View {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        UIColor(backgroundColor).getRed(&r, green: &g, blue: &b, alpha: &a)
        let luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return luminance < 0.6 ? foregroundColor(.white) : foregroundColor(.black)
    }
}

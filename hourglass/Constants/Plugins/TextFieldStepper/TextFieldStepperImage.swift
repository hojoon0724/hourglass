import SwiftUI

public struct TextFieldStepperImage: View {
    let image: Image
    let color: Color

    public init(image: Image, color: Color = Color.accentColor) {
        self.image = image
        self.color = color
    }

    #if os(visionOS)
        public init(systemName: String, color: Color = Color.primary) {
            self.init(image: Image(systemName: systemName), color: color)
        }
    #else
        public init(systemName: String, color: Color = Color.accentColor) {
            self.init(image: Image(systemName: systemName), color: color)
        }
    #endif

    #if os(visionOS)
        public var body: some View {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15, height: 15)
        }
    #else
        public var body: some View {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
        }
    #endif
}

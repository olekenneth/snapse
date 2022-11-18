//
//  ContentView.swift
//  Snapse
//
//  Created by Ole-Kenneth Bratholt on 14/11/2022.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct ImageView: View {
    @Binding var image: UIImage?
    @State private var orientation = UIDeviceOrientation.unknown

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "xmark")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "paperplane.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.teal)
                        .padding()
                    Spacer().frame(width: 10)
                }
                .background(.ultraThinMaterial)
            }

            if image !== nil {
                let image = Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .layoutPriority(-1)
                    .zIndex(-1)

                if orientation.isLandscape {
                    image
                        .rotationEffect(.degrees(90))
                } else {
                    image
                }
            }
        }
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.all)
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

struct ImageViewWithImage: View {
    @State private var image: UIImage? = UIImage(asset: Asset.demoImage)

    var body: some View {
        HStack {
            ImageView(image: $image)
        }
    }
}
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewWithImage()
    }
}

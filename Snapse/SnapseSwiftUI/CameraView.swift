//
//  CameraView.swift
//  Snapse
//
//  Created by Ole-Kenneth Bratholt on 15/11/2022.
//

import SwiftUI

struct CameraView: View {
    
    let cameraService = CameraService()
    @State var capturedImage: UIImage?
    @State private var isImageCaptured = false
    
    var body: some View {
        ZStack {
            CameraPreview(cameraService: cameraService) { result in
                switch result {
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data: data)
                        isImageCaptured = true
                    } else {
                        print("Error: no image data found")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
            
            VStack {
                Spacer()
                Button(action: {
                    cameraService.capturePhoto()
                }, label: {
                    Image(systemName: "circle")
                        .font(.system(size: 84))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                })
                .padding(50)
            }
            .sheet(isPresented: $isImageCaptured, content: {
                ImageView(image: $capturedImage)
            })
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

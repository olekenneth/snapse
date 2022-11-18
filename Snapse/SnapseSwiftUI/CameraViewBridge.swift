//
//  CameraViewBridge.swift
//  Snapse
//
//  Created by Ole-Kenneth Bratholt on 15/11/2022.
//

import SwiftUI
import AVFoundation

struct CameraPreview: UIViewControllerRepresentable {
    let cameraService: CameraService
    let didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        DispatchQueue.global(qos: .background).async {
            cameraService.start(delegate: context.coordinator) { err in
                if let err = err {
                    didFinishProcessingPhoto(.failure(err))
                    return
                }
            }
        }

        let viewController = UIViewController()
        viewController.view.backgroundColor = .black
        viewController.view.layer.addSublayer(cameraService.previewLayer)
        cameraService.previewLayer.frame = viewController.view.bounds
        return viewController
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, didFinishProcessingPhoto: didFinishProcessingPhoto, cameraService: cameraService)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }

    class Coordinator: NSObject, AVCapturePhotoCaptureDelegate {
        let parent: CameraPreview
        private var didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> Void
        private var cameraService: CameraService

        init(_ parent: CameraPreview,
             didFinishProcessingPhoto: @escaping (Result<AVCapturePhoto, Error>) -> Void, cameraService: CameraService) {
            self.parent = parent
            self.didFinishProcessingPhoto = didFinishProcessingPhoto
            self.cameraService = cameraService
        }

        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            // self.cameraService.stop()

            if let error = error {
                didFinishProcessingPhoto(.failure(error))
                return
            }
            didFinishProcessingPhoto(.success(photo))
        }
    }
}

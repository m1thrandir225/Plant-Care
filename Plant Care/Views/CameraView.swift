//
//  CameraView.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 20.6.24.
//

import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
	@Environment(\.presentationMode) var presentationMode
	@Binding var selectedImage: UIImage?
	
	
	
	var sourceType: UIImagePickerController.SourceType = .camera
	
	func makeCoordinator() -> CameraCoordinator {
		return CameraCoordinator(parent: self)
	}
	
	func makeUIViewController(context: Context) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		picker.sourceType = sourceType
		picker.allowsEditing = false
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

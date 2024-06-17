//
//  ImagePickerView.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 17.6.24.
//

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
	@Environment(\.presentationMode) var presentationMode
	@Binding var selectedImage: UIImage?
	
	
	
	var sourceType: UIImagePickerController.SourceType = .photoLibrary
	
	func makeCoordinator() -> ImagePickerCoordinator {
		return ImagePickerCoordinator(parent: self)
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

//
//  ImagePickerCoordinator.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 17.6.24.
//

import Foundation
import UIKit
import SwiftUI



class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
	var parent: ImagePickerView
	
	init(parent: ImagePickerView) {
		self.parent = parent
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let image = info[.originalImage] as? UIImage {
			parent.selectedImage = image
		}
		
		parent.presentationMode.wrappedValue.dismiss()
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		parent.presentationMode.wrappedValue.dismiss()
	}
}

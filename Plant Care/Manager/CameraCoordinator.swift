//
//  CameraCoordinator.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 20.6.24.
//

import Foundation
import UIKit
import SwiftUI


class CameraCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
	var parent: CameraView
	
	init(parent: CameraView) {
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

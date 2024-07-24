//
//  UserPlant.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 16.6.24.
//

import Foundation
import SwiftData
import UserNotifications


enum WateringFrequency: CaseIterable, Codable {
	case Daily
	case Weekly
	case Monthly
}

enum SunlightExposure: CaseIterable, Codable {
	case FullSun
	case PartSun
	case PartShade
	case FullShade
	case DenseShade
}


@Model class UserPlant {
	var name: String

	var image: Data
	var wateringFrequency: WateringFrequency
	var sunlightExposure: SunlightExposure
	var audioRecordings: [AudioRecording]
	
	
	init(name: String, image: Data, wateringFrequency: WateringFrequency, sunlightExposure: SunlightExposure) {
		self.name = name
		self.image = image
		self.wateringFrequency = wateringFrequency
		self.sunlightExposure = sunlightExposure
		self.audioRecordings = []
	}
	
	func removeRecording(_ recording: AudioRecording) {
		if let index = audioRecordings.firstIndex(where: { $0.id == recording.id }) {
			audioRecordings.remove(at: index)
		}
	}
}

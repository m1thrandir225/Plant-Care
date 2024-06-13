//
//  Plant.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import Foundation
import SwiftUI
import CoreLocation


struct Plant: Hashable, Codable, Identifiable {
	var id: Int
	var name: String
	var watering: String
	var sunlight: String
	
	private var imageName: String
	var image: Image {
		Image(imageName)
	}
	
	private var coordinates: Coordinates
	
	var locationCoordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(
			latitude: coordinates.latitude,
			longitude: coordinates.longitude
		)

	}
	
	struct Coordinates: Hashable, Codable {
		var latitude: Double
		var longitude: Double
	}
}

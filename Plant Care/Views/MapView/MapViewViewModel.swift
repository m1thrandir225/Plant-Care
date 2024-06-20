//
//  MapViewViewModel.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 20.6.24.
//

import Foundation
import MapKit



final class MapViewViewModel: ObservableObject {
	@Published var isLoading = false
	@Published var coordinates: CLLocationCoordinate2D? = nil
	private var locationName: String
	
	init(locationName: String) {
		self.locationName = locationName
	}
	
	func getLocationCoordinates() {
		isLoading = true
		
		CLGeocoder().geocodeAddressString(locationName, completionHandler: {(placemarks, error) -> Void in
			if error != nil {
				return;
			}
			
			if placemarks != nil {
				if placemarks!.count > 0 {
					let pm = placemarks![0]
					self.coordinates  = pm.location!.coordinate
					self.isLoading = false
				}
			}
			else {
				self.isLoading = false
				print("Problem with the data received from geocoder")
			}
		})
	}
}

//
//  MapView.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI
import MapKit

struct MapView: View {
	@State var coordinate: CLLocationCoordinate2D
	
	
    var body: some View {
		Map(position: .constant(.region(region)))
			.onAppear {
					getReversedLocation()
			}
	}
	
	
	private var region: MKCoordinateRegion {
		MKCoordinateRegion(
			center: coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
	}
	
	func getReversedLocation() {
		CLGeocoder().geocodeAddressString("Spain", completionHandler: {(placemarks, error) -> Void in
			if error != nil {
				return;
			}
			
			if placemarks != nil {
				if placemarks!.count > 0 {
					let pm = placemarks![0]
					coordinate  = pm.location!.coordinate
				}
			}
			else {
				print("Problem with the data received from geocoder")
			}
		})
	}
}

#Preview {
	MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}

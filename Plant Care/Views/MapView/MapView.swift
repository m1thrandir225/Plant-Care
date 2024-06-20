//
//  MapView.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI
import MapKit

struct MapView: View {
	
	var location: String
	@ObservedObject var viewModel: MapViewViewModel
	
	init(locationName: String) {
		self.location = locationName
		self.viewModel = MapViewViewModel(locationName: locationName)
	}
	
    var body: some View {
		ZStack {
			if(viewModel.isLoading) {
				ProgressView()
			} else {
				if let coordinates = viewModel.coordinates {
					Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(
						center: coordinates, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
					)))
				}
			}
		}.onAppear {
			viewModel.getLocationCoordinates()
		}.toolbar(.hidden, for: .tabBar)
			.navigationTitle("Location for: \(location)")
			.navigationBarTitleDisplayMode(.inline)
	}
	
}

#Preview {
	MapView(locationName: "Spain")
}

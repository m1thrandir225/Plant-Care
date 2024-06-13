//
//  PlantDetail.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI

struct PlantDetail: View {
	var plant: Plant
	
	
    var body: some View {
		ScrollView {
			MapView(coordinate: plant.locationCoordinate)
				.frame(height: 300)
			
			ImageCircle(image: plant.image)
				.offset(y: -130)
				.padding(.bottom, -130)
			
			VStack(alignment: .leading) {
				Text (plant.name)
					.font(.title)
				
				HStack {
					Text("Sunlight \(plant.sunlight)")
					Spacer()
					Text("Watering \(plant.watering)")
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				
				Divider()
				
				Text("About \(plant.name)")
					.font(.title2)
				Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
			}.padding()
		}
		.navigationTitle(plant.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PlantDetail(plant: plants[1])
}

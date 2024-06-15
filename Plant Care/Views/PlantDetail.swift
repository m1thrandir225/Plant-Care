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
			ImageCircle(imageUrl: plant.imageUrl)
				.offset(y: -130)
				.padding(.bottom, -130)
			
			VStack(alignment: .leading) {
				Text (plant.commonName)
					.font(.title)
				
				HStack {
					Text("Family: \(plant.family)")
					Spacer()
					Text("Family Common Name: \(plant.familyCommonName)")
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				
				Divider()
				
				Text("About \(plant.commonName)")
					.font(.title2)
				Text(plant.bibliography)
			}.padding()
		}
		.navigationTitle(plant.commonName)
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PlantDetail(plant: plants[1])
}

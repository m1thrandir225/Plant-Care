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
			AsyncImage(url: URL(string: plant.imageUrl)) { phase in
				
				switch phase {
				case .empty:
					ProgressView()
				case .success(let image):
					image
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(maxHeight: 300)
						.clipped()
				case .failure:
					Image(systemName: "wifi.slash")

				@unknown default:
					EmptyView()
				}
			}
			.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 300)
		
			VStack(alignment: .leading) {
				
				Text (plant.commonName)
					.font(.title)
				
				HStack {
					if let family = plant.family {
						Text("Family: \(family)")
					}
					Spacer()
					if let familyCommonName = plant.familyCommonName {
						Text("Common Name: \(familyCommonName)")
					}
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				
				HStack {
					if let isVegetable = plant.vegetable {
						Text("Is a vegetable: \(isVegetable)")
					}
					Spacer()
					if let isEdible = plant.edible {
						Text("Is edible: \(isEdible)")
					}
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				
				Divider()
				
				Text("About \(plant.commonName)")
					.font(.title2)
				Text(plant.bibliography)
			}.padding()
		}
		.toolbar(.hidden, for: .tabBar)
		.navigationTitle(plant.commonName)
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PlantDetail(plant: plants[1])
}

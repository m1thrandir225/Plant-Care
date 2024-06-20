//
//  PlantRow.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI

struct PlantRow: View {
	var plant: PlantListItem
    var body: some View {
		HStack {
			if let image = plant.defaultImage?.thumbnail {
				AsyncImage(url: URL(string: image), transaction: Transaction(animation: .spring)) { phase in
					switch phase {
					case .empty:
						ProgressView()
					case .success(let image):
						image
							.resizable()
							.aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
							.frame(width: 50, height: 50)
							.clipped()
							.transition(.slide)
					case .failure:
						Image(systemName: "wifi.slash")
					@unknown default:
						EmptyView()
						
					}
				}.frame(width: 50, height: 50)
			} else {
				EmptyView()
			}
			Text(plant.scientificName?[0] ?? plant.commonName ?? "").transition(.scale)
			Spacer()
		}
    }
}

#Preview {
	Group {
		PlantRow(plant: plants[1])
		PlantRow(plant: plants[0])
	}
}

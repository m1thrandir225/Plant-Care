//
//  PlantRow.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI

struct PlantRow: View {
	var plant: Plant
    var body: some View {
		HStack {
			AsyncImage(url: URL(string: plant.imageUrl)) { phase in
				switch phase {
				case .empty:
					ProgressView()
				case .success(let image):
					image
						.resizable()
						.aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
						.frame(width: 50, height: 50)
						.clipped()
				case .failure:
					Image(systemName: "wifi.slash")
				@unknown default:
					EmptyView()
					
				}
			}.frame(width: 50, height: 50)
			
			Text(plant.commonName)
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

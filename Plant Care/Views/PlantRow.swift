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
			AsyncImage(url: URL(string: plant.imageUrl)) { image in
				image.image?.resizable()
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

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
			plant.image
				.resizable()
				.frame(width: 50, height: 50)
			Text(plant.name)
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

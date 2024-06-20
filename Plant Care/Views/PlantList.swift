//
//  PlantList.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI

struct PlantList: View {
	@EnvironmentObject var plantManager: PlantManager;
	
    var body: some View {
		NavigationSplitView {
			List {
				if(plantManager.plants.count == 0) {
					HStack {
						Text("Couldn't fetch data")
					}
				} else {
					ForEach(plantManager.plants) { plant in
						NavigationLink {
							PlantDetail(plantApi: String(plant.id))
						} label: {
							PlantRow(plant: plant).transition(.scale)
						}
					}
				}
			}
			.transition(.scale)
			.navigationTitle("Plants")
		} detail: {
			Text("Select a landmark")
		}

    }
}

#Preview {
    PlantList()
}

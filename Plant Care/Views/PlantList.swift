//
//  PlantList.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI

struct PlantList: View {
    var body: some View {
		NavigationSplitView {
			List (plants) { plant in
				NavigationLink {
					PlantDetail(plant: plant)
				} label: {
					PlantRow(plant: plant)
				}
			}
			.navigationTitle("Plants")
		} detail: {
			Text("Select a landmark")
		}

    }
}

#Preview {
    PlantList()
}

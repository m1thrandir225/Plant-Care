//
//  UserPlantDetail.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 18.6.24.
//

import SwiftUI

extension AnyTransition {
	static var moveAndFade: AnyTransition {
		.asymmetric(
			insertion: .move(edge: .trailing).combined(with: .opacity),
			removal: .scale.combined(with: .opacity)
		)
	}
}

struct UserPlantDetail: View {
	var plant: UserPlant
	
	var body: some View {
		ScrollView {
			Image(uiImage: UIImage(data: plant.image) ?? UIImage())
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(maxWidth: .infinity, maxHeight: 300)
				.clipped()
				.padding(.bottom)
			
			VStack(alignment: .leading, content: {
				Text(plant.name)
					.font(.title)
					.transition(.moveAndFade)
				
				HStack {
					Text("Watering: \(plant.wateringFrequency)")
					Spacer()
					Text("Sunlight: \(plant.sunlightExposure)")
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				Divider()
				
			}).padding()
		}
		.navigationTitle(plant.name)
		.navigationBarTitleDisplayMode(.inline)
		.toolbar(.hidden, for: .tabBar)
	}
}


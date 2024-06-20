//
//  PlantDetail.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI

struct PlantDetail: View {
	var plantApi: String
	
	@ObservedObject private var viewModel: PlantDetailViewModel
	
	init(plantApi: String) {
		self.plantApi = plantApi
		self.viewModel = PlantDetailViewModel(apiLink: plantApi)

	}
	
    var body: some View {

		ScrollView {
			if(viewModel.isLoading) {
				ProgressView()
			} else {
				if let imageUrl = viewModel.plant?.defaultImage.regularUrl {
					AsyncImage(url: URL(string: imageUrl)) { phase in
						
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
				}
			
			
				VStack(alignment: .leading) {
					Text (viewModel.plant?.commonName.capitalized ?? "")
						.font(.title)
					VStack(alignment: .leading) {
						if let watering = viewModel.plant?.watering {
							Text("Watering Frequency: \(watering)")
						}
						if let sunlight = viewModel.plant?.sunlight {
							Text("Sunlight: \(sunlight.joined(separator: ", "))")
						}
						if let family =  viewModel.plant?.family {
							Text("Plant Family: \(family)")
						}
						
						if let isEdible = viewModel.plant?.fruits {
							Text("Is edible: \(isEdible)")
						}
						
						if let isVegetable = viewModel.plant?.edibleLeaf {
							Text("Is vegetable: \(isVegetable)")
						}
						
						if let scientificName = viewModel.plant?.scientificName {
							Text("Scientific name: \(scientificName.joined(separator: ", "))")
						}
						
						if let pestSusceptibility = viewModel.plant?.pestSusceptibility {
							if pestSusceptibility.count > 0 {
								Text("Pest susceptibility: \(pestSusceptibility.joined(separator: ", "))")
							} else {
								Text("Pest susceptibility: none")
								
							}
						}
						
						if let tropical = viewModel.plant?.tropical {
							Text("Is tropical: \(tropical)")
						}
						if let cones = viewModel.plant?.cones {
							Text("Cones: \(cones)")
						}
						
						if let fruits = viewModel.plant?.fruits {
							Text("Has fruits: \(fruits)")
						}
						if let edibleFruits = viewModel.plant?.edibleFruit {
							Text("Edible fruits: \(edibleFruits)")
						}
						if let edibleLeaf = viewModel.plant?.edibleLeaf {
							Text("Edible leaf: \(edibleLeaf)")
						}
					}.font(.subheadline)
					.foregroundColor(.secondary)
					.transition(.scale)
					
					Divider()
					
					Text("About \(viewModel.plant?.commonName ?? "")")
						.font(.title2)
						.padding(.bottom)
					
					Text(viewModel.plant?.description  ?? "").transition(.opacity)
					
					Group {
						Text("Plant Locations:").font(.title2)
						if let locations = viewModel.plant?.origin {
							ForEach(locations, id: \.self) { location in
								NavigationLink {
									MapView(locationName: location)
									
								} label: {
									Text(location)
								}
							}
							
						} else {
							Text ("No origin locations.")
						}
					}.padding()
						.transition(.slide)

				}.padding()
			}
		
		}
		.toolbar(.hidden, for: .tabBar)
		.navigationTitle(viewModel.plant?.commonName ?? "")
		.navigationBarTitleDisplayMode(.inline)
		.onAppear {
			viewModel.getPlant()
		}
    }
}

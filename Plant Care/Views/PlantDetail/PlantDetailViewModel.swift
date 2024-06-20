//
//  PlantDetailViewModel.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 18.6.24.
//

import Foundation
import Alamofire

final class PlantDetailViewModel: ObservableObject {

	@Published var isLoading = false
	
	@Published var plant: DetailedPlant? = nil
	
	private var plantId: String
	
	init(apiLink: String) {
		self.plantId = apiLink
	}
	
	func getPlant() {
		isLoading = true
		let  url = "https://perenual.com/api/species/details/\(plantId)?key=sk-kaor66745f9933b215998"
		AF.request(url)
			.responseDecodable(of: DetailedPlant.self) { response in
				self.isLoading = false
					debugPrint(response)
				if let plantFromNetwork = response.value {
					self.plant = plantFromNetwork
				}
			}
		
	}
}

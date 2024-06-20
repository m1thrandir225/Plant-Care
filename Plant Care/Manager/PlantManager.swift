//
//  PlantManager.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 15.6.24.
//

import Foundation
import Alamofire

class PlantManager: ObservableObject {
	@Published var plants: [PlantListItem] = [];
	init () {
		refreshPlants()
	}

	func refreshPlants() {
		AF.request("https://perenual.com/api/species-list?key=sk-zkpH6672b92769e355912&indoor=1")
			.responseDecodable(of: MultiplePlantResponse.self) { response in
				debugPrint(response)
				if let plantsFromNetwork = response.value {
					self.plants = plantsFromNetwork.data
				}
			}
	}
}

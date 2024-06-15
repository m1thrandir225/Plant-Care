//
//  PlantManager.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 15.6.24.
//

import Foundation
import Alamofire

class PlantManager: ObservableObject {
	@Published var plants: [Plant] = [];
	
	
	init () {
		refreshPlants()
	}
	
	
	func refreshPlants() {
		AF.request("http://trefle.io/api/v1/plants?token=AWONc6J5m6MjeMxsLhd19r8ympx7jJBi3t80sT7Cm3Q")
			.responseDecodable(of: PlantResponse.self) { response in
				debugPrint(response)
				if let plantsFromNetwork = response.value {
					self.plants = plantsFromNetwork.data
				}
			}
	}
}

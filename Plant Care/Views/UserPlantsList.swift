//
//  UserPlantsList.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 16.6.24.
//

import SwiftUI
import SwiftData

struct UserPlantsList: View {
	@Environment(\.modelContext) private var modelContext
	@Query var plants: [UserPlant]
	
	@State private var showingAddPlantSheet = false
	
	var body: some View {
		NavigationStack{
			   List {
				   ForEach(plants, id: \.self) { plant in
					   NavigationLink(destination: UserPlantDetail(plant: plant)) {
						   UserPlantRow(plant: plant)
					   }
				   }
			   }

			   .navigationTitle("Your Plants")
			   .toolbar {
				   NavigationLink(destination: AddPlant()) {
						   Image(systemName: "plus.app")
				   }
				  
			   }
		}
	}
}

#Preview {
    UserPlantsList()
}

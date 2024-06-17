//
//  Plant_CareApp.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 12.6.24.
//

import SwiftUI
import SwiftData

@main
struct Plant_CareApp: App {
	var plantManager = PlantManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
				.modelContainer(for: [
					UserPlant.self
				])
				.environmentObject(plantManager)
        }
    }
}

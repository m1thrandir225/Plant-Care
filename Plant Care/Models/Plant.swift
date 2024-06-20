//
//  Plant.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import Foundation
import SwiftUI
import CoreLocation


struct PlantListItem: Identifiable, Hashable, Codable {
	var id: Int
	var commonName: String?
	var scientificName: [String]?
	var otherName: [String]?
	var cycle: String?
	var watering: String?
	var sunlight: [String]?
	var defaultImage: PlantImage?
	
	
	enum CodingKeys: String, CodingKey {
		case id
		case commonName = "common_name"
		case scientificName = "scientific_name"
		case otherName = "other_name"
		case cycle
		case watering
		case sunlight
		case defaultImage = "default_image"
	}
}


struct PlantImage: Codable, Hashable {
	var license: Int?
	var licenseName: String?
	var licenseUrl: String?
	var originalUrl: String?
	var regularUrl: String?
	var mediumUrl: String?
	var smallUrl: String?
	var thumbnail: String?
	
	enum CodingKeys: String, CodingKey {
		case license
		
		case licenseName = "license_name"
		
		case licenseUrl = "license_url"
		
		case originalUrl = "original_url"
		
		case regularUrl = "regular_url"
		
		case mediumUrl = "medium_url"
		
		case smallUrl = "small_url"
		
		case thumbnail
	}
}


struct DetailedPlant: Codable, Hashable, Identifiable {
	var id: Int
	var commonName: String
	var scientificName: [String] = []
	var otherName: [String] = []
	var cycle: String
	var watering: String
var sunlight: [String] = []
	var defaultImage: PlantImage
	var family: String?
	var origin: [String]
	var type: String
	var dimension: String
	var attracts: [String]? = []
	var propagation: [String] = []
	

	var wateringPeriod: String?
	var plantAnatomy: [PlantAnatomy]
	var pruningMonth: [String]
	var seeds: Int
	var maintenance: String
	var careGuides: String
	var soil: [String]
	var growthRate: String
	var droughtTolerant: Bool
	var saltTolerant: Bool
	var thorny: Bool
	var tropical: Bool
	var indoor: Bool
	var careLevel: String?
	var pestSusceptibility: [String] = []
	var flowers: Bool
	var floweringSeason: String? = nil
	var flowerColor: String?
	var cones: Bool
	var fruits: Bool
	var edibleFruit: Bool
	var edible_fruit_taste_profile: String? = nil
	var fruit_nutritional_value: String? = nil
	var fruitColor: [String] = []
	var harvestSeason: String? = nil
	var leaf: Bool
	var leafColor: [String] = []
	var edibleLeaf: Bool
	var cuisine: Bool
	var medicinal: Bool
	var poisonousToHumans: Int
	var poisonousToPets: Int
	var description: String
	var hardiness: Hardiness
	var hardinessLocation: HardinessLocation
	
	enum CodingKeys: String, CodingKey {
		case id
		case commonName = "common_name"
		case scientificName = "scientific_name"
		case otherName = "other_name"
		case cycle
		case watering
		case sunlight
		case defaultImage = "default_image"
		case hardinessLocation = "hardiness_location"
		case wateringPeriod = "watering_period"
		case plantAnatomy = "plant_anatomy"
		case pruningMonth = "pruning_month"
		case seeds
		case maintenance
		case careGuides = "care-guides"
		case soil
		case growthRate = "growth_rate"
		case droughtTolerant = "drought_tolerant"
		case saltTolerant = "salt_tolerant"
		case thorny
		case tropical
		case indoor
		case careLevel = "care_level"
		case pestSusceptibility = "pest_susceptibility"
		case flowers
		case floweringSeason = "flowering_season"
		case flowerColor = "flower_color"
		case cones
		case fruits
		case edibleFruit = "edible_fruit"
		case fruitColor = "fruit_color"
		case harvestSeason = "harvest_season"
		case leaf
		case leafColor = "leaf_color"
		case edibleLeaf = "edible_leaf"
		case cuisine
		case poisonousToHumans = "poisonous_to_humans"
		case poisonousToPets = "poisonous_to_pets"
		case description
		case origin
		case type
		case hardiness
		case medicinal
		case dimension
	}
	
}


struct PlantAnatomy: Codable, Hashable {
	var part: String
	var color: [String]
}

struct WateringRequirement: Codable, Hashable {
	var unit: String
	var value: String
}


struct Hardiness: Codable, Hashable {
	var min: String
	var max: String
}

struct HardinessLocation: Codable, Hashable {
	var fullUrl: String
	var fullIframe: String
	
	enum CodingKeys: String, CodingKey {
		case fullUrl = "full_url"
		case fullIframe = "full_iframe"
	}
}


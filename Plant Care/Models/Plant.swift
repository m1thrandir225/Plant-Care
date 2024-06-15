//
//  Plant.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import Foundation
import SwiftUI
import CoreLocation


struct Plant: Hashable, Codable, Identifiable {
	var id: Int
	var commonName: String
	var slug: String
	var scientificName: String
	var year: Int
	var bibliography: String
	var author: String?
	var status: String?
	var rank: String?
	var familyCommonName: String?
	var family: String?
	var genusId: Int?
	var genus: String?
	var imageUrl: String
	var duration: [String]?
	var ediblePart: [String]?
	var edible: Bool?
	var vegetable: Bool?
	var observations: String?
	var links: PlantLinks
	
	enum CodingKeys: String, CodingKey {
		case commonName = "common_name"
		case scientificName = "scientific_name"
		case familyCommonName = "family_common_name"
		case ediblePart = "edible_part"
		case imageUrl = "image_url"
		case genusId = "genus_id"
		
		case links
		case edible
		case vegetable
		case observations
		case family
		case genus
		case duration
		case author
		case status
		case rank
		case year
		case bibliography
		case id
		case slug
	}
}


struct PlantLinks: Codable, Hashable {
	var selfId: String
	var genus: String
	var plant: String
	
	enum CodingKeys: String, CodingKey {
		case selfId = "self"
		case genus
		case plant
	}
}


struct PlantResponse: Codable {
	var data: [Plant]
}

//
//  UserPlantRow.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 17.6.24.
//

import SwiftUI
import UIKit

struct UserPlantRow: View {
	var plant: UserPlant
	
    var body: some View {
		HStack {
			Image(uiImage: UIImage(data: plant.image) ?? UIImage())
				.resizable()
				.aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
				.frame(width: 50, height: 50)
				.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
				.clipped()
			Text(plant.name)
			Spacer()
		}
    }
}

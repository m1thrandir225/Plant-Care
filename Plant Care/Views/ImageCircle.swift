//
//  ImageCircle.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI

struct ImageCircle: View {
	var imageUrl: String
    var body: some View {
		AsyncImage(url: URL(string: imageUrl)) { image in
			image.image?.resizable()
				.scaledToFill()
				.frame(height: 200)
				.clipShape(Circle())
				.overlay {
					Circle().stroke(.white, lineWidth: 4)
				}
				.shadow(radius: 7)
		}
			
    }
}

#Preview {
    ImageCircle(imageUrl: "aloe_vera")
}

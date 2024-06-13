//
//  ImageCircle.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 13.6.24.
//

import SwiftUI

struct ImageCircle: View {
	var image: Image
    var body: some View {
		image
			.resizable()
			.scaledToFill()
			.frame(height: 200)
			.clipShape(Circle())
			.overlay {
				Circle().stroke(.white, lineWidth: 4)
			}
			.shadow(radius: 7)
    }
}

#Preview {
    ImageCircle(image: Image("aloe_vera"))
}

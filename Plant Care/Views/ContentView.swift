//
//  ContentView.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 12.6.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			PlantList()
				.tabItem {
					Image(systemName: "tree")
					Text("Plants")
				}
		}
    }
}

#Preview {
    ContentView()
}

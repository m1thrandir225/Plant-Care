//
//  AudioRecording.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 24.7.24.
//

import Foundation


struct AudioRecording : Identifiable, Hashable, Codable {
	var id = UUID()
	let date: Date
	let url: URL
}

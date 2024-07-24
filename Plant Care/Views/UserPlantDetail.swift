//
//  UserPlantDetail.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 18.6.24.
//

import SwiftUI
import AVFoundation

extension AnyTransition {
	static var moveAndFade: AnyTransition {
		.asymmetric(
			insertion: .move(edge: .trailing).combined(with: .opacity),
			removal: .move(edge: .leading).combined(with: .opacity)
		)
	}
}

struct UserPlantDetail: View {
	var plant: UserPlant
	
	@State private var isRecording: Bool = false
	@State private var audioRecorder: AVAudioRecorder?
	@State private var audioPlayer: AVAudioPlayer?
	
	private func startRecording() {
		let filename = getDocumentsDirectory().appendingPathComponent("\(UUID().uuidString).m4a")
		
		let recordingSettings = [
			AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
			AVSampleRateKey: 12000,
			AVNumberOfChannelsKey: 1,
			AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
		]
		
		do {
			let session = AVAudioSession.sharedInstance()
			try session.setCategory(.playAndRecord, mode: .default)
			try session.setActive(true)
			
			audioRecorder = try AVAudioRecorder(url: filename, settings: recordingSettings)
			audioRecorder?.record()
			isRecording = true
			print("Started recording at \(filename)")
		} catch {
			print("Failed to start recording: \(error.localizedDescription)")
		}
	}
	
	private func stopRecording() {
		audioRecorder?.stop()
		
		if let url = audioRecorder?.url {
			let newRecording = AudioRecording(date: Date(), url: url)
			plant.audioRecordings.append(newRecording)
		}
		isRecording = false
	}
	
	private func playRecording(url: URL) {
		do {
			let session = AVAudioSession.sharedInstance()
			try session.setCategory(.playback, mode: .default)
			try session.setActive(true)
			
			audioPlayer = try AVAudioPlayer(contentsOf: url)
			audioPlayer?.prepareToPlay()
			audioPlayer?.volume = 1.0
			audioPlayer?.play()
			print("Playing recording from \(url)")
		} catch {
			print("Failed to play recording: \(error.localizedDescription)")
		}
	}
	private func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
	
	private func requestMicrophonePermission() {
		AVAudioSession.sharedInstance().requestRecordPermission { granted in
			DispatchQueue.main.async {
				if granted {
					startRecording()
				} else {
					print("Microphone permission denied")
				}
			}
		}
	}
	
	private func deleteRecording(_ recording: AudioRecording) {
		withAnimation {
			plant.removeRecording(recording)
		}
		do {
			try FileManager.default.removeItem(at: recording.url)
			print("Deleted recording at: \(recording.url)")
		} catch {
			print("Failed to delete recording: \(error.localizedDescription)")
		}
	}
	
	private var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateStyle = .short
		formatter.timeStyle = .short
		return formatter
	}
	var body: some View {
		ScrollView {
			Image(uiImage: UIImage(data: plant.image) ?? UIImage())
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(maxWidth: .infinity, maxHeight: 300)
				.clipped()
				.padding(.bottom)
			
			VStack(alignment: .leading,
				   content: {
				Text(plant.name)
					.font(.title)
					.transition(.moveAndFade)
				
				HStack {
					Text("Watering: \(plant.wateringFrequency)")
					Spacer()
					Text("Sunlight: \(plant.sunlightExposure)")
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				Divider()
				
				VStack(alignment: .leading) {
					Text("Audio Notes")
						.font(.headline)
					ForEach(plant.audioRecordings) { recording in
						HStack {
							Text(dateFormatter.string(from: recording.date))
							Spacer()
							Button(action: {
								playRecording(url: recording.url)
							}) {
								Image(systemName: "play.circle")
							}
							Button(action: {
								deleteRecording(recording)
							}) {
								Image(systemName: "trash")
									.foregroundColor(.red)
							}
						}
					}.transition(.moveAndFade)
					Button(action: {
						if isRecording {
							stopRecording()
						} else {
							requestMicrophonePermission()
						}
					}) {
						HStack {
							Image(systemName: isRecording ? "stop.circle" : "mic.circle")
							Text(isRecording ? "Stop Recording" : "Start Recording")
						}
					}
					
				}
				
			}).padding()
		}
		.navigationTitle(plant.name)
		.navigationBarTitleDisplayMode(.inline)
		.toolbar(.hidden, for: .tabBar)
	}
}

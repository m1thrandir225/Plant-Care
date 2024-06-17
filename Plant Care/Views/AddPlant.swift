//
//  AddPlant.swift
//  Plant Care
//
//  Created by Sebastijan Zindl on 16.6.24.
//

import SwiftUI
import UserNotifications


struct AddPlant: View {
	@Environment (\.modelContext) private var modelContext
	@Environment (\.presentationMode) var presentationMode
	
	@State private var plantName = ""
	@State private var selectedWateringOption: WateringFrequency = .Daily
	@State private var selectedSunlightOption: SunlightExposure = .PartShade
	
	@State private var showImagePicker = false
	@State private var image: UIImage?
	
	func createPlant() -> UserPlant {
		return UserPlant(
			name: plantName,
			image: image!.pngData()!,
			wateringFrequency: selectedWateringOption,
			sunlightExposure: selectedSunlightOption
		)
	}
	
	func scheduleNotification(name: String, wateringFrequency: WateringFrequency) async {
		let content = UNMutableNotificationContent()
		content.title = "Watering Notification for plant: \(name)"
		content.body = "Hey, quick reminder, water your plant!"
		
		var dateComponents = DateComponents()
		dateComponents.calendar = Calendar.current
//		switch(wateringFrequency) {
//		case .Daily:
//			//Schedule every morning at 8:30
//			dateComponents.hour = 8
//			dateComponents.minute = 30
//
//		case .Weekly:
//			//Schedule every monday at 8:30
//			dateComponents.weekday = 1
//			dateComponents.hour = 8
//			dateComponents.minute = 30
//
//		case.Monthly:
//			//Schedule every 1st of month at 8:30
//			dateComponents.day = 1
//			dateComponents.hour = 8
//			dateComponents.minute = 30
//		}
		
//		let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
		
		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
		
		let uuidString = UUID().uuidString
		
		let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
		
		let notificationCenter = UNUserNotificationCenter.current()
		
		do {
			try await notificationCenter.add(request)
			print("Sucessfully registered request")
		} catch {
			print("Error registering notification Request")
		}
	}
	
    var body: some View {
		Form {
			TextField("Plant name", text: $plantName)
			
			Picker("Watering Frequency", selection: $selectedWateringOption) {
				ForEach(WateringFrequency.allCases, id: \.self) { option in
					Text(String(describing: option))
				}
			}
			
			Picker("Sunlight Exposure", selection: $selectedSunlightOption) {
				ForEach(SunlightExposure.allCases, id: \.self) { option in
					Text(String(String(describing: option)))
				}
			}
			if let selectedImage = image {
				Image(uiImage: selectedImage)
					.resizable()
					.scaledToFill()
					.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 200).frame(height: 200)
				
			} else {
				Button(action: { showImagePicker = true}, label: {
					VStack {
						Image(systemName: "photo")
						Text("Select an image")
					}
				}).frame(maxWidth: .infinity, maxHeight: 200).frame(height: 200)
			}
			
			Button("Add Plant") {
				UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
					if success {
						print("All set!")
						Task {
							let plant = createPlant()
							modelContext.insert(plant)
							await scheduleNotification(name: plantName, wateringFrequency: selectedWateringOption)
							presentationMode.wrappedValue.dismiss()
						}
					} else if let error {
						print(error.localizedDescription)
					}
				}
				
				
			}.disabled(plantName.isEmpty || image == nil)
			
		}.sheet(isPresented: $showImagePicker, content: {
			ImagePickerView(selectedImage: $image)
		})
		.toolbar(.hidden, for: .tabBar)
		.navigationTitle("Add a new plant")
		.navigationBarTitleDisplayMode(.inline)
		
    }
}

#Preview {
    AddPlant()
}

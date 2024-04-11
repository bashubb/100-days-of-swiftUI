//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by HubertMac on 10/04/2024.
//

import CoreLocation
import Foundation
import LocalAuthentication
import MapKit
import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var locations: [Location]
        var selectedPlace: Location?
        var isUnlocked = false
        
        // challenge 2
        var isShowingAuthenticationError = false
        var errorTitle = "Something went wrong"
        var errorMessage = "Authentication Error"
        
        
        let savePath = FileManager().getDocumentsDirectory().appending(path: "SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(
                id: UUID(),
                name: "New location",
                description: "",
                latitude: point.latitude,
                longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        
        func deleteLocation(_ locationToRemove: Location) {
            guard let index = locations.firstIndex(of: locationToRemove) else { return }
            locations.remove(at: index)
        }
        
        func updateLocation(location: Location) {
            guard let selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
            
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error with authenticate
                        // challenge 2
                        self.errorMessage = "There was a problem authenticating You, try again"
                        self.isShowingAuthenticationError = true
                        
                    }
                    
                }
            } else {
                // no biometrics
                // challenge 2
                errorMessage = "Sorry ,your device does not support biometric authentication"
                isShowingAuthenticationError = true
            }
        }
    }
}

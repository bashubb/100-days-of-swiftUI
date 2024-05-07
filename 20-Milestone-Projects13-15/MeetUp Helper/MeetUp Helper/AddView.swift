//
//  AddView.swift
//  MeetUp Helper
//
//  Created by HubertMac on 07/05/2024.
//

import PhotosUI
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var newName = ""
    @State var image: Image?
    var selectedImage: Data
    var onSave: (Friend) -> Void
    
    var body: some View {
        Form {
            Text("Save new friend")
                .font(.title)
                .fontWeight(.bold)
                .listRowBackground(Color.clear)
            
            Section("photo") {
                image?
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()
            }
            Section("name") {
                TextField("Name", text: $newName)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Button("Save") {
                let newFriend = Friend(name: newName, photo: selectedImage)
                   onSave(newFriend)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .disabled(newName.isEmpty)
                
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
            .listRowBackground(Color.clear)
            .containerRelativeFrame(.horizontal)
            
        }
        .onAppear{
            if let selectedImage = UIImage(data: selectedImage) {
                image = Image(uiImage: selectedImage)
            }
        }
        
    }
}



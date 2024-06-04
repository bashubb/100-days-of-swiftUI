//
//  AddView.swift
//  MeetUp Helper
//
//  Created by HubertMac on 07/05/2024.
//

import PhotosUI
import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var photosItem: PhotosPickerItem?
    @State private var selectedImage: Data?
    
    @State private var image: Image?
    
    @State var newName = ""
    
    var body: some View {
        Form {
            
            Section("photo") {
                image?
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()
                HStack {
                   PhotosPicker(
                       selection: $photosItem,
                       matching: .images) {
                               Text("Select existing...")
                       }
                }
            }
            
            Section("name") {
                TextField("Name", text: $newName)
                    .textFieldStyle(.roundedBorder)
            }
        }
        .navigationTitle("Add Contact")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    guard let selectedImage else { return }
                    let newFriend = Friend(name: newName, photo: selectedImage)
                    modelContext.insert(newFriend)
                    dismiss()
                }
                .disabled(newName.isEmpty)
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }
        }
        .onAppear{
            if let selectedImage = UIImage(data: selectedImage ?? <#default value#>) {
                image = Image(uiImage: selectedImage)
            }
        }
    }
}


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Friend.self, configurations: config)
        return AddView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
    
}

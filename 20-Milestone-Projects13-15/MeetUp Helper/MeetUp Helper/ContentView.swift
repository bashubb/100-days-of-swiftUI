//
//  ContentView.swift
//  MeetUp Helper
//
//  Created by HubertMac on 07/05/2024.
//
import PhotosUI
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Friend.name)]) var friends: [Friend]
    
    @State private var newName = ""
    @State private var photosItem: PhotosPickerItem?
    @State private var selectedImage: Data?
    @State private var showNameEditAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                if friends.isEmpty {
                    ContentUnavailableView("You have no friends, add some", systemImage: "plus")
                        .foregroundStyle(.gray)
                } else {
                    ForEach(friends) {friend in
                        NavigationLink(value: friend) {
                            ListFriendView(friend: friend)
                        }
                    }
                    .onDelete(perform: removeFriend)
                }
            }
            .listStyle(.plain)
            .navigationDestination(for: Friend.self) { friend in
                DetailFriendView(friend: friend)
            }
            .navigationTitle("Contacts List")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    PhotosPicker(
                        selection: $photosItem,
                        matching: .images) {
                            HStack {
                                Text("Add Friend")
                                Image(systemName: "plus")
                            }
                        }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
            }
            .onChange(of: photosItem) { oldValue, newValue in
                if let photo  = newValue {
                    Task {
                        selectedImage = try? await photo.loadTransferable(type: Data.self)
                    }
                    showNameEditAlert = true
                }
            }
            .alert("Add Name", isPresented: $showNameEditAlert) {
                TextField("Name", text: $newName)
                HStack {
                    Button("Save") {
                        withAnimation { saveFriend() }
                    }
                    Button("Cancel", role: .cancel, action: {})
                }
            }
        }
    }
    
    func saveFriend() {
        guard let selectedImage else { return }
        let newFriend = Friend(name: newName, photo: selectedImage)
        modelContext.insert(newFriend)
        newName = ""
        photosItem = nil
    }
    
    func removeFriend(_ indexSet: IndexSet) {
        for index in indexSet {
            let friendToRemove = friends[index]
            modelContext.delete(friendToRemove)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Friend.self, configurations: config)
        return ContentView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
    
}


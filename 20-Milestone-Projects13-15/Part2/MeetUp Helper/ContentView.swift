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
    
    @State private var showAddView = false
    
    var body: some View {
        NavigationStack {
            List {
                if friends.isEmpty {
                    ContentUnavailableView("Your list is empty", systemImage: "plus")
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
            .navigationTitle("Event Contacts")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                if friends.isEmpty == false {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
                
            }
            .sheet(isPresented: $showAddView){
                AddView()
            }
//            .onChange(of: photosItem) { oldValue, newValue in
//                if let photo  = newValue {
//                    Task {
//                        selectedImage = try? await photo.loadTransferable(type: Data.self)
//                    }
//                    showNameEditAlert = true
//                }
//            }
//            .sheet(isPresented: $showNameEditAlert) {
//                if let selectedImage = selectedImage {
//                    AddView(selectedImage: selectedImage) { friend in
//                        modelContext.insert(friend)
//                        photosItem = nil
//                    }
//                }
//            }
            
        }
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


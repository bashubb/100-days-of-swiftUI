//
//  DetailFriendView.swift
//  MeetUp Helper
//
//  Created by HubertMac on 07/05/2024.
//

import SwiftUI
import SwiftData

struct DetailFriendView: View {
    var friend: Friend
    
    @State private var photo: Image?
    
    var body: some View {
        VStack {
            photo?
                .resizable()
                .scaledToFill()
                
            
        }
        .onAppear{
            if let uiImage = UIImage(data: friend.photo) {
                photo =  Image(uiImage: uiImage)
            }
        }
        .navigationTitle(friend.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Friend.self, configurations: config)
        let example = Friend(name: "John Smith", photo: Data())
        return NavigationStack {
            DetailFriendView(friend: example)
                .modelContainer(container)
        }
    } catch {
        fatalError("Failed to create model container.")
    }
}

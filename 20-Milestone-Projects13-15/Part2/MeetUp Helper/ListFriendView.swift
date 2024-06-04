//
//  ListFriendView.swift
//  MeetUp Helper
//
//  Created by HubertMac on 07/05/2024.
//

import SwiftUI
import SwiftData

struct ListFriendView: View {
    var friend: Friend
    @State private var photo: Image?
    
    var body: some View {
        HStack{
            photo?
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Text(friend.name)
                .font(.headline)
                .padding()
        }
        .onAppear{
            if let uiImage = UIImage(data: friend.photo) {
                photo =  Image(uiImage: uiImage)
            }
        }
    }

}

#Preview {
    do {
           let config = ModelConfiguration(isStoredInMemoryOnly: true)
           let container = try ModelContainer(for: Friend.self, configurations: config)
           let example = Friend(name: "John Smith", photo: Data())
           return ListFriendView(friend: example)
               .modelContainer(container)
       } catch {
           fatalError("Failed to create model container.")
       }
}

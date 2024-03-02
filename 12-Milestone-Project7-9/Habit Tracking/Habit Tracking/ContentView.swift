//
//  ContentView.swift
//  Habit Tracking
//
//  Created by HubertMac on 01/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationStack {
            List(data.activities) { activity in
                NavigationLink {
                    Text("Detail View")
                } label: {
                    HStack{
                        Text(activity.title)
                        Spacer()
                        Text(String(activity.completionCount))
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add new activity", systemImage: "plus") {
                    addingNewActivity.toggle()
                }
            }
            .sheet(isPresented: $addingNewActivity) {
               AddActivity(data: data)
            }
        }
    }
    
}

#Preview {
    ContentView()
}

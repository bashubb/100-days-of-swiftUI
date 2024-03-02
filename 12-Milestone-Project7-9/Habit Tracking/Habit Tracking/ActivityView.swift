//
//  ActivityView.swift
//  Habit Tracking
//
//  Created by HubertMac on 02/03/2024.
//

import SwiftUI

struct ActivityView: View {
    var data: Activities
    var activity: Activity
    
    var body: some View {
        List{
            if activity.description.isEmpty == false {
                Section {
                    Text(activity.description)
                }
            }
            
            Section {
                Text("Completion count: \(activity.completionCount)")
                
                Button("Mark Comleted") {
                    var newActivity = activity
                    newActivity.completionCount += 1
                    
                    if let index = data.activities.firstIndex(of: activity) {
                        data.activities[index] = newActivity
                    }
                }
            }
        }
        .navigationTitle(activity.title)
    }
}

#Preview {
    ActivityView(data: Activities(), activity: .example)
}

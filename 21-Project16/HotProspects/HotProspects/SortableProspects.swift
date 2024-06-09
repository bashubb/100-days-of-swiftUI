//
//  SortableProspects.swift
//  HotProspects
//
//  Created by HubertMac on 09/06/2024.
//

import SwiftUI

struct SortableProspects: View {
    let filter: Prospects.FilterType
    @State private var sortOrder = SortDescriptor(\Prospect.name)
    
    var body: some View {
        NavigationStack {
            Prospects(filter: filter, sort: sortOrder)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu("Sort") {
                            Picker("Sort Order", selection: $sortOrder) {
                                Text("Date Added")
                                    .tag(SortDescriptor(\Prospect.dateAdded))
                                
                                Text("Name")
                                    .tag(SortDescriptor(\Prospect.name))
                            }
                        }
                    }
                }
        }
    }
}

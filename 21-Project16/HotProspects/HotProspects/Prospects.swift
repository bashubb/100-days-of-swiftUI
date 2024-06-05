//
//  Prospects.swift
//  HotProspects
//
//  Created by HubertMac on 05/06/2024.
//

import SwiftData
import SwiftUI

struct Prospects: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    var body: some View {
        NavigationStack {
            Text("People: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "Hubert", emailAddress: "hubert@gmail.com", isContacted: false)
                        modelContext.insert(prospect)
                    }
                }
        }
        
    }
}

#Preview {
    Prospects(filter: .none)
        .modelContainer(for: Prospect.self)
}

//
//  Prospects.swift
//  HotProspects
//
//  Created by HubertMac on 05/06/2024.
//

import SwiftUI

struct Prospects: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
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
            Text("Hello World")
                .navigationTitle(title)
        }
        
    }
}

#Preview {
    Prospects(filter: .none)
}

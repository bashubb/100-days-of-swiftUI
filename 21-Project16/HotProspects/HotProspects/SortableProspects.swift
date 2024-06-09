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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SortableProspects()
}

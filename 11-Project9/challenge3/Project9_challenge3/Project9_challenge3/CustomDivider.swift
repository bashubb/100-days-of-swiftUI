//
//  CustomDivider.swift
//  MoonShot
//
//  Created by HubertMac on 28/02/2024.
//

import SwiftUI

//challenge2
struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}

//
//  FriendModel.swift
//  MeetUp Helper
//
//  Created by HubertMac on 07/05/2024.
//

import Foundation
import SwiftData

@Model
class FriendModel {
    var name: String
    @Attribute(.externalStorage) var photo: Data
    
    init(name: String, photo: Data) {
        self.name = name
        self.photo = photo
    }
}

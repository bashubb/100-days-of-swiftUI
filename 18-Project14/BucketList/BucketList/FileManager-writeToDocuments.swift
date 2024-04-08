//
//  FileManager-writeToFiles.swift
//  BucketList
//
//  Created by HubertMac on 08/04/2024.
//

import Foundation


extension FileManager {
    
    func getDocumentsDirectory() -> URL {
        URL.documentsDirectory
    }

    func write<T:Encodable>(pathName: String, content: T) {
        let directory = getDocumentsDirectory()
        let url = directory.appending(path: pathName)
        
        do {
            let encoder = JSONEncoder()
            let encoded =  try encoder.encode(content)
            try encoded.write(to: url, options: [.atomic , .completeFileProtection])
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func read<T:Decodable>(type: T.Type ,pathName: String) -> T {
        let directory = getDocumentsDirectory()
        let url = directory.appending(path: pathName)
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data")
        }
        
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed decode data")
        }
        
        return decoded
    }
}



//
//  FirstExampleView.swift
//  Navigation
//
//  Created by HubertMac on 29/02/2024.
//


// Handling navigation the smart way with navigationDestination()

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

import SwiftUI

struct FirstExampleView: View {
    let exampleStudent = Student(name: "Joe", age: 26)
    var body: some View {
        NavigationStack {
            List{
                ForEach(0..<10){ i in
                    NavigationLink("Select \(i)", value: i)
                }
                NavigationLink("Select student", value: exampleStudent)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
    }
}

#Preview {
    FirstExampleView()
}

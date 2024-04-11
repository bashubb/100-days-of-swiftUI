//
//  ContentView.swift
//  BucketList
//
//  Created by HubertMac on 08/04/2024.
//
import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region (
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    )
    
    @State private var viewModel = ViewModel()
    @AppStorage("mapStyle") private var mapStyle = "standard"
    
    var body: some View {
        if viewModel.isUnlocked {
            ZStack(alignment: .topTrailing) {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .contextMenu {
                                        Button {
                                            viewModel.selectedPlace = location
                                        } label: {
                                            Text("Edit")
                                            Image(systemName: "pencil")
                                        }
                                        Button {
                                            viewModel.deleteLocation(location)
                                        } label: {
                                            Text("Delete")
                                            Image(systemName: "trash")
                                        }
                                    }
                                    .buttonStyle(.plain)
                            }
                        }
                    }
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item:$viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            viewModel.updateLocation(location: $0)
                        }
                    }
                    //challenge 1
                    .mapStyle(mapStyle == "standard" ? .standard : .hybrid)
                    
                }
                // challenge 1
                Menu {
                    Button("Standard") { mapStyle = "standard"}
                    Button("Hybrid") { mapStyle = "hybrid"}
                } label: {
                    Image(systemName: "map")
                        .foregroundStyle(.black)
                        .padding()
                        .background(.bar)
                        .clipShape(.capsule)
                        .shadow(radius: 3)
                        .padding()
                }
                .buttonStyle(.plain)
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)
            // challenge 2
                .alert(viewModel.errorTitle, isPresented: $viewModel.isShowingAuthenticationError) {
                } message: {
                    Text(viewModel.errorMessage)
                }
        }
    }
}

#Preview {
    ContentView()
}

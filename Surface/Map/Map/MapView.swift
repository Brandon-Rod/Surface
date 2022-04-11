//
//  ContentView.swift
//  Surface
//
//  Created by Brandon Rodriguez on 12/18/21.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
        
    @State private var locations = [Location]()
    @State private var selectedLocation: Location?
    
    var body: some View {
        
        ZStack {

            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: locations) { location in

                MapAnnotation(coordinate: location.coordinate) {

                    LocationView(location: location)
                        .onTapGesture { selectedLocation = location }

                }

            }
            .ignoresSafeArea()

            Reticle()

        }
    
        .onAppear { viewModel.checkIfLocationServicesAreEnabled() }
        .overlay(
            
            Button {
            
                withAnimation {
                    
                    let newLocation = Location(id: UUID(), title: Strings.name, icon: SFSymbols.list, color: Strings.cyan, latitude: viewModel.region.center.latitude, longitude: viewModel.region.center.longitude, items: [])
                    locations.append(newLocation)
                    
                }
                
            } label: { AddNewLocationView() }, alignment: .bottomTrailing)
        .alert(item: $viewModel.alertItem) { alertItem in
            
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            
        }
        .sheet(item: $selectedLocation) { location in
            
            EditLocationView(location: location) { newLocation in
                
                if let index = locations.firstIndex(of: location) {
                    
                    locations[index] = newLocation
                    
                }
                
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


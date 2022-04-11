//
//  MapViewModel.swift
//  Surface
//
//  Created by Brandon Rodriguez on 12/18/21.
//

import MapKit

enum MapDetails {
    
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
}

/// This class is responsible for managing location services, handling errors, and setting default coordinates
final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    @Published var alertItem: AlertItem?
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesAreEnabled() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            
        } else { retrieveSurfaceError(error: SurfaceErrors.unknownDefault) }
        
    }
    
    private func checkLocationAuthorization() {
        
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            retrieveSurfaceError(error: SurfaceErrors.restricted)
            
        case .denied:
            retrieveSurfaceError(error: SurfaceErrors.denied)
            
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
            
        @unknown default:
            retrieveSurfaceError(error: SurfaceErrors.unknownDefault)
            
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        checkLocationAuthorization()
        
    }
    
    /// Returns error that'll be displayed
    /// - Parameter error: The type of error being returned
    func retrieveSurfaceError(error: SurfaceErrors) {
        
        switch error {
        case .restricted:
            self.alertItem = AlertContext.restricted
            
        case .denied:
            self.alertItem = AlertContext.denied
            
        case .unknownDefault:
            self.alertItem = AlertContext.unknownDefault
            
        }
        
    }
    
}

//
//  ContentView.swift
//  Project14-BucketList
//
//  Created by macmini on 3/23/25.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    let locations = [
        Location(name: "buckingam palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "london tower", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion (
            center: CLLocationCoordinate2D(latitude: 100, longitude: 100),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
        
    var body: some View {
        VStack {
            VStack {
                MapReader { proxy in
                    Map()
                        .onTapGesture {
                            position in
                            
                            if let coordinate = proxy.convert(position, from: .local) {
                                print(coordinate)
                            }
                        }
                }
//                Map {
//                    ForEach(locations) { location in
////                        Marker(location.name, coordinate: location.coordinate)
//                        Annotation(location.name, coordinate: location.coordinate) {
//                            Text(location.name)
//                                .font(.headline)
//                                .padding()
//                                .background(.blue.gradient)
//                                .foregroundStyle(.white)
//                                .clipShape(.capsule)
//                        }
//                        .annotationTitles(.hidden)
//                    }
//                }
            }
            
            
//            Map(interactionModes: [])
//                .mapStyle(.hybrid(elevation: .realistic))
//            Map(position: $position)
//                .mapStyle(.hybrid(elevation: .realistic))
//                .onMapCameraChange(frequency: .continuous) { context in
//                    print(context.region)
//                }
            
            
            
//            HStack(spacing: 50) {
//                Button("Paris") {
//                    position = MapCameraPosition.region(
//                        MKCoordinateRegion(
//                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
//                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
//                    )
//                }
//                
//                Button("Tokyo") {
//                    position = MapCameraPosition.region(
//                        MKCoordinateRegion(
//                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
//                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
//                    )
//                }
//            }
        }
    }
    

}

#Preview {
    ContentView()
}

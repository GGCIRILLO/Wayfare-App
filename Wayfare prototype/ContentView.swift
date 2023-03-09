//
//  ContentView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 28/02/23.
//

import SwiftUI
import MapKit
import CoreLocation

// bug sheets dismiss


struct ContentView: View {
    //default map showing
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.854642, longitude: 14.239793), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @ObservedObject var myLocations = LocationsData()
    @State var selectedLocation : Location?
    
    let accentColor = Color("AccentColor")
    
    @State private var isShowingLocationSheet = false
    @State private var isShowingSearchSheet = true
    @State private var isShowingProfileSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomLeading) {
                mapLayer
                    .ignoresSafeArea()
                    .bottomSheet(presentationDetents: [.fraction(0.1), .large], isPresented: $isShowingSearchSheet, sheetCornerRadius:  14) {
                        SearchView()
                            
                            .sheet(item: $selectedLocation) { location in
                                PlaceCardView(location: location)
                                    .presentationDetents([.fraction(0.33)])
                                    .presentationDragIndicator(.visible)
                            }
                        
                            .sheet(isPresented: $isShowingProfileSheet) {
                                ProfileView()
                                    .presentationDetents([.large])
                            }

                    } onDismiss: {}
            }
            .overlay (alignment: .topTrailing){
                profileButton
            }
        }
        .navigationBarBackButtonHidden()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Favorites())
    }
}

extension ContentView {
    
    private var mapLayer : some View {
        Map(coordinateRegion: $mapRegion,
            annotationItems: myLocations.locations){ location in
            MapAnnotation(coordinate: location.coordinates) {
                Button {
                    withAnimation {
                        selectedLocation = location
                        isShowingLocationSheet.toggle()
                    }
                } label: {
                    Image(systemName: location.icon)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .padding(8)
                        .background(accentColor)
                        .clipShape(Circle())
                    
                }
                .animation(.easeInOut)
            }
        }
        
    }
    
    private var profileButton : some View {
        VStack (alignment: .trailing){
            HStack {
                Button {
                    isShowingProfileSheet.toggle()
                } label: {
                    Image(systemName: "person.fill")
                        .foregroundColor(.accentColor)
                        .font(.title3)
                        .padding(7)
                        .background {
                            Circle()
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
            }
        }
    }
}

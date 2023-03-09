//
//  PlaceSuggestView.swift
//  Wayfare prototype
//
//  Created by Luigi Cirillo on 07/03/23.
//

import SwiftUI
import MapKit

struct PlaceSuggestView: View {
    @State var QueryPlace = " "
    @State var selectedActivities : [Activity] = []
    @State private var sugActMap = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.8517746, longitude: 14.2681244),
            latitudinalMeters: 1500, longitudinalMeters: 1500)
    
    var body: some View {
        
        VStack {
            
            Text("Is Wayfare missing something?")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding()
                
            Text("Thank you for telling us about a new place or activity to list on Wayfare. Your contributions make our community stronger. To get started, tell us a little bit more.")
                .font(.body)
            
            Form {
                
                HStack {
                    Image(systemName: "location.circle.fill")
                        .foregroundColor(.orange)
                    Text("Place")
                }
                
                Section {
                    Map(coordinateRegion: $sugActMap)
                        .frame(height: 250)
                } footer: {
                    Text("Move the map to the location where you want to add something to App Name. Expand to use the full map")
                        .font(.system(size: 10))
                }
                
                Section {
                    TextField("Write here where to do the activity", text: $QueryPlace)
                } header: {
                    Text("Name of the place")
                }
                
                Section {
                    ForEach(Config.allActivities) { loc in
                        Button {
                            if selectedActivities.contains(loc) {
                                selectedActivities.remove(at: selectedActivities.firstIndex(where: {$0.id == loc.id})!)
                            }else {
                                selectedActivities.append(loc)
                            }
                        } label: {
                            HStack{
                                ZStack {
                                    Circle()
                                        .frame(width: 25)
                                        .foregroundColor(.orange)
                                    Image(systemName: loc.icon)
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                }
                                Text(loc.name).foregroundColor(.primary)
                                Spacer()
                                if selectedActivities.contains(where: {$0.id == loc.id}){
                                    Image(systemName:"checkmark")
                                        .foregroundColor(.orange)
                                }
                            }
                        }
                    }
                    
                } header: {
                    Text ("Type of activity")
                } footer: {
                    Text ("Choose at least one activity that can be done in the place you are suggesting")
                        .font(.system(size: 12))
                }

            }
                
        }   .padding()
    }
}

struct PlaceSuggestView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSuggestView()
    }
}

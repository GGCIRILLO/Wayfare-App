//
//  SearchView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 28/02/23.
//
//



import SwiftUI
import MapKit

struct SearchView: View {
    
    @ObservedObject var myLocations = LocationsData()
    @State private var searchText = ""
    @StateObject var favorites = Favorites()
    @State var selectedActivity : Activity?
    
    let accentColor = Color("AccentColor")
    
    
    var body: some View {
        NavigationStack {
            TextField("Search locations", text: $searchText)
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.ultraThickMaterial)
                }
                .padding(.top, 30)
                .padding(.bottom)
                .padding(.horizontal)
            
            List{
                Section {
                    ScrollView(.horizontal){
                        HStack {
                            ForEach (Config.allActivities) { activity in
                                FilterView(filterActivity: activity, selectedActivity: $selectedActivity)
                            }
                        }
                    }
                }
                .listStyle(.grouped)
                
                Section {
                    ForEach(searchResults){ location in
                        NavigationLink{
                            PlaceView(location: location)
                        } label: {
                            VStack (alignment: .leading){
                                HStack{
                                    Image(systemName: location.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.black)
                                        .padding(10)
                                        .background(accentColor)
                                        .clipShape(Circle())
                                        .frame(width: 40, height: 40)
                                        .padding(.trailing, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text(location.name)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        //.padding(.bottom, 0.5)
                                            .multilineTextAlignment(.leading)
                                        Text(String(location.distance) + " km away • " + location.cost)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(listOfActivities(location: location).joined(separator: ", "))
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                    }
                                }
                            }
                        }
                    }
                    .foregroundColor(.secondary)
                }
            }
            .navigationBarTitle(" ", displayMode: .inline)
            .environmentObject(favorites)
        }
    }
    
    
    var searchResults: [Location] {
        if selectedActivity != nil {
           return myLocations.locations.filter{ loc in
               loc.activities.filter {
                   $0.activity == selectedActivity!
               }.count > 0
           }
       } else {
           
           if searchText.isEmpty {
               return myLocations.locations
           } else {
                   return myLocations.locations.filter {
                       ($0.name).lowercased().contains(searchText.lowercased())
                   }
               }
       }
        
        
        
         
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(Favorites())
    }
}

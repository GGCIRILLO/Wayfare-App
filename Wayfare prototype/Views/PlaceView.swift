//
//  PlaceView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 03/03/23.
//

import SwiftUI

struct PlaceView: View {
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @ObservedObject var myLocations = LocationsData()
    @EnvironmentObject var favorites : Favorites
    @State var favouriteAlert = false
    var location : Location
    let accentColor = Color("Accent Color")
    
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ScrollView {
                    VStack {
                        TabView {
                            ForEach(location.imageNames, id: \.self) {
                                Image($0)
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                            }
                        }
                        .frame(height: 200)
                        .tabViewStyle(PageTabViewStyle())
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text(location.name)
                            .font(.title)
                            .bold()
                            .padding(.bottom, 1)
                            .foregroundColor(.primary)
                        
                        Text(String(location.distance) + " km away • " + location.cost)
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(.bottom, 17)
                        
                        HStack {
                            FancyButton(width: 60, height: 60) {
                                if favorites.contains(location) {
                                    Image(systemName: "heart.fill")
                                        .font(.system(size: 25))
                                        .fontWeight(.regular)
                                } else {
                                    Image(systemName: "heart")
                                        .font(.system(size: 25))
                                        .fontWeight(.regular)
                                }
                            }
                            .onTapGesture {
                                favouriteAlert.toggle()
                                
                                if favorites.contains(location){
                                    favorites.locations.removeAll { currentLocation in
                                        location == currentLocation
                                    }
                                } else {
                                    favorites.locations.append(location)
                                }
                            }
                            
                            
//                            FancyButton(width: 60, height: 60) {
//                                Image(systemName: "square.and.arrow.up")
//                                    .font(.system(size: 25))
//                                    .fontWeight(.regular)
//                            }
                            
                            ShareLink(item: location, preview:  SharePreview(location.name, image: location.imageNames[0])) {
                                FancyButton(width: 60, height: 60) {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 25))
                                        .fontWeight(.regular)
                                }
                            }
                            
                            
                        }.padding(.bottom, 10)
                        
                        Text(location.description)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding(.bottom)
                            .multilineTextAlignment(.leading)
                        
                        List {
                            Section ("Main activity"){
                                NavigationLink {
                                    ActivityInPlaceView(activityInPlace: location.activities.first!, location: location)
                                } label: {
                                    ActivityListRowView(
                                        icon: location.icon,
                                        subIcon: "person.3.fill",
                                        mainText: location.activities.first?.activity.name ?? "",
                                        subText: "12"
                                    )
                                }
                                .font(.headline)
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                            
                            if Int(location.activities.count) > 1 {
                            Section("Other activities") {
                                ForEach(location.activities[1..<location.activities.count], id: \.self) { activity in
                                    NavigationLink {
                                        ActivityInPlaceView(activityInPlace: activity, location: location)
                                    } label: {
                                        ActivityListRowView(
                                            icon: activity.activity.icon,
                                            subIcon: "person.3.fill",
                                            mainText: activity.activity.name,
                                            subText: "15"
                                        )
                                    }
                                    .font(.headline)
                                }
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                                
                            }
                        }
                        .frame(minHeight: CGFloat(location.activities.count) * 120)
                        .scrollContentBackground(.hidden)
                        .padding(.leading, -17)
                        .padding(.top, -25)
                        .scrollDisabled(true)
                        
                    }.padding(.top, 20)
                        .padding(.leading, 15)
                }
                
                Spacer()
            }
            .navigationBarTitle("About", displayMode: .inline)
        }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView(location: Config.previewData)
            .environmentObject(Favorites())
    }
}


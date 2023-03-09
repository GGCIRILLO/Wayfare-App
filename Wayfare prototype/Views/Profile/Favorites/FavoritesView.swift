//
//  FavoritesView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 04/03/23.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var myLocations = LocationsData()
    @ObservedObject var myFavourites = Favorites()
    @EnvironmentObject var favorites : Favorites
    

    let accentColor = Color("AccentColor")

    
    var body: some View {
        NavigationStack{
             VStack{
                 List {
                     ForEach(Array(favorites.locations), id: \.self) { location in
                         NavigationLink {
                             PlaceView(location: location)
                         } label: {
                             HStack {
                                 Image(systemName: location.icon)
                                     .resizable()
                                     .scaledToFit()
                                     .foregroundColor(.black)
                                     .padding(8)
                                     .background(accentColor)
                                     .clipShape(Circle())
                                     .frame(width: 30, height: 30)
                                 Text(location.name)
                                     .font(.headline)
                                     .bold()
                                     .foregroundColor(.primary)
                                     .padding(8)
                             }
                         }
                         
                     }
                     .onDelete { indexSet in
                         favorites.locations.remove(atOffsets: indexSet)
                     }
                 }
                 .foregroundColor(.secondary)
             }
             .navigationBarTitle("Favorites", displayMode: .inline)
         }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(Favorites())

    }
}

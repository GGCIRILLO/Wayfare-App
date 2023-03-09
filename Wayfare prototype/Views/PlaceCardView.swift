//
//  PlaceCardView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 03/03/23.
//

import SwiftUI

struct PlaceCardView: View {
    var location : Location
    @State private var isShowingSearchSheet = false
    @State private var isShowingProfileSheet = false
    @State private var showPlaceView = false
    
    var body : some View {
        
        
        NavigationView {
            //            VStack {
            //                RoundedRectangle(cornerRadius: 25)
            //                    .frame(width: 50, height: 5)
            //                    .foregroundColor(.secondary)
            //
            //                HStack{
            //                    Button {
            //                        isShowingSearchSheet.toggle()
            //                    } label: {
            //                        HStack{
            //                            Image(systemName: "magnifyingglass")
            //                            Text("Search locations")
            //
            //                            Spacer()
            //                            Image(systemName: "mic.fill")
            //                        }
            //                        .padding(5)
            //                        .background(.ultraThinMaterial)
            //                        .contentShape(RoundedRectangle(cornerRadius: 10))
            //                        .clipShape(RoundedRectangle(cornerRadius: 10))
            //                    }
            //                    .sheet(isPresented: $isShowingSearchSheet) {
            //                        SearchView()
            //                    }
            //
            //
            //                    Button {
            //                        isShowingProfileSheet.toggle()
            //                    } label: {
            //                        Image(systemName: "person.circle.fill")
            //                            .background(.ultraThinMaterial)
            //                            .clipShape(Circle())
            //                            .font(.title)
            //                    }
            //                    .sheet(isPresented: $isShowingProfileSheet) {
            //                        ProfileSheetView()
            //                            .presentationDetents([.fraction(0.4)])
            //                    }
            //
            //                }
            //                .padding()
            
            VStack(alignment: .leading) {
                if let imageName = location.imageNames.first {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 115)
                        .clipShape(Rectangle())
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(location.name)
                            .bold()
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(String(location.distance) + " km • " + location.cost)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    
                    
                    Spacer()
                    Button {
                        showPlaceView.toggle()
                    }
                label: {
                    Text("See more")
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .bold()
                        .padding(10)
                        .background(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }.padding([.top, .trailing])
                        .sheet(isPresented: $showPlaceView) {
                            PlaceView(location: location)
                        }
                    
                }
                .padding(.top, 7)
                .padding(.leading, 15)
                
                Spacer()
                
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(width: 370, height: 200)
        }
    }
}



struct PlaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCardView(location: Config.previewData)
            .environmentObject(Favorites())
    }
}

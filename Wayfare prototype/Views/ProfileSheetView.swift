//
//  ProfileSheetView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 28/02/23.
//

import SwiftUI

struct ProfileSheetView: View {
    @State private var isShowingSearchSheet = false
    @State private var isShowingProfile = false
    @State private var showPlaceView = false
    @State private var isShowingFavorites = false
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 50, height: 5)
                .foregroundColor(.secondary)
            HStack{
                Button {
                    isShowingSearchSheet.toggle()
                } label: {
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search locations")
                        
                        Spacer()
                        Image(systemName: "mic.fill")
                    }
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .contentShape(RoundedRectangle(cornerRadius: 10))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .sheet(isPresented: $isShowingSearchSheet) {
                    SearchView()
                }
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.accentColor)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .font(.title)
            }
            .padding()
            
            //Options
            Button {
                isShowingProfile.toggle()
            } label: {
                HStack{
                    Image(systemName: "gear")
                    Text("Profile")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .sheet(isPresented: $isShowingProfile) {
                ProfileView()
            }
            .padding([.leading, .trailing])
            
            Button {
                isShowingFavorites.toggle()
            } label: {
                HStack{
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.top, -5)
            .padding([.leading, .trailing])
            .sheet(isPresented: $isShowingFavorites) {
                FavoritesView()
            }

            Button {
                
            } label: {
                HStack{
                    Image(systemName: "lightbulb")
                    Text("Suggest")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.top, -5)
            .padding([.leading, .trailing])

        }
    }
}

struct ProfileSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSheetView()
        
    }
}

//
//  ProfileView.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 03/03/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                
                List {
                    Section {
                        NavigationLink {
                            EditProfileView()
                        } label: {
                            HStack {
                                Image("pinodaniele")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                VStack (alignment:.leading)
                                {
                                    Text("Pino Daniele")
                                        .font(.title2)
                                        .bold()
                                    Text(verbatim: "pinodaniele@mail.com")
                                        .foregroundColor(.secondary)
                                        .font(.callout)
                                }.padding(.leading, 5)
                            }
                    }
                    .foregroundColor(.primary)
                    }
                    Section{

                        
                        Text("Your activities")
                        
                        NavigationLink {
                            FavoritesView()
                        } label: {
                            Text("Favorites")
                        }

                        Text("Your reviews")
                        
                        NavigationLink {
                            SuggestView()
                        } label: {
                            Text("Suggest something")
                        }

                        
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                    .foregroundColor(.primary)
                }
                
            }
            .navigationBarTitle("Profile", displayMode: .inline)
            .navigationBarItems(leading:
                Button("Close")
                {
                dismiss()
                }
            )
            
            
            
            
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//
//  LocationModel.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 28/02/23.
//

import Foundation
import MapKit
import SwiftUI


struct Location : Identifiable, Hashable, Equatable, Transferable {
    
    let id = UUID()
    let name : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let icon : String
    let distance : Float
    let cost : String
    let activities : [SpecificActivity]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.imageNames[0])
    }

}

struct Activity : Identifiable, Equatable, Hashable{
        var id = UUID()
        var name: String
        var imageName: String
        var icon : String 
}

struct SpecificActivity : Identifiable, Equatable, Hashable {
    var id = UUID()
    var activity : Activity
    var stars : Float
}

func listOfActivities(location: Location) -> [String] {
    var f : [String] = []
    for act in location.activities {
        f.append(act.activity.name)
    }
    return f
}


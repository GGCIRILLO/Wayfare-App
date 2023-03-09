//
//  Config.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 03/03/23.
//

import Foundation
import CoreLocation

struct Config {
    static let allActivities = [
        Activity(name: "Running", imageName: "running", icon: "figure.run"),
        Activity(name: "Walking", imageName: "walking", icon: "figure.walk"),
        Activity(name: "Climbing", imageName: "climbing", icon: "figure.climbing"),
        Activity(name: "Skating", imageName: "skating", icon: "figure.skating"),
        Activity(name: "Open Gym", imageName: "opengym", icon: "dumbbell.fill"),
        Activity(name: "Yoga", imageName: "yoga", icon: "figure.mind.and.body"),
        Activity(name: "Biking", imageName: "biking", icon: "bicycle"),
        Activity(name: "Volleyball", imageName: "volleyball", icon: "figure.volleyball"),
        Activity(name: "Basketball", imageName: "basketball", icon: "figure.basketball"),
        Activity(name: "Football", imageName: "football", icon: "soccerball"),
        Activity(name: "Hiking", imageName: "hiking", icon: "figure.hiking"),
    ]
    static let previewData = Location(name: "Posto di prova", coordinates: CLLocationCoordinate2D(latitude: 40.8725488, longitude: 14.2511014), description: "posto di prova prova", imageNames: ["mario1", "mario2"], icon: "figure.run", distance: 2.5 ,cost: "Free",activities: []
    )
}

class Act : ObservableObject {
    @Published var selectedActivities : [Activity] = []
}


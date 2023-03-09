//
//  LocationsData.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 28/02/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsData : ObservableObject {
    @Published var locations : [Location]
    
    static func getActivityByName(name: String) -> Activity {
        for activity in Config.allActivities {
            if activity.name == name {
                return activity
            }
        }
        return Activity(name: "Null", imageName: "null", icon: "figure.run")
    }
    
    init() {
        let _locations = [
            Location(
                name: "Bosco di Capodimonte",
                coordinates: CLLocationCoordinate2D(latitude: 40.8725488, longitude: 14.2511014),
                description: "A public park in the heart of Naples. It is located on the Capodimonte hill, therefore you can get beautiful views and landscapes of the city from there. The area is large and allows to practice different activities. Can be reached through buses from Piazza Dante.",
                imageNames: ["bosco1","bosco2"],
                icon: "figure.run",
                distance: 2.5 ,
                cost: "Free",
                activities: [
                    SpecificActivity(activity: LocationsData.getActivityByName(name: "Running"), stars: 3, actDescription: "is a fantastic activity to do here. You can find suggestive routes and wonderful landscape to admire while doing sport"),
                    SpecificActivity(activity: LocationsData.getActivityByName(name: "Football"), stars: 3, actDescription: "is great activity and there are always people to play with, so you can either play and make new friends here!"),
                    SpecificActivity(activity: LocationsData.getActivityByName(name: "Yoga"), stars: 5, actDescription: "is a good place to relax and connect yourself with the enviroment. You can do it alone or in group."),
                ]
            ),
            Location(name: "Campo di Montedonzelli",
                     coordinates: CLLocationCoordinate2D(latitude: 40.854552, longitude: 14.225814),
                     description: "This field is located in the Rione Alto neighbourhood, near the “Montedonzelli” stop of the metro. The main activity is basketball. There are many young people playing during the day and the weekends.",
                     imageNames: ["campo1","campo2"],
                     icon: "basketball",
                     distance: 4.2 ,
                     cost: "Free",
                     activities: [
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Basketball"), stars: 4, actDescription: "is a great activity, the field is very good and people are always here. Come to take a look and play with others!")
                     ]
                    ),
            Location(name: "Centro Sportivo Mario Lenci",
                     coordinates: CLLocationCoordinate2D (latitude:40.82490932620092, longitude: 14.204943894469864),
                     description: "The \("Mario Lenci") sports center, managed by those directly involved since 2004, is one of the historic structures in Naples and is logistically located in the last \("green lung") of the district. It has three five-a-side football fields, twelve changing rooms, a refreshment point with a terrace overlooking the fields and ample parking (guarded in the evening)",
                     imageNames: ["mario1","mario2"],
                     icon: "soccerball.inverse",
                     distance: 3.7,
                     cost: "Paid",
                     activities: [
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Football"), stars: 3, actDescription: "is great and there are always people to play with, so you can either play and make new friends here!")
                     ]
                    ),
            Location( name: "Parco dei Quartieri Spagnoli",
                      coordinates: CLLocationCoordinate2D (latitude:40.846429269477824, longitude: 14.2444477108933),
                      description: "Located in a strategic urbanistic position, the Parco dei Quartieri Spagnoli (Former Military Hospital) with its hinge function between the ancient city and the hill of San Martino, represents a green lung and an important meeting place for the whole city community",
                      imageNames: ["parco1", "parco2"],
                      icon: "dumbbell.fill",
                      distance: 6.3,
                      cost: "Free",
                      activities: [
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Open Gym"), stars: 5, actDescription: "is perfect, because gymnasium is available to students, families, and/or community members to play pick-up sports such as basketball or volleyball, participate in fitness stations, run laps, etc."),
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Biking"), stars: 2, actDescription: "is very nice, there is a bicycle lane along a suggestive landscape"),
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Football"), stars: 3, actDescription: "is a good place where you can play football and there are always people to play with, so you can either play and make new friends here!")
                      ]
                    ),
            Location(name: "Parco Tortora Brayda",
                     coordinates: CLLocationCoordinate2D(latitude: 40.871680206870636, longitude: 14.384966257452152),
                     description: "This park has wonderful paths that run along the entire perimeter of the park and are crossed by many young fitness lovers and families with children, who flock to the play area of this extraordinary municipal park.",
                     imageNames: ["tortora1", "tortora2"],
                     icon: "figure.run",
                     distance: 10.2,
                     cost: "Free",
                     activities: [
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Running"), stars: 0, actDescription: "is a fantastic activity to do here. You can find suggestive routes and wonderful landscape to admire while doing sport"),
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Open Gym"), stars: 3, actDescription: "is perfect, because gymnasium is available to students, families, and/or community members to play pick-up sports such as basketball or volleyball, participate in fitness stations, run laps, etc.")
                        
                     ]
                    ),
            Location(name: "Vesuvio",
                     coordinates: CLLocationCoordinate2D(latitude: 40.82364771848481, longitude: 14.42899150023904),
                     description: "Mount Vesuvius is a somma-stratovolcano located on the Gulf of Naples in Campania, Italy, about 9 km east of Naples and a short distance from the shore. It is one of several volcanoes forming the Campanian volcanic arc.",
                     imageNames: ["vesuvio1", "vesuvio2"],
                     icon: "figure.hiking",
                     distance: 11.4,
                     cost: "Free",
                     activities: [
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Hiking"), stars: 3, actDescription: "leaves you speechless. The path is incredible and very suggestive, you can admire wonderful natural landscapes"),
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Walking"), stars: 5, actDescription: "can be very suggestive, "),
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Running"), stars: 4, actDescription: "is a fantastic activity to do here. You can find suggestive routes and wonderful landscape to admire while doing sport")

                     ] ),
            Location(name: "Villa Floridiana",
                     coordinates: CLLocationCoordinate2D(latitude: 40.839438, longitude: 14.230003),
                     description: "The park that surrounds the Villa Floridiana is a fascinating set of winding paths and woods that climb and descend until they culminate in a splendid belvedere which is located, right behind the villa, on a terrace overlooking the sea, from which can admire a splendid view of the Gulf of Naples. Inside the park you can also come across pillars and columns, statues and architectural elements that represent fake Roman and Ionic ruins, and also a small amphitheater called the Teatreno della Verzura.",
                     imageNames: ["floridiana1", "floridiana2"],
                     icon: "figure.run",
                     distance: 5.6,
                     cost: "Free",
                     activities: [
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Running"), stars: 2, actDescription: "is a fantastic activity to do here. You can find suggestive routes and wonderful landscape to admire while doing sport"),
                        SpecificActivity(activity: LocationsData.getActivityByName(name: "Walking"), stars: 4 , actDescription: "leaves you speechless. The path is incredible and very suggestive, you can admire wonderful natural landscapes")
                     ]),
            Location(name: "Via Caracciolo",
                     coordinates: CLLocationCoordinate2D(latitude: 40.831574, longitude: 14.240807),
                     description: "Via Caracciolo, Via Partenope and Mergellina, or rather the seafront of Naples, for a few days finally free from traffic have certainly become the most interesting attraction of the city. The gardens of the municipal villa built in the 18th century behind it, the bay of Naples with Capri in front, Posillipo on the right, and Castel dell'Ovo on the left frame a finally rediscovered masterpiece of nature.",
                     imageNames: ["caracciolo1", "caracciolo2"],
                     icon: "bicycle", 
                     distance: 4.2,
                     cost: "Free",
                     activities: [
                            SpecificActivity(activity: LocationsData.getActivityByName(name: "Biking"), stars: 5, actDescription: "is very nice, there is a bicycle lane along a suggestive landscape"),
                            SpecificActivity(activity: LocationsData.getActivityByName(name: "Running"), stars: 5, actDescription: "is a fantastic activity to do here. You can find suggestive routes and wonderful landscape to admire while doing sport"),
                            SpecificActivity(activity: LocationsData.getActivityByName(name: "Walking"), stars: 5, actDescription: "leaves you speechless. The path is incredible and very suggestive, you can admire wonderful natural landscapes")
                     ]
                    ),
            Location(name: "Campo sportivo San Rocco",
                     coordinates: CLLocationCoordinate2D(latitude: 40.880947, longitude: 14.238636),
                     description: "One of the best campetti complexes in Naples. Fields of 5, 6, 8 and 11 in latest generation synthetic turf. Clean and large changing rooms, ample parking, all immersed in the greenery of the Capodimonte forest",
                     imageNames: ["sanRocco1", "sanRocco2"],
                     icon: "soccerball.inverse",
                     distance: 7.5,
                     cost: "Paid",
                     activities: [SpecificActivity(activity: LocationsData.getActivityByName(name: "Football"), stars: 4, actDescription: "is great and there are always people to play with, so you can either play and make new friends here!")])
        ]
        self.locations = _locations
    }
}

class Favorites : ObservableObject {
    @Published var locations : [Location] = []
    
    private let saveKey = "Favorites"
    
    func contains (_ location: Location) -> Bool {
        locations.contains(location)
    }
}






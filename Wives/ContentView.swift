//
//  ContentView.swift
//  Wives
//
//  Created by 张松 on 2021/6/6.
//

import SwiftUI

struct ContentView: View {
    // 这里的appstate===Appstate.shared
    @EnvironmentObject private var appstate: AppState

    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("Placeholder")
        })
    }
}


//struct ContentView: View {
//    struct Sea: Hashable, Identifiable {
//        let name: String
//        let id = UUID()
//    }
//    struct OceanRegion: Identifiable {
//        let name: String
//        let seas: [Sea]
//        let id = UUID()
//    }
//    private let oceanRegions: [OceanRegion]  = [
//        OceanRegion(name: "Pacific",
//                    seas: [Sea(name: "Australasian Mediterranean"),
//                           Sea(name: "Philippine"),
//                           Sea(name: "Coral"),
//                           Sea(name: "South China")]),
//        OceanRegion(name: "Atlantic",
//                    seas: [Sea(name: "American Mediterranean"),
//                           Sea(name: "Sargasso"),
//                           Sea(name: "Caribbean")]),
//        OceanRegion(name: "Indian",
//                    seas: [Sea(name: "Bay of Bengal")]),
//        OceanRegion(name: "Southern",
//                    seas: [Sea(name:"Weddell")]),
//        OceanRegion(name: "Arctic",
//                    seas: [Sea(name: "Greenland")])
//    ]
//    @State private var singleSelection : UUID?
//
//    var body: some View {
//        NavigationView {
//            List(selection: $singleSelection){
//                ForEach(oceanRegions) { region in
//                    Section(header: Text("Major \(region.name) Ocean Seas")) {
//                        ForEach(region.seas) { sea in
//                            Text(sea.name)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Oceans and Seas")
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

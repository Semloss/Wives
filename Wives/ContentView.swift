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
        VStack{
            ForEach(AppState.shared.libraryImageList, id: \.self) { item in
                Image(nsImage: item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

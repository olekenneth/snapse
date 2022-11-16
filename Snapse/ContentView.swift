//
//  ContentView.swift
//  Snapse
//
//  Created by Ole-Kenneth Bratholt on 14/11/2022.
//

import SwiftUI

struct ContentView: View {
        var body: some View {
        VStack {
            CameraView()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

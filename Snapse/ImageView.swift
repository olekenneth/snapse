//
//  ContentView.swift
//  Snapse
//
//  Created by Ole-Kenneth Bratholt on 14/11/2022.
//

import SwiftUI

struct ImageView: View {
    @State var image: UIImage? = nil
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "trash.circle")
                        .font(.system(size: 102))
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "paperplane.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                        .padding(.top)
                }
            }
            .scaledToFit()
            
            if image !== nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFill()
                    .zIndex(-1)
                    .ignoresSafeArea(.all)
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: UIImage(named: "DemoImage"))
    }
}

//
//  ChatsView.swift
//  Snapse
//
//  Created by Ole-Kenneth Bratholt on 16/11/2022.
//

import SwiftUI

struct RoomModel:Identifiable {
    let id = UUID()
    var name: String
    var unread: Bool
}

struct ChatsView: View {
    private var rooms: [RoomModel] = [
        RoomModel(name: "Family", unread: false),
        RoomModel(name: "Friends", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: false),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: false),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "One Friend", unread: true),
        RoomModel(name: "Other Friend", unread: false)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach (rooms) { room in
                    Room(room: room)
                }
            }
        }.padding()
    }
}

struct Room: View {
    var room: RoomModel
    
    var body: some View {
        HStack {
            Rectangle()
                .fill()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundColor(room.unread ? Color.red : Color.black)
                .frame(width: 30, height: 30)
            Text(room.name)
                .font(.system(size: 22))
            Spacer()
        }

    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}

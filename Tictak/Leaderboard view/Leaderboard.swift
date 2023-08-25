/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Tan Truong(e.g. Nguyen Van Minh)
  ID: s3754703 (e.g. 1234567)
  Created  date: 26/08/2023 (e.g. 31/07/2023)
  Last modified: dd/mm/yyyy (e.g. 05/08/2023)
  Acknowledgement:
*/
//
//  Leaderboard.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 30/08/2023.
//

import SwiftUI

struct Leaderboard: View {
    
    @ObservedObject private var playermodel: Playerviewmodel = Playerviewmodel()
    
    var body: some View {
        let score = playermodel.getScores()
        let player = playermodel.getPlayers()
        ZStack{
            Color("Casinogreen").ignoresSafeArea(.all)
            Group {
                //check if the point array is equal to username array
                if player.count > 0 && score.count > 0 && score.count == player.count {
                    ScrollView {
                        VStack {
                            ForEach(playermodel.getPlayers().indices, id: \.self) { index in
                                HStack {
                                    Text(player[index])
                                    Spacer()
                                    Text("\(score[index])")
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 200)
                                .foregroundColor(.white)
                                Divider()
                                    .background(Color(.white))
                            }
                        }
                        .background(Color("Woodbrown"))
                        .cornerRadius(15)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .ignoresSafeArea(.all, edges: .bottom)
                    .background(Color("Casinogreen")
                        .ignoresSafeArea())
                } else {
                    //if there is no user
                    Text("No current user")
                        .foregroundColor(.white)
                }
                
            }
        }
        //start and stop background music
//        .onAppear {
//            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "grand-final-orchestral")
//        }
//        .onDisappear {
//            MusicPlayer.shared.stopBackgroundMusic()
//        }
        .navigationTitle("Leaderboard")
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}

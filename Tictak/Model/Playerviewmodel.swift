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
//  Userviewmodel.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 29/08/2023.
//

import Foundation

class Playerviewmodel: ObservableObject {
    
    @Published private var playermodel = Playermodel()

    //get users from User model
    func getPlayers() -> [String] {
        playermodel.getPlayers()
    }

    //Get a user point from the User model
    func getScore(name: String) -> Int {
        playermodel.getScore(name: name)
    }

    //Add more user in User Model and initialize first score = 0
    func addPlayer(info: String) {
        print(info)
        playermodel.addPlayer(info: info)
        playermodel.addScore(score:0)
    }

    //Add point to the User model
    func addScore(score: Int) {
        playermodel.addScore(score: score)
        print(score)
    }

    //Get all points from user model
    func getScores() -> [Int] {
        playermodel.getScores()
    }

    //upfate point while user is playing
    func updateScore(score: Int) {
        playermodel.updateLastScore(score: score)
    }
}

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
//  Setting.swift
//  Tictac
//
//  Created by Truong, Nguyen Tan on 28/08/2023.
//

import SwiftUI
import UIKit

struct Setting: View {
    @AppStorage("isDarkMode") private var Darkmode: Bool = false
    @State private var text = "Setting"
    @State private var showingInformationview = false
    
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        ZStack{
            Menubackgroundcolor()
            VStack(alignment: .center){
                Toggle(
                    isOn: $Darkmode,
                    label: {
                        Text("Theme switch: ")
                        Text("Light/Dark")
                            .padding(.top, 2)
                }
                )
                .modifier(Buttonfunction(color: Color("Blue")))
                .padding(.bottom, 5)
                
                Button(action: {
                    self.showingInformationview = true
                    playSound(sound: "buttonclick", type: "mp3")
                }) {
                    Text("App information")
                        .padding(8)
                }
                .modifier(Buttonfunction(color: Color("Blue")))
            }
        }
        .navigationTitle(text.uppercased())
        .navigationBarTitleDisplayMode(.inline)
        .bold()
        .environment(\.colorScheme, Darkmode ? .dark : .light)
        .sheet(isPresented: $showingInformationview) {
            Informationview()
          }
        .toolbar{
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                Button(action:{Darkmode.toggle()}, label:{ Darkmode ? Label("Dark", systemImage: "lightbulb.fill") : Label("Dark", systemImage: "lightbulb")
                })
            }
        }
        .onAppear{
            Backgroundmusic.shared.StartBackgroundMusic(backgroundmusicname: "setting")
        }
        .onDisappear{
            Backgroundmusic.shared.StopBackgroundMusic()
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}

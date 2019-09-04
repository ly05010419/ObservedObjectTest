//
//  ContentView.swift
//  EnvironmentObjectTest
//
//  Created by LiYong on 01.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import SwiftUI

final class VideoData: ObservableObject{
    @Published var title:String = ""
    @Published var contentIdea:String = ""
}

struct ContentView: View {
    
    @State private var showSecondView:Bool = false
    
    @ObservedObject var videoData = VideoData()
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Name: \(self.videoData.title)")
                Text("Content: \(self.videoData.contentIdea)")
                
                Divider()
                
                Button("Add new Video"){
                    
                    self.showSecondView.toggle()
                    
                }.sheet(isPresented: $showSecondView){
                    
                    SecondView(videoTitle: self.$videoData.title, videoContent: self.$videoData.contentIdea)
                }
                
                Spacer()
            }.navigationBarTitle(Text("HomeView"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

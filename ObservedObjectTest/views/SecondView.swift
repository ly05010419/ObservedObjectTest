//
//  SecondView.swift
//  EnvironmentObjectTest
//
//  Created by LiYong on 01.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @Binding var videoTitle:String
    @Binding var videoContent:String
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                
                TextField("Video Title", text: $videoTitle).background(Color.blue)
                TextField("Video Content", text: $videoContent).background(Color.red).frame(height: 50)
                
                Divider()
                Button("Dissmiss the VC"){
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
                Spacer()
                
            }.padding().navigationBarTitle(Text("SecondView"))
            
            
            
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    
    @ObservedObject static var videoData = VideoData()
    static var previews: some View {
         SecondView(videoTitle: $videoData.title, videoContent: $videoData.contentIdea)
    }
}

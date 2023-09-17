//
//  ContentIView.swift
//  PinnedMessageList
//
//  Created by Gökhan Bozkurt on 17.09.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var messageVM: MessageVM
    
    @State var pinnedViews : [Message] = []
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)
    
    @Namespace var name
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            if !pinnedViews.isEmpty {
                LazyVGrid(columns: columns,spacing: 15) {
                    ForEach(pinnedViews) { pin in
                        Image(pin.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44,height: 44)
                    
//                            .frame(width: (UIScreen.main.bounds.width - 70) / 3 , height: (UIScreen.main.bounds.width - 70) / 3)
                            .clipShape(Circle())
                            .contextMenu {
                                Button {
                                    withAnimation(.easeInOutBack(duration: 2)) {
                                        let pinned = pinnedViews.firstIndex { message  in
                                            if message.profile == pin.profile {
                                                return true
                                            }
                                            return false
                                        }
                                        if let pinned = pinned {
                                            let add = pinnedViews[pinned]
                                            messageVM.messages.append(add)
                                            pinnedViews.remove(at: pinned)
                                           
                                        }
                                      
                                    }
                                } label: {
                                    Text("Remove")
                                }
                                .matchedGeometryEffect(id: pin.profile, in: name)
                            }
                          
                    }
                }
                .padding()
            }
            
            LazyVStack(alignment: .leading, spacing: 0, content: {
                
                ForEach(messageVM.messages) { msg in
                    
                    ZStack {
                        //MARK: Add Buttons
                        
                        HStack {
                            Color.yellow
                                .frame(width: 90)
                            // hiding when left swipe
                                .opacity(msg.offset > 0 ? 1 : 0)
                            Spacer()
                            
                            Color.red
                                .frame(width: 90)
                                .opacity(msg.offset < 0 ? 1 : 0)
                        }
                        
                        //MARK: Buttons
                        HStack {
                            
                            Button {
                                withAnimation(.easeInOutBack(duration: 2)) {
                                    let index = getIndex(profile: msg.profile)

                                    var pinnedView = messageVM.messages[index]

                                    // Set Offset to 0
                                    pinnedView.offset = 0
                                    pinnedViews.append(pinnedView)

                                    // Remove From Main List
                                 messageVM.messages.remove(at: index)


                                }
                            } label: {
                                Image(systemName: "pin.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 90)
                
                            Spacer()
                            
                            Button {
                                //MARK: Remove Delete
                                withAnimation {
                                    messageVM.messages.removeAll { (msg1) in
                                        if msg.profile == msg1.profile { return true }
                                        else { return false }
                                    }
                                }
                            } label: {
                                Image(systemName: "trash.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 90)
                            
                        }

                        HStack(spacing: 15){
                            
                            Image(msg.profile)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .matchedGeometryEffect(id: msg.profile, in: name)
                            
                            VStack(alignment: .leading,spacing: 10){
                                
                                Text(msg.name)
                                
                                Text(msg.message)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                                
                                Divider()
                            }
                        }
                        .padding(.all)
                        .background(Color.white)
                        .contentShape(Rectangle())
                        // adding gesture...
                        .offset(x: msg.offset)
                        .gesture(DragGesture().onChanged({ (value) in
                            
                            withAnimation(.default){
                                
                                messageVM.messages[getIndex(profile: msg.profile)].offset = value.translation.width
                            }
                            
                        })
                            .onEnded({ (value) in
                            
                            withAnimation(.default){
                                
                                if value.translation.width > 80{
                                    
                                    messageVM.messages[getIndex(profile: msg.profile)].offset = 90
                                }
                                else if value.translation.width < -80{
                                    
                                    messageVM.messages[getIndex(profile: msg.profile)].offset = -90
                                }
                                else{
                                    
                                    messageVM.messages[getIndex(profile: msg.profile)].offset = 0
                                }
                            }
                        }))
                        
                    }
                }
            })
            .padding(.vertical)
        })
    }
    
    func getIndex(profile: String)->Int{
        
        var index = 0
        
        for i in 0..<messageVM.messages.count{
            
            if profile == messageVM.messages[i].profile{
                
                index = i
            }
        }
        
        return index
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Animation {
    static var easeInOutBack: Animation {
        Animation.timingCurve(0.5, -0.5, 0.5, 1.5)
    }
    static func easeInOutBack(duration: TimeInterval = 0.25) -> Animation {
        Animation.timingCurve(0.5, -0.5, 0.5, 1.5,duration: duration)
    }
}

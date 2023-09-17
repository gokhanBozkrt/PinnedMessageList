////
////  MessageView.swift
////  PinnedMessageList
////
////  Created by Gökhan Bozkurt on 17.09.2023.
////
//import SwiftUI
//
//struct MessageView: View {
//    
//    @State var messages : [Message] = [
//        
//        Message(id: 0, name: "Catherine", message: "Hi Kavsoft", profile: "p1", offset: 0),
//        Message(id: 1, name: "Emma", message: "New Video !!!", profile: "p2", offset: 0),
//        Message(id: 2, name: "Julie", message: "How Are You ???", profile: "p3", offset: 0),
//        Message(id: 3, name: "Emily", message: "Hey iJustine", profile: "p4", offset: 0),
//        Message(id: 4, name: "Kaviya", message: "hello ????", profile: "p5", offset: 0),
//        Message(id: 5, name: "Jenna", message: "Bye :)))", profile: "p6", offset: 0),
//        Message(id: 6, name: "Juliana", message: "Nothing Much......", profile: "p7", offset: 0),
//    ]
//    
//    @EnvironmentObject var messageVM: MessageVM
//    var columns = Array(repeating: GridItem(.flexible(),spacing: 15), count: 3)
//    
//    @Namespace var name
//    
//    var body: some View {
//            ScrollView(showsIndicators: false) {
//                LazyVStack(alignment: .leading, spacing: 0, content: {
//                    
//                    ForEach(messages) { msg in
//                        
//                        ZStack {
//                            
//                            // adding Buttons...
//                            
//    //                        HStack{
//    //
//    //                            Color.yellow
//    //                                .frame(width: 90)
//    //                            // hiding when left swipe...
//    //                                .opacity(msg.offset > 0 ? 1 : 0)
//    //
//    //                            Spacer()
//    //
//    //                            Color.red
//    //                                .frame(width: 90)
//    //                                .opacity(msg.offset < 0 ? 1 : 0)
//    //                        }
//    //                        .padding()
//    //                        HStack{
//    //
//    //                            Button(action: {
//    //
//    //                                // appending View....
//    //                                withAnimation(.default){
//    //
//    //
//    //                                    let index = getIndex(profile: msg.profile)
//    //
//    //                                    var pinnedView = messages[index]
//    //
//    //                                    // setting offset to 0
//    //
//    //                                    pinnedView.offset = 0
//    //
//    //                                    pinnedViews.append(pinnedView)
//    //
//    //                                    // removing from main View...
//    //
//    //                                    messages.removeAll { (msg1) -> Bool in
//    //
//    //                                        if msg.profile == msg1.profile{return true}
//    //                                        else{return false}
//    //                                    }
//    //                                }
//    //
//    //                            }, label: {
//    //
//    //                                Image(systemName: "pin.fill")
//    //                                    .font(.title)
//    //                                    .foregroundColor(.white)
//    //                            })
//    //                            .frame(width: 90)
//    //
//    //                            // on ended not working...
//    //
//    //                            Spacer()
//    //
//    //                            Button(action: {
//    //
//    //                                // removing from main View...
//    //
//    //                                withAnimation(.default){
//    //
//    //                                    messages.removeAll { (msg1) -> Bool in
//    //
//    //                                        if msg.profile == msg1.profile{return true}
//    //                                        else{return false}
//    //                                    }
//    //                                }
//    //
//    //                            }, label: {
//    //
//    //                                Image(systemName: "trash.fill")
//    //                                    .font(.title)
//    //                                    .foregroundColor(.white)
//    //                            })
//    //                            .frame(width: 90)
//    //                        }
//    //
//                            HStack(spacing: 15){
//                                
//                                Image(msg.profile)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 60, height: 60)
//                                    .clipShape(Circle())
//                                    .matchedGeometryEffect(id: msg.profile, in: name)
//                                
//                                VStack(alignment: .leading,spacing: 10){
//                                    
//                                    Text(msg.name)
//                                    
//                                    Text(msg.message)
//                                        .foregroundColor(.gray)
//                                        .lineLimit(1)
//                                    
//                                    Divider()
//                                }
//                            }
//                            .padding(.all)
//                            .background(Color.white)
//                            .contentShape(Rectangle())
//                            // adding gesture...
//                            .offset(x: msg.offset)
//                            .gesture(DragGesture().onChanged({ (value) in
//                                
//                                withAnimation(.default){
//                                    
//                                    messages[getIndex(profile: msg.profile)].offset = value.translation.width
//                                }
//                                
//                            })
//                            .onEnded({ (value) in
//                                
//                                withAnimation(.default){
//                                    
//                                    if value.translation.width > 80{
//                                        
//                                        messages[getIndex(profile: msg.profile)].offset = 90
//                                    }
//                                    else if value.translation.width < -80{
//                                        
//                                        messages[getIndex(profile: msg.profile)].offset = -90
//                                    }
//                                    else{
//                                        
//                                        messages[getIndex(profile: msg.profile)].offset = 0
//                                    }
//                                }
//                            }))
//                            
//                        }
//                    }
//                })
//                .padding(.vertical)
////                LazyVStack(alignment: .leading,spacing: 0) {
////                    ForEach(messages) { msg in
////                        ZStack {
////                            HStack(spacing: 15){
////
////                                Image(msg.profile)
////                                    .resizable()
////                                    .aspectRatio(contentMode: .fill)
////                                    .frame(width: 60, height: 60)
////                                    .clipShape(Circle())
////                                    .matchedGeometryEffect(id: msg.profile, in: name)
////
////                                VStack(alignment: .leading,spacing: 10){
////
////                                    Text(msg.name)
////
////                                    Text(msg.message)
////                                        .foregroundColor(.gray)
////                                        .lineLimit(1)
////
////                                    Divider()
////                                }
////                            }
////                            .padding(.all)
////                            .background(Color.white)
////                            .contentShape(Rectangle())
////                            // adding gesture...
////                            .offset(x: msg.offset)
////                            .gesture(DragGesture().onChanged({ (value) in
////
////                                withAnimation(.default){
////
////                                    messages[getIndex(profile: msg.profile)].offset = value.translation.width
////                                }
////
////                            })
////                            .onEnded({ (value) in
////
////                                withAnimation(.default){
////
////                                    if value.translation.width > 80{
////
////                                        messages[getIndex(profile: msg.profile)].offset = 90
////                                    }
////                                    else if value.translation.width < -80{
////
////                                        messages[getIndex(profile: msg.profile)].offset = -90
////                                    }
////                                    else{
////
////                                        messages[getIndex(profile: msg.profile)].offset = 0
////                                    }
////                                }
////                            }))
////                            // MARK: Person Picture AND MESSAGE
//////                            HStack(spacing: 15) {
//////                                Image(message.profile)
//////                                    .resizable()
//////                                    .aspectRatio(contentMode: .fill)
//////                                    .frame(width: 54,height: 54)
//////                                    .clipShape(Circle())
//////                                    .matchedGeometryEffect(id: message.profile, in: name)
//////                                VStack(alignment: .leading,spacing: 15) {
//////                                    Text(message.name)
//////
//////                                    Text(message.message)
//////                                        .foregroundColor(.gray)
//////                                        .lineLimit(1)
//////                                    Divider()
//////                                }
//////                            }
//////                            .padding(.all)
//////                            .background(Color.white)
//////                            .contentShape(Rectangle())
//////                            //MARK: Add Geseture
//////                            .offset(x: message.offset)
//////                            .gesture(
//////                                DragGesture()
//////                                    .onChanged({ value in
//////                                        withAnimation {
//////                                            messages[getIndex(profile: message.profile)].offset = value.translation.width
//////                                        }
//////                                    })
//////                                    .onEnded({ value in
//////                                        withAnimation {
//////                                            if value.translation.width > 80 {
//////                                                messages[getIndex(profile: message.profile)].offset = 90
//////                                            } else if value.translation.width < -80 {
//////                                                messages[getIndex(profile: message.profile)].offset = -90
//////                                            } else {
//////                                                messages[getIndex(profile: message.profile)].offset = 0
//////                                            }
//////                                        }
//////                                    })
//////                            )
////                        }
////                    }
////                }
////                .padding(.vertical)
//            }
//        
//    }
//    
//    private func getIndex(profile: String) -> Int {
//        var index = 0
//        for i in 0..<messages.count {
//            if profile == messages[i].profile {
//                index = 1
//            }
//        }
//        return index
//    }
//}
//
//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView()
//    }
//}
//
//
//

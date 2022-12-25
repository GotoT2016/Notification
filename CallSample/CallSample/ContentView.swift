//
//  ContentView.swift
//  CallSample
//
//  Created by TakeshiGoto on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
  @State private var count:Int = 0
  @State var refreshCount:Int = 0
  private let addCount = 10
  
  var body: some View {
    VStack {
      Text("CountentView: \(refreshCount)").hidden() // 回転後のViewリフレッシュ
      Spacer()
      Text("CountentView: \(count)")
        .fontWeight(.bold)
        .foregroundColor(Color.red)
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
        Button(action: {NotificationManager.instance.sendNotification()}, label: {makeButtonText("通知!")})
      HStack{
        Button(action: {self.count = self.count + addCount}, label: {makeButtonText("呼び出し")})
        Button(action: {self.count = self.count + addCount}, label: {makeButtonText("取り消し")})
      }
    }
  }
  
  private func makeButtonText(_ title:String)->some View{
    Text("\(title)")
      .frame(width: UIScreen.main.bounds.width * 0.8 / 2,height: 80)
      .font(.largeTitle)
      .fontWeight(.bold)
      .foregroundColor(Color.blue)
      .multilineTextAlignment(.center)
      .padding(.all)
      .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
      .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in refreshCount = refreshCount + 1 }
  }
}

struct ContentView_Previews: PreviewProvider{
  static var previews: some View{
    ContentView()
  }
}

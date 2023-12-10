//
//  ContentView.swift
//  SwiftUISpeechToTextDemo
//
//  Created by Shashwat Panda on 10/12/23.
//

import SwiftUI
import SwiftUISpeechToText

struct ContentView: View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State var title:String = "Start Recording"
    @State var isRecording:Bool = false
    @State var color:Color = .cyan
    var body: some View {
        VStack {
            Spacer()
            Text("\((isRecording == false) ? "":((speechRecognizer.transcript == "") ? "Speak Now": speechRecognizer.transcript))")
            Spacer()
            Button("\(title)") {
                isRecording.toggle()
                if  isRecording {
                    speechRecognizer.transcribe()
                    title = "Stop Recording"
                    color = .red
                }else{
                    speechRecognizer.stopTranscribing()
                    title = "Start Recording"
                    color = .cyan
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(color)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

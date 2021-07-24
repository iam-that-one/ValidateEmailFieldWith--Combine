//
//  ContentView.swift
//  ValidateFieldsWithCombine
//
//  Created by Abdullah Alnutayfi on 24/07/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack(spacing: 20){
            VStack{
                Text(!vm.canSubmit.value ? vm.emailPrompt : "")
                    .animation(.spring())
                TextField("email", text: $vm.email.value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .animation(.spring())
            }
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(!vm.canSubmit.value ? .red: .green)
                .overlay(
                    Text(!vm.canSubmit.value ? "Invalid Email" : "Valid Email")
                        .fontWeight(.bold)
                        .foregroundColor(!vm.canSubmit.value ? .black : .white)
                       
                )
                
                .overlay(Circle() .stroke(style: StrokeStyle(lineWidth: 2, dash: [5])))
                .rotationEffect(Angle(degrees: vm.canSubmit.value ? 360 : 0))
                .animation(.spring())
        }.padding()
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
                Text(!vm.isValid.value ? vm.emailPrompt : "")
                    .animation(.spring())
                TextField("email", text: $vm.email.value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .animation(.spring())
            }
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(!vm.isValid.value ? .red: .green)
                .overlay(
                    Text(!vm.isValid.value ? ErrorMesssage.invalidEmail.message : ErrorMesssage.validEmail.message)
                        .fontWeight(.bold)
                        .foregroundColor(!vm.isValid.value ? .black : .white)
                       
                )
                
                .overlay(Circle() .stroke(style: StrokeStyle(lineWidth: 2, dash: [5])))
                .rotationEffect(Angle(degrees: vm.isValid.value ? 360 : 0))
                .animation(.spring())
        }.padding()
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

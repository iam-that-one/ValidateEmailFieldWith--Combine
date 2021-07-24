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
        VStack(spacing: 40){
            VStack{
               
                TextField("Email", text: $vm.email.value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .animation(.spring())
                    .autocapitalization(.none)
                HStack{
                Text(vm.emailPrompt)
                    .animation(.spring())
                    .opacity(vm.isValid.value ? 0 : 1)
                    .font(Font.system(size: 8, weight: .semibold, design: .monospaced))
                    .foregroundColor(.red)
                    Spacer()
                }
            }
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(!vm.isValid.value ? .red: .green)
                .overlay(
                    Text(!vm.isValid.value ?  ErrorMesssage.invalidEmail.message : ErrorMesssage.validEmail.message)
                        .fontWeight(.bold)
                        .foregroundColor(!vm.isValid.value ? .black : .white)
                        .multilineTextAlignment(.center)
                )
                .frame(width: vm.isValid.value ? 150: 100, height: vm.isValid.value ? 150 : 100)
                .overlay(Circle() .stroke(style: StrokeStyle(lineWidth: 2, dash: [5])))
                .rotationEffect(Angle(degrees: vm.isValid.value ? 360 : 0))
                
                .animation(.spring())
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

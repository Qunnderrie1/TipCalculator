//
//  ContentView.swift
//  Learning
//
//  Created by Qunnderrie Snelling on 9/23/21.
//

import SwiftUI

struct ContentView: View {

    @State var userBill: Double
    @State var userTip: Double
    @State var numberOfPeople: Double

    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 50) {
                    
                    
                    VStack {
                        HStack {
                            Text("Number Of people")
                                .font(.title2)
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            Text("\(numberOfPeople, specifier: "%.0f")")
                                .font(.title2)
                                .foregroundColor(Color.white)
                                .padding(.horizontal)
        
                        }//: HSTACK
                        Slider(value: $numberOfPeople, in: 1...35, step: 1)
                            
                            .padding()
                            
                    }//:VSTACK
                    
                    
                    
                    VStack {
                        HStack {
                            Text("Tip")
                                .font(.title2)
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            Text("\(userTip, specifier: "%.0f")%")
                                .font(.title2)
                                .foregroundColor(Color.white)
                                .padding(.horizontal)
        
                        }//: HSTACK
                        Slider(value: $userTip, in: 5...50, step: 5)
                            .padding()
                    }//:VSTACK
                    
                    
                    
                    VStack{
                        HStack {
                            Text("Bill Amount")
                                .font(.title2)
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            Text("$\(userBill , specifier: "%.0f")")
                                .font(.title2)
                                .foregroundColor(Color.white)
                                .padding(.horizontal)
        
                        }//: HSTACK
                        
                        TextField("Enter bill amount here", value: $userBill, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }//:VSTACK
                    
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color("displayColor"))
                        .ignoresSafeArea()
                        .frame(width: .infinity, height: .infinity, alignment: .bottom)
                        .overlay(
                            
                            HStack(spacing: 40) {
                                VStack {
                                    Text("Tips:")
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    
                                    Text("$\( getTip(), specifier: "%.0f")")
                                        .padding(.top , 10)
                                        .font(.headline)
                                        .foregroundColor(Color.white)
                                    
                                }
               
                                VStack {
                                    Text("Total Per Person:")
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    
                                    Text("$\( numberOfPeopleBill(), specifier: "%.0f")")
                                        .padding(.top , 10)
                                        .font(.headline)
                                        .foregroundColor(Color.white)
                                    
                                }
                                
                                VStack {
                                    Text("Total:")
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    
                                    Text("$\( getTotal(), specifier: "%.0f")")
                                        .padding(.top , 10)
                                        .font(.headline)
                                        .foregroundColor(Color.white)
                                    
                                }
                            }
                        
                        )
                    
                }//:VSTACK
                .padding(.top , 50)
            }
            .navigationBarTitle("Tip Calculator")
            .navigationBarTitleDisplayMode(.inline)
        }//: ZSTACK
        
    }

    // Get Tip Amount
    func getTip() -> Double{
        
        return (userTip / 100) * userBill
    }

    // Get Number Of People Amount
    func numberOfPeopleBill() -> Double{

        var people = getTotal() / numberOfPeople
        
        if(people.isNaN)
        {
            people = 0
        }

        return people
    }
    
    // Get Total Amount
    func getTotal() -> Double{
        
        return getTip() + userBill
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView(userBill: 0, userTip: 0, numberOfPeople: 0)
.previewInterfaceOrientation(.portrait)
    }
}

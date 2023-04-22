//
//  BurnBallView.swift
//  BurnExample
//
//  Created by Anthony Harvey on 4/21/23.
//

import SwiftUI

struct BurnBallView: View {
    private enum Constants {
        static let exampleResultTextTop = "Your burn is so high!"
        static let exampleResultTextBottom = "Take care of yourself to get a better next result"
        static let examplePercentAmount = 87
    }
    var body: some View {
        VStack {
            ZStack {
                burnball
                burnballOverlay
            }.frame(height: (screenWidth / 1.5) * CGFloat(2) / 2.0)
            textAboutBurn
            Spacer()
        }
    }
}

struct BurnBallView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background
            BurnBallView()
        }
        
    }
}

extension BurnBallView {
    @ViewBuilder var textAboutBurn: some View {
        VStack {
            Text(Constants.exampleResultTextTop)
                .font(.title)
                .bold()
                .padding(.top)
                .padding(.bottom, 5)
            Text(Constants.exampleResultTextBottom)
        }
        .foregroundColor(.white)
    }
    
    @ViewBuilder var burnball: some View {
        Circle()
            .fill(RadialGradient(
                gradient: Gradient(colors: [.white.opacity(0.7), .burnball, .burnball]),
                center: .topLeading,
                startRadius: 0,
                endRadius: 450
            ))
            .blur(radius: 7)
            .frame(width: screenWidth / 2)
            .glow(.burnball, radius: 30)
    }
    
    @ViewBuilder var burnballOverlay: some View {
        ForEach(1..<3) { index in
            Circle().strokeBorder(lineWidth: 1)
                .foregroundColor(.gray.opacity(0.8))
                .frame(width: (screenWidth / 1.5) * CGFloat(index) / 2.0)
        }
        Text("\(Constants.examplePercentAmount)%")
            .font(.title)
            .foregroundColor(.white)
    }
}

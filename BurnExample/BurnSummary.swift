//
//  BurnSummary.swift
//  BurnExample
//
//  Created by Anthony Harvey on 4/21/23.
//

import SwiftUI

struct BurnSummary: View {
    private enum Constants {
        static let title = "BURN SUMMARY"
        static let symbolNameForExit = "xmark"
    }
    @State var showingBurnBall: Bool = true
    @Binding var showing: Bool
    
    var body: some View {
        ZStack {
            Color.background
            VStack {
                headlineWithExit
                progressBarRow
                burnBallOrLog
                    .edgesIgnoringSafeArea(.bottom)
            }.frame(width: screenWidth - doubleHorizontalPadding)
        }
    }
    
    func exit() {
        showing = false
    }
    
    func tapForward() {
        if showingBurnBall {
            showingBurnBall = false
        }
    }
}

struct BurnSummary_Previews: PreviewProvider {
    static var previews: some View {
        BurnSummary(showing: .constant(true))
    }
}

extension BurnSummary {
    @ViewBuilder var headlineWithExit: some View {
        ZStack {
            Text(Constants.title)
                .foregroundColor(.white)
                .bold()
            HStack {
                Spacer()
                exitButton
            }
        }.padding(.vertical)
            .foregroundColor(.white)
            .bold()
    }
    
    @ViewBuilder var exitButton: some View {
        Button {
            exit()
        } label: {
            Image(systemName: Constants.symbolNameForExit)
        }
    }
    
    @ViewBuilder var progressBarRow: some View {
        HStack {
            Rectangle()
                .foregroundColor(.progressBar)
            Rectangle()
                .foregroundColor(showingBurnBall ? .gray : .progressBar)
        }
        .foregroundColor(.progressBar)
        .frame(height: 3)
        .padding(.vertical)
    }
    
    @ViewBuilder var tapForwardOverlay: some View {
        Rectangle()
            .onTapGesture {
                tapForward()
            }.foregroundColor(.white.opacity(0.001))
    }
    
    @ViewBuilder var burnBallOrLog: some View {
        ZStack {
            if showingBurnBall {
                BurnBallView()
            } else {
                AddToJournalView(showingBurnSummary: $showing, skipAction: exit)
            }
            if showingBurnBall {
                tapForwardOverlay
            }
        }
    }
}

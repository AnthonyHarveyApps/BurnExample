//
//  ContentView.swift
//  BurnExample
//
//  Created by Anthony Harvey on 4/21/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State var plotItemSeries = [BurnReading.example1, BurnReading.example2, BurnReading.example3, BurnReading.example4, BurnReading.example5, BurnReading.example6]
    @State var showingBurnSummary: Bool = false
    private enum Constants {
        static let showBurnSummary = "Tap Here Show Burn Summary"
        static let sixAM = "6 AM"
        static let twelvePM = "12 PM"
        static let sixPM = "6 PM"
        static let high = "High"
        static let mid = "Mid"
        static let low = "Low"
    }
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text(Constants.showBurnSummary)
                    .foregroundColor(.white)
                    .padding()
                    .background(Capsule().foregroundColor(.burnball))
                    .onTapGesture {
                        showingBurnSummary = true
                    }
                Spacer()
                lineGraph
                Spacer()
            }
            if showingBurnSummary {
                BurnSummary(showing: $showingBurnSummary)
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    @ViewBuilder var lineGraph: some View {
        VStack {
            line
            timeOfDayRow
            legend
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.grayishBlue))
        .frame(width: screenWidth - doubleHorizontalPadding, height: 220)
    }
    
    @ViewBuilder var line: some View {
        Chart {
            ForEach(plotItemSeries, id: \.self) { plotItem in
                LineMark(x: .value("", plotItem.dateTime),
                         y: .value("", plotItem.percentBurned))
                .foregroundStyle(
                    .linearGradient(
                        colors: [.graphLightBlue, .graphYellow, .graphRed],
                        startPoint: .bottom,
                        endPoint: .top)
                )
            }
            .lineStyle(.init(lineWidth: 4))
            .symbol(.circle)
            .symbolSize(CGSize(width: 25, height: 25))
        }
        .chartYAxis {
            AxisMarks(values: .automatic) { _ in
                AxisGridLine(centered: true, stroke: StrokeStyle(lineWidth: 2, dash: [6,5]))
                    .foregroundStyle(Color.gray.opacity(0.4))
            }
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
    }
    
    @ViewBuilder var timeOfDayRow: some View {
        HStack {
            Text(Constants.sixAM)
            Spacer()
            Text(Constants.twelvePM)
            Spacer()
            Text(Constants.sixPM)
        }
        .foregroundColor(.white)
        .padding()
    }
    
    @ViewBuilder var legend: some View {
        HStack(spacing: 20) {
            legendEntry(text: Constants.high, color: .graphRed)
            legendEntry(text: Constants.mid, color: .graphYellow)
            legendEntry(text: Constants.low, color: .graphLightBlue)
            Spacer()
        }
    }
    @ViewBuilder func legendEntry(text: String, color: Color) -> some View {
        HStack(spacing: 5) {
            RoundedRectangle(cornerRadius: 1)
                .foregroundColor(color)
                .frame(width: 20, height: 4)
            Text(text)
                .foregroundColor(.white)
        }
    }
}

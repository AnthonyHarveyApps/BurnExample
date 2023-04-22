//
//  AddToJournalView.swift
//  BurnExample
//
//  Created by Anthony Harvey on 4/21/23.
//

import SwiftUI

struct AddToJournalView: View {
    private enum Constants{
        static let headline = "Let's login what you did today to understand what affected our burn"
        static let addToJournal = "ADD TO MY JOURNAL"
        static let skip = "SKIP"
    }
    @Binding var showingBurnSummary: Bool
    var skipAction: () -> Void
    @State var currentEntryType: JournalEntryType = .supplements
    @State var selectedJournalEntries: [String] = []
    var body: some View {
        VStack {
            headline
            typeSelector
            ScrollView {
                checkButtonsForSelectedType
            }
            Spacer()
            bottomButtons
        }
        .foregroundColor(.white)
    }
}

struct AddToJournalView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background
            AddToJournalView(showingBurnSummary: .constant(true), skipAction: {print("SkipAction")})
                .frame(width: screenWidth - doubleHorizontalPadding)
        }
    }
}

extension AddToJournalView {
    @ViewBuilder var headline: some View {
        Text(Constants.headline)
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder var typeSelector: some View {
        HStack {
            ForEach(JournalEntryType.allCases, id: \.rawValue) { type in
                Spacer()
                Text(type.rawValue.capitalized)
                    .bold()
                    .foregroundColor(type == currentEntryType ? .white : .gray)
                    .onTapGesture {
                        currentEntryType = type
                    }
                Spacer()
            }
        }.padding()
    }
    
    @ViewBuilder var checkButtonsForSelectedType: some View {
        VStack {
            ForEach(currentEntryType.optionsForType(), id: \.self) { option in
                checkItemButton(item: option)
            }
        }
    }
    
    @ViewBuilder var bottomButtons: some View {
        ZStack {
            VStack {
                addToJournalButton
                skipButton
            }
        }
        .padding(.vertical)
        .background(Rectangle().foregroundColor(.grayishBlue).frame(width: screenWidth))
    }
    
    @ViewBuilder var addToJournalButton: some View {
        Button {
            // TODO: method to save journal entries
            showingBurnSummary = false
        } label: {
            Text(Constants.addToJournal)
                .bold()
                .foregroundColor(.background)
                .background(RoundedRectangle(cornerRadius: 14, style: .continuous).foregroundColor(.buttonGreen).frame(width: screenWidth - doubleHorizontalPadding, height: 60))
            
        }
        .padding(.vertical)
    }
    
    @ViewBuilder var skipButton: some View {
        Button {
            showingBurnSummary = false
        } label: {
            Text(Constants.skip)
                .foregroundColor(.buttonGreen)
        }
        .padding(.vertical)
    }
    
    @ViewBuilder func checkItemButton(item: String) -> some View {
        Button {
            selectedJournalEntries.append(item)
        } label: {
            HStack {
                CheckBox(isChecked: selectedJournalEntries.contains(item))
                Text(item)
                Spacer()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.grayishBlue))
        }
    }
}

//
//  CheckBox.swift
//  BurnExample
//
//  Created by Anthony Harvey on 4/21/23.
//

import SwiftUI

struct CheckBox: View {
    private enum Constants{
        static let boxSymbolName = "square"
        static let checkSymbolName = "checkmark"
    }
    var isChecked: Bool
    var body: some View {
        ZStack {
            Image(systemName: Constants.boxSymbolName)
                .foregroundColor(.white)
                .font(.system(size: 30))
            if isChecked {
                Image(systemName: Constants.checkSymbolName)
                    .foregroundColor(.buttonGreen)
            }
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(isChecked: true)
    }
}

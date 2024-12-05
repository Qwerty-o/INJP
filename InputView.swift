//
//  InputView.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 1/29/24.
//

import SwiftUI
//input field
struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(.gray)
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField { //basically checking to see if it needs to block out the text
                SecureField(placeholder, text: $text)
                    .font(.system(size:14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size:14))
            }
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(" "), title: "Email Address", placeholder: "name")
    
}

//
//  PrologueView.swift
//  Gamemotion
//
//  Created by Htet Myat Moe Myint Kyeal on 21/02/23.
//

import SwiftUI

struct PrologueView: View {
    
    var body: some View {
    
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(
                    action: {
                        // write action
                        print("Skip Button is Clicked")
                    },
                    label: {
                        Image("SkipButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                )
                .padding()
                .frame(width: 80, height: 80)
            }
        }
        .background(
            Image("FearLBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }
}

struct PrologueView_Previews: PreviewProvider {
    static var previews: some View {
        PrologueView()
    }
}

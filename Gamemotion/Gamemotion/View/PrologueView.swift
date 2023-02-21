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
            Text("Gamemotion")
        }
        .background(
            Image("Prologue")
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

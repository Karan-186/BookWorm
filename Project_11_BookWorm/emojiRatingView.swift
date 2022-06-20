//
//  emojiRatingView.swift
//  Project_11_BookWorm
//
//  Created by KARAN  on 19/06/22.
//

import SwiftUI

struct emojiRatingView: View {
    
    let rating : Int16
    
    var body: some View {
        switch rating {
        case  1 :
            return  Text("😤")
        case  2 :
            return  Text("🥱")
        case  3 :
            return Text("😌")
        case  4 :
            return  Text("🤩")
        default :
            return  Text("🤯")
        
        }
    }
}

struct emojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        emojiRatingView(rating: 3)
    }
}

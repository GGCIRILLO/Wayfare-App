//
//  UIComponents.swift
//  testfoundation
//
//  Created by Giancarlo Brandi on 01/03/23.
//

import SwiftUI


struct FancyButton<Content: View> : View {
    var width : CGFloat = 120
    var height : CGFloat = 65
    @ViewBuilder var content : Content
    @State var disabled = false
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 17)
                .fill(disabled ? Color.gray.opacity(0.7) : Color.accentColor)
                .frame(width: width, height: height)
            HStack {
                content
            }
        }
        .font(.system(size: 20))
        .bold()
        .foregroundColor(disabled ? .white : .black)
        .animation(Animation.default.speed(2))
    }
    
    func disabled(state: Bool) -> Void {
        self.disabled = state
    }
}

struct FilterTag<Content: View> : View{
    @State var selected = false
    @ViewBuilder var content : Content
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 30)
            HStack {
                content
            }.foregroundColor(.accentColor)
        }
    }
}

struct testoProva : View {
    var body : some View {
        Text ("ciao")
    }
}



struct LocationMapAnnotationView_Preview:
    PreviewProvider {
    static var previews: some View {
        testoProva()
    }
}

struct VecchieStars: View {
    var amount : Float = 0

    var body : some View {
        HStack(spacing: -10) {
            ForEach(buildStars(), id: \.self) { fill in
                ZStack {
                    Rectangle()
                        .mask(
                            Image(systemName: "star")
                                .font(.system(size: 20))
                                .foregroundColor(.red)
                        )
                        .frame(width: 39, height: 39)
                    GeometryReader { metrics in
                        Rectangle()
                            .frame(width: metrics.size.width*CGFloat(fill))
                    }.mask(
                        Image(systemName: "star.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.red)

                    )
                    .frame(width: 35, height: 35)
                }
            }
        }
    }

    //non ho idea di cosa ho creato
    func buildStars() -> [Float] {
        var iconStatus : [Float] = []
        var amount2 = amount>5 ? 5 : amount
        while amount2 > 0 {
            let xxx = amount2>=1 ? 1 : amount2
            iconStatus.append(xxx)
            amount2 -= xxx
        }
        if iconStatus.count < 5 {
            for _ in 0...(4-iconStatus.count) {
                iconStatus.append(0)
            }
        }
        return iconStatus
    }
}

struct Stars : View {
    var amount : Float = 0
    var body : some View {
        HStack {
            ForEach(0..<Int(amount)) {_ in
                Image(systemName: "star.fill")
            }
            ForEach(0..<Int(5-amount)) {_ in
                Image(systemName: "star")
            }
        }
    }
}

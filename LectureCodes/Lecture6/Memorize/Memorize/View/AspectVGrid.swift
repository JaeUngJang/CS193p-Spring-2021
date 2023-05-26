//
//  AspectVGrid.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/25.
//

import SwiftUI

// Item : "don't card"
//   만약 받을 item 인자를 "don't care"으로 만들고 싶다면
//   add <Item> right next to struct AspectVGrid
//   like <CardContent> in MemoryGame
// ItemView : "somewhat cares"
//   add <ItemView>
//   ItemView에 약간의 제약이 있다면 where 사용
struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable {
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let width: CGFloat = widthThatFits(itemCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
                LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
                    ForEach(items) { item in
                        content(item).aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
                Spacer(minLength: 0)
            }
        }
    }
    
    /// GridItem 측면 spacing을 0으로 만들어줌
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
     }
    
    /// 한 화면에 모든 Item을 보여주기 위해 필요한 Item의 가로 길이를 계산해주는 func
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        
        // aspectRatio는 카드의 비율 (2/3 : 가로/세로)
        
        // 이대로 return이면 세로 한 줄로 쭉 나열
        var columnCount = 1
        var rowCount = itemCount
        
        repeat {
            
            // 전체 View 가로 / 기둥 갯수
            // 일단 가로 길이 = View의 가로 길이 / columnCount
            let itemWidth = size.width / CGFloat(columnCount)
            // aspectRatio에 따라 세로 길이 수정
            let itemHeight = itemWidth / itemAspectRatio
            
            // 행 갯수 * 카드 높이 < geometry.size.height 면 그만!!!
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            
            // 행 갯수 * 카드 높이 > geometry.size.height 이라면 column 추가
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        
        return floor(size.width / CGFloat(columnCount))
    }
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}

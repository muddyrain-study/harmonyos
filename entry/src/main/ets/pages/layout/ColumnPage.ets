@Entry
@Component
struct ColumnPage {

  build() {
    Column({
      space: 15
    }){
      Row(){
        Text('1')
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .height('100%')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width(150)
      .height(150)
      .backgroundColor(Color.Blue)
      .displayPriority(2)
      Row(){
        Text('2')
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .height('100%')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width(150)
      .height(150)
      .backgroundColor(Color.Orange)
      .displayPriority(2)
      Row(){
        Text('3')
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .height('100%')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width(150)
      .height(150)
      .backgroundColor(Color.Pink)
      .displayPriority(1)
      Row(){
        Text('4')
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .height('100%')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width(150)
      .height(150)
      .backgroundColor(Color.Green)
      .displayPriority(1)

    }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(HorizontalAlign.Center)
      .border({
        color: Color.Red,
        width: 1
      })
  }
}
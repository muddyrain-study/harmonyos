@Entry
@Component
struct RowPage {
  @State message: string = 'Hello World';

  build() {
    Row({
      space: 15
    }) {
      Column() {
        Text('1')
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .height('100%')
      }
      .width(100)
      .height(100)
      .backgroundColor(Color.Blue)

      Column() {
        Text('2')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .height('100%')
      }
      // .width(100)
      .height(100)
      .layoutWeight(1)
      .backgroundColor(Color.Orange)

      Column() {
        Text('3')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .height('100%')
      }
      // .width(100)
      .height(100)
      .layoutWeight(1)
      .backgroundColor(Color.Pink)

      Column() {
        Text('4')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .height('100%')
      }
      .width(100)
      .height(100)
      .backgroundColor(Color.Green)
    }
    .border({
      color: 'red',
      width: 1
    })
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
  }
}
@Entry
@Component
struct ScrollPage {

  build() {
   Scroll(){
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
       .width(200)
       .height(200)
       .backgroundColor(Color.Blue)
       Row(){
         Text('2')
           .fontSize(20)
           .fontColor(Color.White)
           .fontWeight(FontWeight.Bold)
           .height('100%')
           .width('100%')
           .textAlign(TextAlign.Center)
       }
       .width(200)
       .height(200)
       .backgroundColor(Color.Orange)
       Row(){
         Text('3')
           .fontSize(20)
           .fontColor(Color.White)
           .fontWeight(FontWeight.Bold)
           .height('100%')
           .width('100%')
           .textAlign(TextAlign.Center)
       }
       .width(200)
       .height(200)
       .backgroundColor(Color.Pink)
       Row(){
         Text('4')
           .fontSize(20)
           .fontColor(Color.White)
           .fontWeight(FontWeight.Bold)
           .height('100%')
           .width('100%')
           .textAlign(TextAlign.Center)
       }
       .width(200)
       .height(200)
       .backgroundColor(Color.Green)

       Row(){
         Text('5')
           .fontSize(20)
           .fontColor(Color.White)
           .fontWeight(FontWeight.Bold)
           .height('100%')
           .width('100%')
           .textAlign(TextAlign.Center)
       }
       .width(200)
       .height(200)
       .backgroundColor(Color.Red)
     }
     .width('100%')
     // .height('100%')
     .justifyContent(FlexAlign.SpaceBetween)
     .alignItems(HorizontalAlign.Center)
     .border({
       color: Color.Red,
       width: 1
     })
   }
   .scrollable(ScrollDirection.Vertical)
   .edgeEffect(EdgeEffect.Spring)
   .scrollBarWidth(10)
   .scrollBarColor(Color.Red)
  }
}
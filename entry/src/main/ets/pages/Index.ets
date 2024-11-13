import { str } from '../common/Test';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State num: number = 0;
  handleClick = () => {
    this.message = '哈哈哈'
    this.num++
    console.log('click')
    console.log(str)
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Image($r("app.media.1")).width(200).height(200).objectFit(ImageFit.Contain)
        Text(this.message + this.num).fontSize(50).fontWeight(FontWeight.Bold).border({
          width:2,
          style:BorderStyle.Dashed,
          color:Color.Green,
          radius: 5
        })
        Button('点击').onClick(this.handleClick).width($r('app.float.button_width'))
        TestComp()
      }
      .width('100%')
      .backgroundColor(Color.Gray)
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct TestComp {
  build() {
    Row({ space: 20 }) {
      Text('自定义').fontSize(20).fontWeight(FontWeight.Bold)
      Text('自定义').fontSize(20).fontWeight(FontWeight.Bold)
    }
  }
}
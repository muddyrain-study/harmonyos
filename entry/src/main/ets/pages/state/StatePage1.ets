import { promptAction } from '@kit.ArkUI'

@Extend(Text)
function textStyle(fontSize: ResourceStr) {
  .fontSize(fontSize)
  .fontWeight(FontWeight.Bold)
}

@Entry
@Component
struct StatePage1 {
  @State counter: number = 1
  @State fontSize: ResourceStr = '34'
  build() {
    Column({
      space: 20
    }) {
      Text('Counter Parent')
        .textStyle(this.fontSize)

      Text(this.counter.toString())
        .textStyle(this.fontSize)

      Button('改变字体大小')
        .onClick(() => {
          this.fontSize = '50'
        })
      Button('点击增加')
        .onClick(() => {
          this.counter++
          promptAction.showToast({
            message: '点击增加' + this.counter,
            duration: 2000
          })
        })

      Divider()

      CounterChildComp({
        counter: this.counter
      })

      Divider()
      CounterChildBuilder({
        counter: this.counter
      })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct CounterChildComp {
  @Prop counter: number = 100
  build() {
    Column({
      space: 20
    }) {
      Text('Counter Child')
        .textStyle('34')

      Text(this.counter.toString())
        .textStyle('34')

      Button('点击增加')
        .onClick(() => {
          this.counter++
          promptAction.showToast({
            message: 'Child点击增加' + this.counter,
            duration: 2000
          })
        })
    }
  }
}

@Builder
function CounterChildBuilder(counterObj :CounterObject) {
  Column({
    space: 20
  }) {
    Text('Counter builder Child')
      .textStyle('34')

    Text(counterObj.counter.toString())
      .textStyle('34')
  }
}

class CounterObject{
  counter: number = 0
}





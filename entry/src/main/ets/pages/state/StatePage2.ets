import { promptAction } from '@kit.ArkUI'

@Extend(Text)
function textStyle(fontSize: ResourceStr) {
  .fontSize(fontSize)
  .fontWeight(FontWeight.Bold)
}

@Entry
@Component
struct StatePage2 {
  @Provide("counter") counter: number = 1
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

      CounterChildComp2()
    }
    .height('100%')
    .width('100%')
  }
}
@Component
struct CounterChildComp {
  @Prop counter: number
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

      Divider()
    }
  }
}

@Component
struct CounterChildComp2 {
  build() {
    Column({
      space: 20
    }) {
      Text('Counter Child')
        .textStyle('34')

      Text('100')
        .textStyle('34')


      Divider()

      CounterGrandChildComp()
    }
  }
}

@Component
struct CounterGrandChildComp {
  @Consume("counter") count: number
  build() {
    Column({
      space: 20
    }) {
      Text('Counter Grand Child')
        .textStyle('34')

      Text(this.count.toString())
        .textStyle('34')

      Button('点击增加')
        .onClick(() => {
          this.count++
          promptAction.showToast({
            message: 'Child点击增加' + this.count,
            duration: 2000
          })
        })
    }
  }
}



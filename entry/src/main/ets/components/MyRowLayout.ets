import CommonConstants from "./constant/CommonConstant"

@Component
export struct MyRowLayout {
  build() {
    Row(){
      Column(){}
      .height(CommonConstants.LIKELY_LENGTH)
      .width(CommonConstants.LIKELY_LENGTH)
      .backgroundColor(Color.Brown)

      Column(){}
      .height(CommonConstants.LIKELY_LENGTH)
      .width(CommonConstants.LIKELY_LENGTH)
      .backgroundColor(Color.Blue)

      Column(){}
      .height(CommonConstants.LIKELY_LENGTH)
      .width(CommonConstants.LIKELY_LENGTH)
      .backgroundColor(Color.Gray)
    }
  }
}

@Entry
@Component
struct FlexPage {
  @State message: string = 'Hello World';

  build() {
    Flex({
      direction: FlexDirection.Row,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center,
      wrap: FlexWrap.Wrap,
    }) {
        Row(){}.width(100).height(100).backgroundColor(Color.Blue)
        Row(){}.width(100).height(100).backgroundColor(Color.Orange).flexBasis(150)
        Row(){}.width(100).height(100).backgroundColor(Color.Pink)
        Row(){}.width(100).height(100).backgroundColor(Color.Green)
    }.height('100%').width('100%')
  }
}
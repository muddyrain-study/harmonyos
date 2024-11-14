@Entry
@Component
struct UserInfoPage {
  @State user: UserInfo =
    new UserInfo(1, '张三', '12345678901', $r('app.media.1'), new Address('广东', new City('深圳', '南山', '科技园')))
  @State title_name: string = '用户信息'
  @State isShowAvatar: boolean = true

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text(this.title_name)
          .fontSize(36)
          .fontWeight(FontWeight.Bold)
          .margin({
            bottom: 20
          })

        Text(JSON.stringify(this.user))
        Text(Object.keys(this.user).join(', '))

        Row({ space: 12 }) {
          Text('标题名：')
            .width(100)
            .fontSize(18)
            .textAlign(TextAlign.End)
          TextInput({
            text: $$this.title_name
          })
            .padding({
              left: 20
            })
            .layoutWeight(1)
            .borderRadius(10)
        }.width('95%')

        Row({ space: 12 }) {
          Text('头像：')
            .width(100)
            .fontSize(18)
            .textAlign(TextAlign.End)
          Row() {
            Image(this.user.avatar)
              .width(100)
              .height(100)
              .borderRadius(50)
              .objectFit(ImageFit.Cover)
          }.layoutWeight(1)
          .visibility(this.isShowAvatar ? Visibility.Visible : Visibility.None)
          .animation({
            duration: 1000,
            curve: Curve.Linear
          })

          Toggle({ type: ToggleType.Switch,isOn: this.isShowAvatar })
            .width(100)
            .height(50)
            .onChange((isOn) => {
              this.isShowAvatar = isOn
            })
        }

        Button('头像是否显示').onClick(() => {
          this.isShowAvatar = !this.isShowAvatar
        })

        Row({ space: 12 }) {
          Text('编号：')
            .width(100)
            .fontSize(18)
            .textAlign(TextAlign.End)
          TextInput({
            text: (this.user.id).toString()
          })
            .padding({
              left: 20
            })
            .layoutWeight(1)
            .borderRadius(10)
        }.width('95%')

        Row({ space: 12 }) {
          Text('用户名：')
            .width(100)
            .fontSize(18)
            .textAlign(TextAlign.End)
          TextInput({
            text: this.user.name
          })
            .padding({
              left: 20
            })
            .layoutWeight(1)
            .borderRadius(10)
        }.width('95%')

        Row({ space: 12 }) {
          Text('电话：')
            .width(100)
            .fontSize(18)
            .textAlign(TextAlign.End)
          TextInput({
            text: this.user.tel
          })
            .padding({
              left: 20
            })
            .layoutWeight(1)
            .borderRadius(10)
        }.width('95%')

        // Row({ space: 12 }) {
        //   Text('地址：')
        //     .width(100)
        //     .fontSize(18)
        //     .textAlign(TextAlign.End)
        //   TextInput({
        //     text: this.user.address.province
        //   })
        //     .padding({
        //       left: 20
        //     })
        //     .layoutWeight(1)
        //     .borderRadius(10)
        //   TextInput({
        //     text: this.user.address.city
        //   })
        //     .padding({
        //       left: 20
        //     })
        //     .layoutWeight(1)
        //     .borderRadius(10)
        // }.width('95%')
        AddressComp({
          address: this.user.address,
          city: this.user.address.city
        })
        Button('显示 Log')
          .onClick(() => {
            console.log(JSON.stringify(this.user))
          })
      }
      .width('100%')

    }
    .scrollable(ScrollDirection.Vertical)
  }
}

@Component
struct AddressComp {
  @ObjectLink address: Address
  @ObjectLink city: City

  build() {
    Column({
      space: 12
    }) {
      Row({ space: 12 }) {
        Text('地址：')
          .width(100)
          .fontSize(18)
          .textAlign(TextAlign.End)
        TextInput({
          text: this.address.province
        })
          .padding({
            left: 20
          })
          .layoutWeight(1)
          .borderRadius(10)
        TextInput({
          text: this.city.name
        })
          .padding({
            left: 20
          })
          .layoutWeight(1)
          .borderRadius(10)
      }.width('95%')

      Row({ space: 12 }) {
        Text('区域：')
          .width(100)
          .fontSize(18)
          .textAlign(TextAlign.End)
        TextInput({
          text: this.city.district
        })
          .padding({
            left: 20
          })
          .layoutWeight(1)
          .borderRadius(10)
        TextInput({
          text: this.city.street
        })
          .padding({
            left: 20
          })
          .layoutWeight(1)
          .borderRadius(10)
      }.width('95%')

      Row({ space: 12 }) {
        Button('修改省份').onClick(() => {
          this.address.province = '浙江'
        })
        Button('修改城市').onClick(() => {
          this.city.name = '杭州'
        })
      }.width('95%').justifyContent(FlexAlign.Center)

      Row({ space: 12 }) {
        Button('修改区域').onClick(() => {
          this.city.district = '西湖区'
        })
        Button('修改街道').onClick(() => {
          this.city.street = '西湖'
        })
      }.width('95%').justifyContent(FlexAlign.Center)
    }
  }
}

class UserInfo {
  id: number
  name: string
  tel: string
  avatar: ResourceStr
  address: Address

  constructor(id: number, name: string, tel: string, avatar: ResourceStr, address: Address) {
    this.id = id
    this.name = name
    this.tel = tel
    this.avatar = avatar
    this.address = address
  }
}

@Observed
class Address {
  province: string
  city: City

  constructor(province: string, city: City) {
    this.province = province
    this.city = city
  }
}

@Observed
class City {
  name: string
  district: string
  street: string

  constructor(name: string, district: string, street: string) {
    this.name = name
    this.district = district
    this.street = street
  }
}
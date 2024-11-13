import CommonConstants from '../components/constant/CommonConstant';

@Extend(Text)
function blueButtonTextStyle() {
  .fontColor('#367bf6')
  .fontSize(14)
  .fontWeight(FontWeight.Bold)
}

@Extend(TextInput)
function inputStyle(type: InputType, onChange: (value: string) => void) {
  .type(type)
  .placeholderColor("#707578")
  .height(50)
  .fontSize(18)
  .backgroundColor("#f1f3f5")
  .borderRadius(10)
  .onChange(onChange)
}

@Entry
@Component
struct LoginPage {
  @State userName: string = '';
  @State passWord: string = '';

  @Styles
  loginButton(){
    .width("90%")
    .height(50)
    .backgroundColor("#367bf6")
  }

  @Builder
  ImageButton(src: ResourceStr){
    Button({ type: ButtonType.Circle }) {
      Image(src)
        .fillColor('#71767f')

    }
    .width(48)
    .height(48)
    .backgroundColor("#f1f3f5")
  }

  build() {
    Column() {
      Image($r("app.media.1")).width(75).height(75).margin({
        top: 100,
        bottom: 50
      })

      Column({ space: 20 }) {
        TextInput({
          text: this.userName,
          placeholder: "请输入用户名"
        })
          .inputStyle(InputType.Normal, value => {
            this.userName = value
          })

        TextInput({
          text: this.passWord,
          placeholder: "请输入密码"
        })
          .inputStyle(InputType.Password, value => {
            this.passWord = value
          })
      }.width('95%')

      Row() {
        Text('短信验证码登录')
          .blueButtonTextStyle()
        Text('忘记密码')
          .blueButtonTextStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding(12)
      .margin({
        top: 12,
      })

      Button($r("app.string.Login_label"), {
        type: ButtonType.Capsule,
      })
        .onClick(() => {
          console.log('userName', this.userName)
          console.log('passWord', this.passWord)
        })
        .loginButton()
        .margin({
          top: 85,
          bottom: 12
        })

      Text("注册账号")

        .fontColor("#367bf6")
      Blank()

      Text("其他登录方式")
        .fontColor("#888888")
        .fontSize(12)
        .margin({
          top: 50,
          bottom: 12
        })
      Row({ space: 20 }) {
        this.ImageButton($r('app.media.ic_qq'))
        this.ImageButton($r('app.media.ic_wechat'))
        this.ImageButton($r('app.media.ic_weibo'))
      }
      // OtherButton()
    }
    .height(CommonConstants.FULL_LENGTH)
    .width(CommonConstants.FULL_LENGTH)
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct OtherButton {
  build() {
    Row({ space: 20 }) {
      Button({ type: ButtonType.Circle }) {
        Image($r('app.media.ic_qq'))
          .fillColor('#71767f')

      }
      .width(48)
      .height(48)
      .backgroundColor("#f1f3f5")

      Button({ type: ButtonType.Circle }) {
        Image($r('app.media.ic_wechat'))
          .fillColor('#71767f')

      }
      .width(48)
      .height(48)
      .backgroundColor("#f1f3f5")

      Button({ type: ButtonType.Circle }) {
        Image($r('app.media.ic_weibo'))
          .fillColor('#71767f')

      }
      .width(48)
      .height(48)
      .backgroundColor("#f1f3f5")
    }
  }
}
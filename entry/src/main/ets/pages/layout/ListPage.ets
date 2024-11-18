@Entry
@Component
struct ListPage {
  @State users: User[] = [
    { id: 1, name: '张三', gender: '男' },
    { id: 2, name: '李四', gender: '女' },
    { id: 3, name: '王五', gender: '男' },
    { id: 4, name: '王六', gender: '女' },
    { id: 5, name: '王七', gender: '女' },
    { id: 6, name: '王八', gender: '男' },
    { id: 7, name: '王九', gender: '女' },
    { id: 8, name: '王8', gender: '女' },
    { id: 9, name: '王9', gender: '女' },
    { id: 10, name: '王10', gender: '女' },
    { id: 11, name: '王11', gender: '女' },
  ]

  @Builder itemEnd(user: User) {
    Button('关闭').onClick(() => {
      this.users = this.users.filter(u => u.id !== user.id)
    })
  }
  @Builder groupHeader(header:string) {
    Text(header)
      .width('100%')
      .fontSize(24)
      .fontWeight('bold')
      .padding(8)
      .backgroundColor('#f0f0f0')
      .margin({
        bottom:8
      })
  }

  build() {
    Column() {
      List({
        space: 12
      }) {
        ListItemGroup({
          header: this.groupHeader('男')
        }){
          ForEach(this.users.filter(u => u.gender ==='男'), (user: User) => {
            ListItem() {
              Row({ space: 12 }) {
                Row()
                  .width(20)
                  .height(20)
                  .backgroundColor(user.gender === '男' ? 'blue' : 'red')
                Text(user.name)
                  .layoutWeight(1)
                  .fontSize(36)
              }
              .padding(12)
            }
            .height(80)
            .width('100%')
            .backgroundColor('#efefef')
            .borderRadius(12)
            .swipeAction({
              end: this.itemEnd(user)
            })
          }, (user: User) => {
            return user.id.toString()
          })
        }.backgroundColor('#0f0').padding(12)
        .divider({
          strokeWidth:2,
          color:'blue'
        })
        ListItemGroup({
          header: this.groupHeader('女')
        }){
          ForEach(this.users.filter(u => u.gender ==='女'), (user: User) => {
            ListItem() {
              Row({ space: 12 }) {
                Row()
                  .width(20)
                  .height(20)
                  .backgroundColor(user.gender === '男' ? 'blue' : 'red')
                Text(user.name)
                  .layoutWeight(1)
                  .fontSize(36)
              }
              .padding(12)
            }
            .height(80)
            .width('100%')
            .backgroundColor('#efefef')
            .borderRadius(12)
            .swipeAction({
              end: this.itemEnd(user)
            })
          }, (user: User) => {
            return user.id.toString()
          })
        }.backgroundColor('#0ff').padding(12)
      }
      .width('100%')
      .divider({
        strokeWidth:2,
        color:'red'
      })
    }
    .width('100%')
    .padding(10)
  }
}

class User {
  id: number = 1;
  name: string = ''
  gender: '男' | '女' = '男'
}
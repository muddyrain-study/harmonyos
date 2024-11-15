@Entry
@Component
struct ForEachPage {
  @State hobby: String[] = ["阅读", "写作", "运动", "运动", "学习",];
  @State  @Watch("onBookChange") books: Book[] = [
    new Book(1, 'Java', 100),
    new Book(2, 'Kotlin', 200),
    new Book(3, 'Swift', 300),
    new Book(4, 'Dart', 400),
    new Book(5, 'JavaScript', 500),
  ]
  @State total: number = this.getTotalPrice()

  getTotalPrice() {
    return this.books.reduce((total, book) => total + book.price, 0)
  }

  onBookChange() {
   this.total = this.getTotalPrice()
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        ForEach(this.hobby, (item: string, index: number) => {
          Text(item)
        }, (item: string, index: number) => {
          return item + index
        })
        Button('修改')
          .onClick(() => {
            // this.hobby.push('游戏')
            // this.hobby[2] = '摄影'
            this.hobby.splice(1, 1)
          })
          .width('100%')

        ForEach(this.books, (item: Book) => {
          BookText({ book: item })
        }, (item: Book) => {
            return item.id.toString()
          })

        Row({ space: 12 }) {
          Text('总价：')
          Text(this.total + '元')
        }

        Button('修改图书')
          .onClick(() => {
            // this.books[2].name = 'Python'
            this.books.push(new Book(this.books.length + 1, 'Python', Math.floor(Math.random() * 1000)))
          })
          .width('100%')
        Button('修改图书价格')
          .onClick(() => {
            this.books[2].price = 500
            this.total = this.getTotalPrice()
            // this.books[0] = new Book(1, 'GoLang', 500)
          })
          .width('100%')
        Button('删除图书')
          .onClick(() => {
            this.books.splice(0,1)
          })
          .width('100%')
      }
      .width('100%')
    }
    .scrollable(ScrollDirection.Vertical)
  }
}

@Component
struct BookText {
  @Prop book: Book

  build() {
    Row({ space: 12 }) {
      Text(this.book.id.toString())
      Text(this.book.name)
      Text(this.book.price.toString())
    }
  }
}

@Observed
class Book {
  id: number
  name: string
  price: number

  constructor(id: number, name: string, price: number) {
    this.id = id
    this.name = name
    this.price = price
  }
}
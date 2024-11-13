@Entry
@Component
struct TodoListPage {
  @State message: string = '待办事项';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      TodoItemBuilder(new Todo(1, '学习编程', true))
      TodoItemBuilder(new Todo(2, '练习 Rap', false))
      TodoItemComp({
        todo: new Todo(3, '学习编程', true)
      })
    }
    .height('100%')
    .width('100%')
    .padding(15)
  }
}

@Builder
function TodoItemBuilder(todo: Todo) {
  Row() {
    Image(todo.isDone ? $r('app.media.ic_ok') : $r('app.media.ic_default'))
      .width(20)
      .height(20)
      .margin(20)
    Text(todo.text)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .fontColor(todo.isDone ? Color.Green : Color.Black)
      .decoration({
        type: todo.isDone ? TextDecorationType.LineThrough : TextDecorationType.None
      })
  }
  .width('100%')
}

@Component
struct TodoItemComp {
  todo: Todo = new Todo(0, '', false)

  build() {
    Row() {
      Image(this.todo.isDone ? $r('app.media.ic_ok') : $r('app.media.ic_default'))
        .width(20)
        .height(20)
        .margin(20)
      Text(this.todo.text)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.todo.isDone ? Color.Green : Color.Black)
        .decoration({
          type: this.todo.isDone ? TextDecorationType.LineThrough : TextDecorationType.None
        })
    }
    .width('100%')
  }
}

class Todo {
  id: number
  text: string
  isDone: boolean

  constructor(id: number, text: string, isDone: boolean) {
    this.id = id
    this.text = text
    this.isDone = isDone
  }
}
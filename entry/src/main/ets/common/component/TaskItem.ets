import { Task } from './Task'

@Component
export struct TaskItem {
  @ObjectLink item: Task

  //方法传递
  onTaskChange: () => void

  build() {
    Row() {
      Text(this.item.name)
        .decoration({ type: this.item.finished ? TextDecorationType.LineThrough : TextDecorationType.None })
        .fontColor(this.item.finished ? '#b1b1b1' : '#000')
      Checkbox().select(this.item.finished).onChange((val) => {
        this.item.finished = val
        this.onTaskChange()
        // this.progressChange()
      })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(20)
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(15)
    .shadow({ radius: 6, color: '#1f000000', offsetX: 1, offsetY: 4 })
  }
}
@Component
export struct TaskProgressTip {
  @Prop finishTask: number
  @Prop totalTask: number

  build() {
    Row() {
      Text('任务进度： ')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Stack() {
        Progress({
          value: this.finishTask,
          total: this.totalTask,
          type: ProgressType.Ring
        }).width(100)
        Row() {
          Text(this.finishTask.toFixed(0))
          Text(" / " + this.totalTask.toFixed(0))
        }
      }
    }
    .width('95%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(15)
    .shadow({ radius: 6, color: '#1f000000', offsetX: 2, offsetY: 4 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}


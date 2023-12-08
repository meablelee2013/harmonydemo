import { Task } from './Task'
import { TaskItem } from './TaskItem'


@Component
export struct TaskList {
  @Link totalTask: number
  @Link finishTask: number
  @Link tasks: Task[]

  build() {
    Column({ space: 5 }) {
      Button('新增任务').width(150)
        .onClick(() => {
          this.tasks.push(new Task())
          this.progressChange()
        })

      List({ space: 5 }) {
        ForEach(this.tasks, (item: Task, index: number) => {
          ListItem() {
            //方法一
            // TaskItem({ item: item, onTaskChange: () => {
            //   this.progressChange()
            // } })
            //上面的方法也可以
            //方法二
            //下面的这个也可以，为什么要调用bind(this),是因为在子组件的TaskItem里调用progressChange时，里面调用this时的
            //上下文变化了，所以需要把父组件的this传给子组件
            TaskItem({ item: item, onTaskChange: this.progressChange.bind(this) })
          }.swipeAction({
            end: this.DeleteButton(index)
          })
        }, item => JSON.stringify(item))
      }.width('95%')

    }
  }

  @Builder DeleteButton(index: number) {
    Button() {
      Image($r('app.media.ic_public_list_deleted'))
        .width(40)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.White)
    .onClick(() => {
      this.tasks.splice(index, 1)
      this.progressChange()
    })
    .margin(5)
  }

  progressChange() {
    this.totalTask = this.tasks.length
    this.finishTask = this.tasks.filter((item) => item.finished).length
  }
}

@Extend(Text) function finishedTask() {
  .decoration({ type: TextDecorationType.LineThrough })
  .fontColor(('#b1b1b1'))
}



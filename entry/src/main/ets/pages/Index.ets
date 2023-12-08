import { TaskProgressTip } from '../common/component/TaskProgressTip'
import { Task } from '../common/component/Task'
import { TaskList } from '../common/component/TaskList'

@Entry
@Component
struct Index {
  @State totalTask: number = 0
  @State finishTask: number = 0
  @State tasks: Task[] = []

  build() {

    Column({ space: 10 }) {

      TaskProgressTip({ totalTask: this.totalTask, finishTask: this.finishTask })

      TaskList({ totalTask: $totalTask, finishTask: $finishTask, tasks: $tasks })

    }.width('100%')
    .backgroundColor('#ffd6cfcf')
    .height('100%')

  }
}






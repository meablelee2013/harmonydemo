/**
 * 嵌套对象里对象里的元素的值发生变更需要页面重绘，此时就要用到@Observed 和@ObjectLink
 *
 * 而当开发者只想针对父组件中某个数据对象的部分信息进行同步时，使用@Link就不能满足要求。
 * 如果这些部分信息是一个类对象，就可以使用@ObjectLink配合@Observed来实现，如下图所示。
 */


@Observed
export class Task {
  id: number
  private name: string
  finished: boolean = false

  constructor(id: number) {
    this.id = id
  }

  getName(): string {
    return `任务 ${this.id}`
  }
}
@Entry
@Component
struct RichEditorTest02 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column(){
      RichEditor(this.options)
        .placeholder('和你喜欢的人聊天吧...')
        .onWillChange((value: RichEditorChangeValue) => {
          return true
        })
        .borderWidth(1)
        .borderColor(Color.Green)
        .width("100%")
        .height('30%')

      Button('addImg')
        .fontSize(12)
        .onClick(() => {
          this.controller.addImageSpan($r('app.media.app_icon'), {
            imageStyle: {
              size: ["60px", "60px"],
              verticalAlign: ImageSpanAlignment.CENTER
            }
          })
        })
    }
  }
}
import { EmojiData } from '../model/EmojiData';
import { EmojiUtil } from '../util/EmojiUtil';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State msg: Resource | undefined = undefined;
  emojiData: EmojiData = new EmojiData()

  aboutToAppear(): void {
    if (this.emojiData.emojiMap.hasKey('[笑脸]')) {
      this.msg = this.emojiData.emojiMap.get('[笑脸]')
    }

    let str = "1234[笑脸][酷]456[哭]789"
    let regex = /(\[[^\]]+\])/;

    const strArray = str.split(regex).filter(part => part !== '');
    strArray.forEach(item => {
      console.log('strArray: ' + item)
    })

    console.log('deleteResult: ' + EmojiUtil.handleDeleteStr(str, 4, 7))

  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}
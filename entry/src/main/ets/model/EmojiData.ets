import { HashMap } from '@kit.ArkTS'

export class EmojiModel {

}

export class EmojiData {
  emojiMap: HashMap<string, Resource> = new HashMap();

  constructor() {
    this.emojiMap.set('[笑脸]', $r('app.media.app_icon'))
  }
}
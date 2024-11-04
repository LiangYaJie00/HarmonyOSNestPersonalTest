class EmojiData {
  emojiMap: Map<string, boolean>;

  constructor() {
    this.emojiMap = new Map([
      ['[笑脸]', true],
      ['[哭]', true],
      ['[酷]', true],
      ['[大笑]', true],
    // 可以在这里添加更多的表情
    ]);
  }

  hasKey(key: string): boolean {
    return this.emojiMap.has(key);
  }
}

export class EmojiUtil {

  // 处理字符串，将其中被[]包裹的表情拆分出来
  public static handleStr(str: string): string[] {
    let regex = /(\[[^\]]+\])/;
    return str.split(regex).filter(part => part !== '');
  }

  // 判断[]包裹的字符串是否是表情
  public static isEmoji(str: string): boolean {
    if (str.length < 2) {
      return false;
    }
    return str.startsWith('[') && str.endsWith(']') && new EmojiData().hasKey(str);
  }

  // 将字符串转化为包含表情的数组（如：str = '1234[笑脸][酷]456[哭]789'， 函数返回结果为[1,2,3,4,'[笑脸]','[酷]',4,5,6,'[哭]',7,8,9]）
  public static convertStrToEmojiArray(str: string): string[] {
    const strArray = EmojiUtil.handleStr(str);
    let emojiStrArray: string[] = [];
    strArray.forEach((value: string) => {
      if (EmojiUtil.isEmoji(value)) {
        emojiStrArray.push(value);
      } else {
        const array = value.split('') as string[];
        array.forEach((char: string) => {
          emojiStrArray.push(char);
        })
      }
    })
    return emojiStrArray;
  }

  /**
   * 处理MsgActionBar删除输入内容时的字符串处理
   * @param content 编辑框中的内容
   * @param len 删除长度
   * @param offset 删除位置的索引
   * @returns
   */
  public static handleDeleteStr(content:string, len: number, offset: number): string {
    const emojiStrArray = EmojiUtil.convertStrToEmojiArray(content);

    emojiStrArray.splice(offset - len + 1, len)

    return emojiStrArray.join('')
  }

}
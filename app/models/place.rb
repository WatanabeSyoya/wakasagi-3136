class Place < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '金山' },
    { id: 3, name: '早稲沢' },
    { id: 4, name: '桧原本村' },
    { id: 5, name: '堂場岬' },
    { id: 6, name: '馬の首' },
    { id: 7, name: '野鳥の森新橋下' },
    { id: 8, name: '孤鷹森' },
    { id: 9, name: '中之島' },
    { id: 10, name: '細野' },
    { id: 11, name: '月島' },
    { id: 12, name: '白樺' },
    { id: 13, name: 'いかり潟' },
    { id: 14, name: 'ホテル下' },
    { id: 15, name: 'いかり肩' },
    { id: 16, name: '大石' },
    { id: 17, name: 'G目黒前' },
    { id: 18, name: '雄子沢' },
    { id: 19, name: '京ヶ森' },
    { id: 20, name: '温泉下' },
    { id: 21, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :posts
end
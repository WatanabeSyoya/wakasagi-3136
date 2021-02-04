class Feed < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '赤虫' },
    { id: 3, name: '白サシ' },
    { id: 4, name: '紅サシ' },
    { id: 5, name: 'チーズ白サシ' },
    { id: 6, name: 'チーズ紅サシ' },
    { id: 7, name: '本ラビット' },
    { id: 8, name: '特ラビット' },    
    { id: 9, name: 'ラビットウォーム' },
    { id: 10, name: 'ワカサギウォーム' },
    { id: 11, name: 'ぶどう虫' },
    { id: 12, name: '秘密' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
class WaterDepth < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~3m' },
    { id: 3, name: '4~6m' },
    { id: 4, name: '7~9m' },
    { id: 5, name: '10~12m' },
    { id: 6, name: '13~15m' },
    { id: 7, name: '16~18m' },
    { id: 8, name: '19~21m' },
    { id: 9, name: '22~24m' },
    { id: 10, name: '25~27m' },
    { id: 11, name: '28~30m' },
    { id: 12, name: '秘密' }
  ]

  include ActiveHash::Associations
  has_many :posts
end

class Item < ApplicationRecord
  belongs_to_active_hash :prefecture
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destory

  enum status: {
                  very_good: 0,
                  good:      1,
                  normal:    2,
                  bad:       3,
                  so_bad:    4,
                  very_bad:  5
  }
  enum derivery_fee: {Included:0,Exculude:1}
  enum derivery_date: { OneToTwo: 0, TwoToThree: 1,FourToSeven: 2}
  enum delivery_method: {
                          undecided:           0,
                          easy_mercari_mail:   1,
                          yu_yu_mercari_mail:  2,
                          large_mericari_mail: 3,
                          postal_mail:         4,
                          letter_pack:         5,
                          regular_mail:        6,
                          kuroneko_yamato:     7,
                          yu_pack:             8,
                          click_post:          9,
                          yu_packet:           10
}
  enum size: {
                underXXS: 0,
                XS: 1,
                S: 2,
                M: 3,
                L: 4,
                XL: 5,
                two_XL: 6,
                three_XL: 7,
                four_XL: 8,
                FREE_SIZE: 9
  }
end

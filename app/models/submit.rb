class Submit < ApplicationRecord
    #Submitテーブルへのバリテーション
    validates :point_intention, :point_view, :point_expert, :point_tech, numericality: { only_integer: true, in: 0..200 }
    validates :generation, numericality: { only_integer: true, in: 10..70}
    validates :sex, numericality: { only_integer: true, in: 0..2}
    validates :month, numericality: { only_integer: true, in: 1..12}
end

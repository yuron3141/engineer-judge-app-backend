class InsertInitialStatics < ActiveRecord::Migration[6.0]
  def change
    # aは事業者型、bは社会指向型、cは技術職人型、dはモノづくり楽しみ型、eは職業人型
    # 初期データの挿入
    for num in 1..7 do
      TypeA1Statistic.create(sum: 0)
      TypeA2Statistic.create(sum: 0)
      TypeB1Statistic.create(sum: 0)
      TypeB2Statistic.create(sum: 0)
      TypeC1Statistic.create(sum: 0)
      TypeC2Statistic.create(sum: 0)
      TypeD1Statistic.create(sum: 0)
      TypeD2Statistic.create(sum: 0)
      TypeE1Statistic.create(sum: 0)
      TypeE2Statistic.create(sum: 0)
    end

  end
end

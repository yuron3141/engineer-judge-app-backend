class TaskJob < ApplicationJob
  queue_as :default

  # 各統計テーブル(10個)に保存する処理
  def perform(*args)

    yesterday = Date.current

    #昨日登録されたテスト結果をすべて取得する
    today_submits = Submit.where(created_at: yesterday.in_time_zone.all_day)
    
    #各タイプのパラメータによる取得分け(10個(各性格毎))
    type_a1_submits = today_submits.where('point_intention > ?', 100).where('point_view >= ?', 100).where('point_expert >= ?', 100).where('point_tech > ?', 100)
    type_a2_submits = today_submits.where('point_intention > ?', 100).where('point_view <= ?', 100).where('point_expert > ?', 100).where('point_tech > ?', 100)
    type_b1_submits = today_submits.where('point_intention > ?', 100).where('point_view >= ?', 100).where('point_expert <= ?', 100).where('point_tech > ?', 100)
    type_b2_submits = today_submits.where('point_intention > ?', 100).where('point_view <= ?', 100).where('point_expert <= ?', 100).where('point_tech > ?', 100)
    type_c1_submits = today_submits.where('point_intention <= ?', 100).where('point_view <= ?', 100).where('point_expert <= ?', 100).where('point_tech > ?', 100)
    type_c2_submits = today_submits.where('point_intention <= ?', 100).where('point_view <= ?', 100).where('point_expert > ?', 100).where('point_tech > ?', 100)
    type_d1_submits = today_submits.where('point_intention <= ?', 100).where('point_view > ?', 100).where('point_expert <= ?', 100).where('point_tech > ?', 100)
    type_d2_submits = today_submits.where('point_intention <= ?', 100).where('point_view >= ?', 100).where('point_expert > ?', 100).where('point_tech > ?', 100)
    type_e1_submits = today_submits.where('point_expert <= ?', 100).where('point_tech <= ?', 100)
    type_e2_submits = today_submits.where('point_expert > ?', 100).where('point_tech <= ?', 100)


    all_types = [type_a1_submits, type_a2_submits, type_b1_submits, type_b2_submits, type_c1_submits, type_c2_submits, type_d1_submits, type_d2_submits, type_e1_submits, type_e2_submits]

    #各タイプ分繰り返し(10個)
    all_types.each_with_index do |type, index|

      #7回(年代全て)分繰り返し
      for num in 1..7 do
        sum = type.where(generation: num * 10).count
        #puts sum

        if sum != nil

          case index
          when 0 then
            overwrite = TypeA1Statistic.find(num).increment(:sum, sum)
            overwrite.save
          when 1 then
            overwrite = TypeA2Statistic.find(num).increment(:sum, sum)
            overwrite.save
          when 2 then
            overwrite = TypeB1Statistic.find(num).increment(:sum, sum)
            overwrite.save
          when 3 then
            overwrite = TypeB2Statistic.find(num).increment(:sum, sum)
            overwrite.save
          when 4 then
            overwrite = TypeC1Statistic.find(num).increment(:sum, sum)
            overwrite.save
          when 5 then
            overwrite = TypeC2Statistic.find(num).increment(:sum, sum)
            overwrite.save
          when 6 then
            overwrite = TypeD1Statistic.find(num).increment(:sum, sum)
            overwrite.save
          when 7 then
            overwrite = TypeD2Statistic.find(num).increment(:sum, sum)
            overwrite.save
          when 8 then
            overwrite = TypeE1Statistic.find(num).increment(:sum, sum)
            overwrite.save
          when 9 then
            overwrite = TypeE2Statistic.find(num).increment(:sum, sum)
            overwrite.save
          end
        end
      end
    end

  end
end

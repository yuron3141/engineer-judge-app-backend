module Api
    module V1
        class StatisticsController < ApplicationController
            # GET /api/v1/statistics/
            # 統計データを返す
            def index
                all_type_datas = [  TypeA1Statistic.all, 
                                    TypeA2Statistic.all,
                                    TypeB1Statistic.all,
                                    TypeB2Statistic.all,
                                    TypeC1Statistic.all,
                                    TypeC2Statistic.all,
                                    TypeD1Statistic.all,
                                    TypeD2Statistic.all,
                                    TypeE1Statistic.all,
                                    TypeE2Statistic.all
                                ]
                
                #合計受験人数のカウント
                sum = 0
                all_type_datas.each do |index|
                    @record_num = index.count

                    for num in 1..@record_num do
                        sum += index.find_by(id: num).sum
                    end
                end

                #各年代毎データのカウント
                datas = []
                row = []
                for num in 1..@record_num do

                    all_type_datas.each do |index|
                        
                        if num != @record_num
                            row.push(index.find_by(id: num).sum)
                        else
                            datas.push(row)
                            row =[]
                        end
                    end
                end

                #全世代のデータカウント(和をとる)
                sum_row = [0,0,0,0,0,0,0,0,0,0]
                for num in @record_num do
                    for num2 in sum_row.length do
                        sum_row[num] += datas[num][num2]
                    end
                end
                datas.push(sum_row)

                render json: { sum: sum, datas: datas }
            end
        end
    end
end
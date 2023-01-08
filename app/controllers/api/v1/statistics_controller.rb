#多次元配列の要素をベクトル的に和をとるためにmatrixをrequire
require 'matrix'

module Api
    module V1
        class StatisticsController < ApplicationController
            # GET /api/v1/statistics/
            # 統計データを返す
            def index
                type_statistics = [ TypeA1Statistic.all, TypeA2Statistic.all, TypeB1Statistic.all,
                                    TypeB2Statistic.all, TypeC1Statistic.all, TypeC2Statistic.all,
                                    TypeD1Statistic.all, TypeD2Statistic.all, TypeE1Statistic.all,
                                    TypeE2Statistic.all]
                
                #合計受験人数のカウント
                sum = type_statistics.sum { |stats| stats.sum(&:sum) }

                #各年代毎データのカウント
                datas = Array.new(7) { Array.new(10, 0) }
                type_statistics.each_with_index do |stats, index|
                    stats[0...7].each_with_index do |stat, i|
                        datas[i][index] = stat.sum
                    end
                end

                #全世代のデータカウント(和をとる)
                sum_row = [0,0,0,0,0,0,0,0,0,0]
                datas.each do |index|
                    sum_row = (Vector.elements(sum_row) + Vector.elements(index)).to_a
                end
                
                #datasに追加
                datas.push(sum_row)

                render json: { sum: sum, datas: datas }
            end
        end
    end
end
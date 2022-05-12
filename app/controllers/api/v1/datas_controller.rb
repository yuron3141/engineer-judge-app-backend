require "json"

module Api
    module V1
        class Api::V1::DatasController < ApplicationController
            def index
                #Json読み込み
                data = {}
                File.open("#{Rails.public_path}/json/nowdata.json") do |f|
                    data = JSON.load(f)
                end                
                render json: data
            end
            def create
                calced = params[:calced]
                
                # データベース登録用文字列格納変数の宣言
                engineer = ""
                etype = ""

                #-50～50の範囲にcalcedを正規化
                calced = calced.map {|item|  (item / 0.4 ).to_i } 

                #logger.debug(calced)
                # calcedに応じてmodelとtypeを場合分け
                if calced[0] <= -25
                    if calced[1] > 0
                        engineer = "事業者"

                        if calced[2] < 0
                            etype = "事業家"
                        else
                            etype = "イノベータ"
                        end
                    else
                        engineer = "社会指向"

                        if calced[2] < 0
                            etype = "インフルエンサ"
                        else
                            etype = "発信型クリエイタ"
                        end
                    end
                else
                    #職業人型なら
                    if calced[3] <= -20
                        engineer = "職業人"

                        if calced[2] < 0
                            etype = "サラリーマン"
                        else
                            etype = "プロフェッショナル"
                        end
                    #モノづくり楽しみ型なら
                    elsif calced[1] < 0
                        engineer = "モノづくり楽しみ"

                        if calced[2] < 0
                            etype = "クリエイタ"
                        else
                            etype = "クラフトマン"
                        end
                    #技術職人型なら
                    elsif calced[1] >= 0
                        engineer = "技術職人"

                        if calced[2] < 0
                            etype = "技術好き"
                        else
                            etype = "科学者"
                        end
                    else
                        engineer = "職業人"

                        if calced[2] < 0
                            etype = "サラリーマン"
                        else
                            etype = "プロフェッショナル"
                        end
                    end
                end

                #データベースへの追加処理
                result = Resultlist.new(model: engineer,etype: etype, age: params[:age], sex: params[:sex], month: params[:month])

                if result.save
                    render json: { 
                        status: 'SUCCESS', 
                        data: result
                    }
                else
                    render json: { 
                        status: 'ERROR', 
                        data: result.errors 
                    }
                end


            end


        end
    end
end

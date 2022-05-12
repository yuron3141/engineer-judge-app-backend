
require "json"

namespace :submitdata do
    desc '1日に1回データベースから集計結果をjsonに書き込む処理'
    task :push => :environment do
        #レコード数、各
        sum = Resultlist.count

        #レコード数が50以下なら
        if sum < 50
            #sumが0のjsonを作成(オブジェクト)
            data = {
                "sum" => 0,
                "list" => {
                    "A" => 0,
                    "B" => 0,
                    "C" => 0,
                    "D" => 0,
                    "E" => 0,
                    "F" => 0,
                    "G" => 0,
                    "H" => 0,
                    "I" => 0,
                    "J" => 0
                }
            }
        else
            a = Resultlist.where(model: "事業者", type: "事業家").count
            b = Resultlist.where(model: "事業者", type: "イノベータ").count
            c = Resultlist.where(model: "社会指向", type: "インフルエンサ").count
            d = Resultlist.where(model: "社会指向", type: "発信型クリエイタ").count
            e = Resultlist.where(model: "職業人", type: "サラリーマン").count
            f = Resultlist.where(model: "職業人", type: "プロフェッショナル").count
            g = Resultlist.where(model: "モノづくり楽しみ", type: "クリエイタ").count
            h = Resultlist.where(model: "モノづくり楽しみ", type: "クラフトマン").count
            i = Resultlist.where(model: "技術職人", type: "技術好き").count
            j = Resultlist.where(model: "技術職人", type: "科学者").count

            data = {
                "sum"=> sum,
                "list" => {
                    "A" => a,
                    "B" => b,
                    "C" => c,
                    "D" => d,
                    "E" => e,
                    "F" => f,
                    "G" => g,
                    "H" => h,
                    "I" => i,
                    "J" => j
                }
            }
        end

        #json書き込み
        file_path = "#{Rails.public_path}/json/nowdata.json"
        File.open(file_path, 'w') do |f|
            JSON.dump(data, f)
        end 
    end
end


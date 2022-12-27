module Api
    module V1
        class MainsController < ApplicationController
            # Global_IPの取得
            @remote_ip = request.remote_ip

            # 作成・取得・削除・編集の許可
            before_action :set_post, only: [:show, :update, :destroy]


            private

            def post_params
                #Postされたデータの中身の受け取り
                params.require(:post).permit(calced: [], :age, :sex, :mont)

                # 出力されるデータ構造
                # {
                #   "calced" : [ 0, 0, 0, 0]
                #   "age" : "00",
                #   "sex" : "00",
                #   "mont" : "00"
                # }
            end
        end
    end
end

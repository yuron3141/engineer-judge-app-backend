module Api
    module V1
        class MainsController < ApplicationController

            # 作成・取得・削除・編集の許可
            before_action :set_ip, only: [:show, :update, :destroy]

            # DBのソート(DESC:降順)結果を返す
            def index
                mains = Submit.order(created_at: :desc)
                render json: { status: 'SUCCESS', message: 'Loaded posts', data: mains }
            end

            # データベース(Submit)への登録処理
            def create
                main = Submit.new(
                    ip_address: set_ip, 
                    point_intention: post_params[:calced][0],
                    point_view: post_params[:calced][1],
                    point_expert: post_params[:calced][2],
                    point_tech: post_params[:calced][3],
                    generation: post_params[:age],
                    sex: post_params[:sex],
                    month: post_params[:month]
                )

                if main.save
                    render json: { status: 'SUCCESS', data: main }
                else
                    render json: { status: 'ERROR', data: main.errors }
                end
            end

            private

            def set_ip
                # Global_IPの取得
                request.remote_ip
            end

            def post_params
                #Postされたデータ(HTTP内)の中身の受け取り
                params.require(:main).permit(:age, :sex, :month, calced: [])

                # 出力されるデータ構造
                # {
                #   "calced" : [ 0, 0, 0, 0],
                #   "age" : "00",
                #   "sex" : "00",
                #   "month" : "00"
                # }
            end
        end
    end
end


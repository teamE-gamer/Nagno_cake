class Admin::OrderDetailsController < ApplicationController

  def update
  @order_detail = OrderDetail.find(params[:id])
  # ステータスが送信されてきたデータを整数に変換
  params[:order_detail][:making_status] = params[:order_detail][:making_status].to_i
  if @order_detail.update(order_detail_params)
    # ステータスが更新された場合の処理
    # 例えば、更新後のステータスをメッセージとして表示するなど
    redirect_to admin_order_path
  else
    # ステータスの更新に失敗した場合の処理
    render :edit
  end
  end

private

def order_detail_params
  params.require(:order_detail).permit(:making_status,:amount,:price,:item_id,:order_id)
end
  

end

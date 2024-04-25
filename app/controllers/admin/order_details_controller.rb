class Admin::OrderDetailsController < ApplicationController

  def update
  
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
   #@order_detail.update(order_detail_params)
    @order_detail.update!(order_detail_params)
   if @order_detail.making_status == "製作中"
      @order.update(status: "製作中")
   end
   if @order.order_details.all?{|order_detail| order_detail.making_status == "製作完了"}
      @order.update(status: "発送準備中")
   else
      @order.update(status: "製作中")
   end
   redirect_to admin_order_path(@order)
  end
   
  
  #@order = OrderDetail.find(params[:id])
  # params[:order_detail][:making_status] = params[:order_detail][:making_status].to_i
 # if @order.update(order_detail_params)
   # if @order.order_status == 1
   #   @order.order_details.update_all(maiking_status: 2)
   # end
   # if @order.order_details.where(maiking_status: 3).exists?
    #  @order.update(order_status: 2)
    #end
  #redirect_to admin_order_path
#end
  #@order_detail = OrderDetail.find(params[:id])
  # ステータスが送信されてきたデータを整数に変換
  #params[:order_detail][:making_status] = params[:order_detail][:making_status].to_i
  #if @order_detail.update(order_detail_params)
    # ステータスが更新された場合の処理
    # 例えば、更新後のステータスをメッセージとして表示するなど
    #redirect_to admin_order_path
  #else
    # ステータスの更新に失敗した場合の処理
   # render :edit
  #end
  

private

def order_detail_params
  params.require(:order_detail).permit(:making_status,:amount,:price,:item_id,:order_id)
end
  
end
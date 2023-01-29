class OrderItemsController < ApplicationController

    def create
        @order = current_order
        @order_item = @order.order_items.new(order_params)
        @order.save
        session[:order_id] = @order.id
    end



    def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update_attributes(order_params)
        @order_items = current_order.order_items
    end

    def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        @order_items = current_order.order_items
    end

    def clean_subtotal(subtotal)
      # Vérifier que subtotal est un nombre valide
      return 0 unless subtotal.is_a? Numeric
      # Vérifier que subtotal est positif
      return 0 if subtotal <= 0
      # Appliquer tout autre nettoyage nécessaire ici

    end


    private

    def order_params
        params.require(:order_item).permit(:product_id, :quantity)
    end
end

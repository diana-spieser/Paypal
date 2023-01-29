class CardsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end
  def clean_subtotal(subtotal)
    # Vérifier que subtotal est un nombre valide
    return 0 unless subtotal.is_a? Numeric
    # Vérifier que subtotal est positif
    return 0 if subtotal <= 0
    # Appliquer tout autre nettoyage nécessaire ici

  end

  def recap
    @order_items = current_order.order_items
  end
end

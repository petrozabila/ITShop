module ProductsHelper

	def show_rubrics(product)
    if product.rubrics.present?
      product.rubrics.map { |c| c.name }.join(', ')
    end
  end

end

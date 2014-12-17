class StaticPagesController < ApplicationController
  
@rubrics = Rubric.all
  def initial
  	render 'static_pages/initial'
  	@rubrics = Rubric.all
  end

  def about_us
  	'static_pages/about_us'
    @rubrics = Rubric.all
  end

  def contact
  	'static_pages/contact'
    @rubrics = Rubric.all
  end
end

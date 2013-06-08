module ApplicationHelper

	def render_modal_link(modal_id, class_name="tiny-image-link",&block)
    options={:class_name=>class_name}
    options.merge!(:modal_id=>modal_id)
    options.merge!(:content=>capture(&block))
    render :partial =>  "widgets/modal_link", :locals => options
  end

  def render_modal(title, modal_id, &block)
    render :partial => "widgets/modal" , :locals => {:title => title,:modal_id=>modal_id, :content=>capture(&block)}
  end

  def render_header(title,subtitle, icon_name="")
    render :partial => "widgets/header" , :locals => {:title=>title, :subtitle => subtitle, :icon_name=> icon_name}
  end


end

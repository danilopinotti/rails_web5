module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:destroy) + link_to(name, "javascript:void(0)", onclick: "remove_fields(this)")
  end
end

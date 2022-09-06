module ListElementHelper

  def display_acupoint_of(list_element)
    list_element.listable.symptoms.map(&:name).join(" ")
  end
end

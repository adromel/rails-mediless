module ListElementHelper

#helper pour la view index de saving list
#afin d'afficher les symptoms liés aux points d'acu

  def display_acupoint_of(list_element)
    list_element.listable.symptoms.map(&:name).join(" ")
  end
end

module ApplicationHelper
  def strongify(description)
    array_word = [
      "goutte",
      "gouttes",
      "amélioration",
      "essentielles",
      "essentielles",
      "naturelle",
      "naturel",
      "ventre",
      "Répétez",
      "pouce",
      "index"
    ]

    separate_word = description.split(" ")
    strong = separate_word.map do |word|
      if array_word.include?(word)
        "<strong>#{word}</strong>"
      else
        word
      end
    end.join(" ").html_safe
  end
end

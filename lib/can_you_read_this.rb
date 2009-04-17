module CanYouReadThis
  module Helper
    def can_you_read_this(text)
      cyrt_scrambles = []
      text.cyrt_words.each do |word|
        cyrt_scrambles << word.cyrt_scramble
      end

      cyrt_joins = text.cyrt_joins

      new_text = ""

      cyrt_joins.each_with_index do |cj,i|
        new_text += cj.to_s
        new_text += cyrt_scrambles[i].to_s
      end

      new_text
    end
  end
end

class String
  def cyrt_joins
    self.split(/[a-zA-Z]+/)
  end
  def cyrt_words
    self.split(/[^a-zA-Z]/).delete_if{|y| y == ""}
  end
  def cyrt_scramble
    a = self.split(//)
    return self if a.size <= 3
    return a[0] + a[2] + a[1] + a[3] if a.size == 4
    scrambled = a.delete_at(0) + "----fillmein----" + a.delete_at(-1)
    fillmein = ""
    while a.size > 0 do
      fillmein += a.delete_at(rand(a.size - 1))
    end
    scrambled.gsub("----fillmein----",fillmein)
  end
end

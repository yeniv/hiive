def validator(text)
  splitted = text.split(" ")
  splitted.each do |word|
    matched = word.match?(/(https?:)?(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?((.[a-zA-Z0-9_%]*)+)?(\.[a-z]*)?/)
    marched.tr('""', "''")
    if matched
      word
    end
  end
end

validator("")

# eliminate all quotes

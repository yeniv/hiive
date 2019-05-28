def validator(text)
  text.gsub(/[",']/, "")
  splitted = text.split(" ")
  arr = splitted.reject { |word| !word.match?(/(https?:)?(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?((.[a-zA-Z0-9_%]*)+)?(\.[a-z]*)?/) }
  return arr
end
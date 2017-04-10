# require modules here
require "yaml"
require "pry"


def load_library(file)
  emoticons = YAML.load_file(file)
  hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons.each do |title, symbol|
    hash["get_emoticon"][symbol[0]] = symbol[1]
    hash["get_meaning"][symbol[1]] = title
  end
  hash
end

def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  if hash["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return hash["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
binding.pry
  if hash["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return hash["get_meaning"][emoticon]
  end
end

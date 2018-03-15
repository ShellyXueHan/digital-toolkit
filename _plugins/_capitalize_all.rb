require 'liquid'
require 'uri'

# Capitalize (almost) all words of the input
module CapitalizeAll
  def capitalize_all(words)

    if words == "it product and service design"
      return "IT Product and Service Design"
    end

    allwords = words.tr("0-9", "").split(' ')
    # except these words
    donttouchwords = [ 'the', 'and', 'on', 'to', 'of', 'for', 'ii', 'iii', 'iv', 'at' ]
    newwords = Array.new

    allwords.each do |word|
      if donttouchwords.include? word
        newwords.push word
      elsif word == "ocio"
        newwords.push "OCIO"
      elsif word == "eba"
        newwords.push "EBA"
      elsif word == "bc"
        newwords.push "BC"
      elsif word == "api"
        newwords.push "API"
      elsif word == "ip"
        newwords.push "IP"
      elsif word == "github"
        newwords.push "GitHub"
      else
        newwords.push word.capitalize
      end
    end

    str = newwords.join(' ')
    # ensure that at the very least, the first letter of the string is capitalized
    str[0] = str[0].capitalize

    return str

  end
end

Liquid::Template.register_filter(CapitalizeAll)

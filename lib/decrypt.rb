class Decrypt
  attr_accessor :phrase, :unity

  def initialize(phrase, unity)
    @phrase = phrase
    @unity = unity
    @response = response(@phrase)
  end

  def response(phrase)
    count = 0
    phrase = phrase.codepoints.to_a
    while count < phrase.size
      case phrase[count]
      when 0..64
        count += 1
      when 91..96
        count += 1
      when 123..255
        count += 1
      when 65..90
        phrase[count] += 32
      end

      unless phrase[count] - @unity < 97
        phrase[count] -= @unity
        count += 1
      end
    end

    count = 0
    response = phrase
    while count < response.size
      response[count] = response[count].chr
      count += 1
    end
    puts "
    Before: #{@phrase}
    After:  #{response.join}"
  end
end
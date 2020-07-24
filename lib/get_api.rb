require_relative 'decrypt.rb'

class GetApi
  attr_accessor :url, :decrypt, :unity

  def initialize(url, unity)
    @url = url
    @unity = unity
    response = Faraday.get(@url)
    json = JSON.parse(response.body, symbolize_name: true)
    @decrypt = Decrypt.new(json['cifrado'], @unity)
  end
end
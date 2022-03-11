class Translator
    attr_accessor :phrase, :final_language

    def translate
        require 'uri'
        require 'net/http'
        require 'openssl'
        require 'json'
        require_relative 'config'

        url = URI("https://microsoft-translator-text.p.rapidapi.com/translate?to=#{final_language}&api-version=3.0")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'application/json'
        request["x-rapidapi-host"] = 'microsoft-translator-text.p.rapidapi.com'
        request["x-rapidapi-key"] = Config::Key
        request.body = "[\r\n    {\r\n        \"Text\": \"#{phrase}\"\r\n    }\r\n]"

        response = http.request(request)
        json = JSON.parse(response.body)
        translatedText = json[0]["translations"][0]["text"]
        puts translatedText
    end
end
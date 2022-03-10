class Translator
    attr_accessor :phrase, :initial_language, :final_language

    def show
        puts "\nA frase abaixo será traduzida do idioma #{initial_language} para #{final_language}:"
        puts "#{phrase}\n\n"
    end
end

t = Translator.new
print "\nDigite a frase a ser traduzida:"
t.phrase = gets.chomp
print "Digite o idioma atual da sua frase:"
t.initial_language = gets.chomp
print "Digite para qual idioma quer traduzir:"
t.final_language = gets.chomp
t.show
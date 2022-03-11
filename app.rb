require_relative 'Translator'

t = Translator.new
print "\nDigite a frase a ser traduzida:"
t.phrase = gets.chomp
print "Digite a sigla do idioma final da tradução:"
t.final_language = gets.chomp
t.translate
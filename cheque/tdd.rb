require 'test/unit'
require 'cheque'
class Testador < Test::Unit::TestCase
  def test_um
     assert_equal("um", Cheque::traduz(1))
   end
   
   def test_0a9
     lista = {0=>"zero", 1=>"um", 2=>"dois", 3=>"três", 4=>"quatro", 5=>"cinco", 6=>"seis", 7=>"sete", 8=>"oito", 9=>"nove"}
    testa_lista(lista)
   end
   
  def test_10a19
     lista = {10=>"dez", 11=>"onze", 12=>"doze", 13=>"treze", 14=>"quatorze", 15=>"quinze", 16=>"dezesseis", 17=>"dezessete", 18=>"dezoito", 19=>"dezenove"}
    testa_lista(lista)
   end
 
  def test_dezenas
     lista = {10=>"dez", 20=>"vinte", 30=>"trinta", 40=>"quarenta", 50=>"cinquenta", 60=>"sessenta", 70=>"setenta", 80=>"oitenta", 90=>"noventa"}
    testa_lista(lista)
   end

  def test_centenas_milhar
     lista = {100=>"cem", 200=>"duzentos", 300=>"trezentos", 400=>"quatrocentos", 500=>"quinhentos", 600=>"seiscentos", 700=>"setecentos", 800=>"oitocentos", 900=>"novecentos", 1000=>"mil"}
    testa_lista(lista)
   end

  def test_20
    lista = {21 => "vinte e um", 22 => "vinte e dois", 23 => "vinte e três", 24 => "vinte e quatro", 25=>"vinte e cinco", 26=>"vinte e seis", 27=>"vinte e sete", 28=>"vinte e oito", 29=>"vinte e nove"}
    testa_lista(lista)
   end
   
   def test_aleatorios_entre_1_e_99
     lista = {47 => "quarenta e sete", 68 => "sessenta e oito", 73 => "setenta e três", 99 => "noventa e nove", 40 => "quarenta", 11 => "onze"}
     testa_lista(lista)
   end
   
   def test_aleatorios_entre_101_a_999
     lista = {101 => "cento e um", 205 => "duzentos e cinco", 666 => "seiscentos e sessenta e seis", 709 => "setecentos e nove", 847 => "oitocentos e quarenta e sete", 935 => "novecentos e trinta e cinco"}
     testa_lista(lista)
   end

   def test_milhar
     lista = {1011 => "mil e onze", 2000 => "dois mil", 1009 => "mil e nove", 2345 => "dois mil trezentos e quarenta e cinco", 1105 => "mil cento e cinco", 1100 => "mil e cem", 9999 => "nove mil novecentos e noventa e nove", 5401 => "cinco mil quatrocentos e um"}
     testa_lista(lista)
   end
   
   private
   def testa_lista(lista)
     lista.each do |chave, valor|
       assert_equal(valor, Cheque::traduz(chave))
     end
   end
     
end
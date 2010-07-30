class Cheque
  
  
  def self.traduz(numero)
     traducoes = {0=>"zero", 1=>"um", 2=>"dois", 3=>"três", 4=>"quatro", 5=>"cinco", 6=>"seis", 7=>"sete", 
                      8=>"oito", 9=>"nove",10=>"dez", 11=>"onze", 12=>"doze", 13=>"treze", 14=>"quatorze", 
                      15=>"quinze", 16=>"dezesseis", 17=>"dezessete", 18=>"dezoito", 19=>"dezenove",
                      10=>"dez", 20=>"vinte", 30=>"trinta", 40=>"quarenta", 50=>"cinquenta", 60=>"sessenta",
                      70=>"setenta", 80=>"oitenta", 90=>"noventa",
                      100=>"cem", 200=>"duzentos", 300=>"trezentos", 400=>"quatrocentos", 500=>"quinhentos", 
                      600=>"seiscentos", 700=>"setecentos", 800=>"oitocentos", 900=>"novecentos", 1000=>"mil"}
                      
    numstr = numero.to_s                 
    if (numstr.slice(-1,1) != "0" && numero > 20 && numero < 100)
      dezena = numstr.slice(-2,1) + "0"
      unidade = numstr.slice(-1,1)
      traducoes[dezena.to_i] + " e " + traducoes[unidade.to_i]
    elsif (numero > 100 && numero < 1000)
      centena = numstr.slice(-3,1) + "00"
      dezena = numstr.slice(-2,1) + "0"
      unidade = numstr.slice(-1,1)
      
      if (centena == "100")
        result = "cento"
      elsif
        result = traducoes[centena.to_i] 
      end
      
      if (dezena != "00")
        result += " e " +traducoes[dezena.to_i] 
      end

      if (unidade != "0")
        result += " e " + traducoes[unidade.to_i] 
      end

      result
    elsif (numero > 1000 && numero < 10000)
      milhar = numstr.slice(-4,1)
      centena = numstr.slice(-3,1) + "00"
      dezena = numstr.slice(-2,1) + "0"
      unidade = numstr.slice(-1,1)
      
      if (milhar == "1")
        result = "mil"
      elsif
        result = traducoes[milhar.to_i] + " mil"
      end

      if (centena == "100" && ((dezena != "00" && unidade == "0") || (dezena == "00" && unidade != "0")))
        result += " cento"
      elsif (dezena == "00" && unidade == "0" && centena != "000")
        result += " e " + traducoes[centena.to_i] 
      elsif (centena != "000")
        result += " " + traducoes[centena.to_i] 
      end
      
      if (dezena == "10")
        result += " e " + traducoes[dezena.to_i + unidade.to_i]
      elsif (dezena != "00")
          result += " e " + traducoes[dezena.to_i] 
      end

      if (unidade != "0" && dezena != "10")
        result += " e " + traducoes[unidade.to_i] 
      end
      result
    else  
     traducoes[numero]
    end      
  end
end
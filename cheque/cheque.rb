class Cheque-

  TRADUCOES = {0=>"zero", 1=>"um", 2=>"dois", 3=>"três", 4=>"quatro", 5=>"cinco", 6=>"seis", 7=>"sete", 
               8=>"oito", 9=>"nove",10=>"dez", 11=>"onze", 12=>"doze", 13=>"treze", 14=>"quatorze", 
               15=>"quinze", 16=>"dezesseis", 17=>"dezessete", 18=>"dezoito", 19=>"dezenove",
               10=>"dez", 20=>"vinte", 30=>"trinta", 40=>"quarenta", 50=>"cinquenta", 60=>"sessenta",
               70=>"setenta", 80=>"oitenta", 90=>"noventa",
               100=>"cem", 200=>"duzentos", 300=>"trezentos", 400=>"quatrocentos", 500=>"quinhentos", 
               600=>"seiscentos", 700=>"setecentos", 800=>"oitocentos", 900=>"novecentos", 1000=>"mil"}  
  
  def self.traduz(numero)

	if(numero <= 100)
      self.trataAte100(numero)
    elsif (numero > 100 && numero < 1000)
	  self.trata101ate999(numero)
    elsif (numero >= 1000 && numero < 10000)
      self.trata1000ate10000(numero)
    else
      'Not implemented yet'
    end
  end
  
  def self.trataAte100(num)
	  unidade = num%10
	  if(unidade != 0 && num > 20)	  
		dezena = num-unidade
		TRADUCOES[dezena] + " e " + TRADUCOES[unidade]
	  else
		TRADUCOES[num]
	  end
  end

  def self.trata101ate999(num)
      unidade = num%10
      dezena = num%100-unidade
	  centena = num-dezena-unidade
      
      
      if (centena == 100)
        result = "cento"
      elsif
        result = TRADUCOES[centena] 
      end
      
	  if (dezena == 10 && unidade != 0)
		result += " e " +TRADUCOES[dezena + unidade] 
	  else 
		if (dezena != 0)
		  result += " e " + TRADUCOES[dezena]
		end

		if (unidade != 0)
		  result += " e " + TRADUCOES[unidade]
		end
      end

      result
	end

	def self.trata1000ate10000(num)
      unidade = num%10
      dezena = num%100-unidade
	  centena = num%1000-dezena-unidade
	  milhar = num/1000

      if (milhar == 1)
        result = "mil"
      elsif
        result = TRADUCOES[milhar] + " mil"
      end

	  numAux = centena + dezena + unidade
	  if (numAux > 101 && numAux < 200)
        result += " cento"
      elsif(centena != 0)
		if (numAux%100 == 0 && numAux != 0) then result += " e" end
		result += " " + TRADUCOES[centena]
	  end

      if (dezena == 10)
        result += " e " + TRADUCOES[dezena + unidade]
      elsif (dezena != 0)
        result += " e " + TRADUCOES[dezena]
      end

      if (unidade != 0 && dezena != 10)
        result += " e " + TRADUCOES[unidade]
      end
      result
	end
end
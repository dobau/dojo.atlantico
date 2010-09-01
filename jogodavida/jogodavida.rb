class JogoDaVida
  attr_accessor :tabuleiro
  
 	def initialize(x, y)
		@tabuleiro = Array.new(x).map!{ Array.new(y) }
	
		for i in 0..x-1
			for j in 0..y-1
				@tabuleiro[i][j] = '.'
			end
		end
	end 
  
 	def cria_vida(x, y, tabuleiro = nil)
		if (tabuleiro.nil?)
			tabuleiro = @tabuleiro
		end
		tabuleiro[x][y] = '*'
	end

 	def mata(x, y, tabuleiro = nil)
		if (tabuleiro.nil?)
			tabuleiro = @tabuleiro
		end
		tabuleiro[x][y] = '.'
	end
	
	def get_quantidade_vizinhos(i,j)
		quantidade = 0

		quantidade += 1 if (esta_vivo(i-1, j-1))
		quantidade += 1 if (esta_vivo(i-1, j))
		quantidade += 1 if (esta_vivo(i-1, j+1))
		quantidade += 1 if (esta_vivo(i, j-1))
		quantidade += 1 if (esta_vivo(i, j+1))
		quantidade += 1 if (esta_vivo(i+1, j-1))
		quantidade += 1 if (esta_vivo(i+1, j))
		quantidade += 1 if (esta_vivo(i+1, j+1))

		quantidade
	end
	
	def esta_vivo(i,j)
		if (i >= 0 && i < tabuleiro.length && j >= 0 && j < tabuleiro[i].length)
			@tabuleiro[i][j] == '*'
		elsif
			false
		end
	end
  
	def proxima_geracao
		tab_aux = @tabuleiro.clone.map!{ |sub| sub.clone }
		
		tab_aux.each_index do |x|
			tab_aux[x].each_index do |y|
				quantidade = get_quantidade_vizinhos(x, y) 
				if (quantidade < 2 || quantidade > 3)
					mata(x, y, tab_aux)
				elsif (quantidade == 3)
					cria_vida(x, y, tab_aux)
				end
			end
		end
		
		@tabuleiro = tab_aux
	end
end
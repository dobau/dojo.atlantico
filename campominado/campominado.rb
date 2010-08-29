=begin
# Desafio do campo minado
#
# @link http://www.programming-challenges.com/pg.php?page=downloadproblem&probid=110102&format=html
#
# @author Rafael Alves,
#         Arian Maykon,
#         Wesley Jefferson
# @since 24/08/2010
=end
class CampoMinado

	attr_accessor :mina
		
	def initialize(x, y)
		@mina = Array.new(x).map!{ Array.new(y) }
	
		for i in 0..x-1
			for j in 0..y-1
				@mina[i][j] = '.'
			end
		end
	end
	
	def adicionaMina(x, y)
		@mina[x][y] = '*'
	end
	
	def adicionaMinas(posicoes)
		posicoes.each do |posicao|
			@mina[posicao[0]][posicao[1]] = '*'
		end
	end
	
	def processa()
		@mina.each_index do |i|
			@mina[i].each_index do |j|
				processa_celula(i,j)
			end
		end
	end

	def processa_celula(i,j)
		if (@mina[i][j] == '.')
			@mina[i][j] = 0

			@mina[i][j] += 1 if (tem_bomba(i-1, j-1))
			@mina[i][j] += 1 if (tem_bomba(i-1, j))
			@mina[i][j] += 1 if (tem_bomba(i-1, j+1))
			@mina[i][j] += 1 if (tem_bomba(i, j-1))
			@mina[i][j] += 1 if (tem_bomba(i, j+1))
			@mina[i][j] += 1 if (tem_bomba(i+1, j-1))
			@mina[i][j] += 1 if (tem_bomba(i+1, j))
			@mina[i][j] += 1 if (tem_bomba(i+1, j+1))

			@mina[i][j] = @mina[i][j].to_s
		end
	end
	
	def tem_bomba(i,j)
		if (i >= 0 && i < mina.length && j >= 0 && j < mina[i].length)
			@mina[i][j] == '*'
		elsif
			false
		end
	end

end

#
# Desafio do campo minado
#
# @link http://www.programming-challenges.com/pg.php?page=downloadproblem&probid=110102&format=html
# @author Rafael Alves, Arian Maykon e Wesley Jefferson
# @since 24/08/2010
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

			@mina[i][j] += 1 if (j > 0 && @mina[i][j-1] == '*')
			@mina[i][j] += 1 if (j+1 < @mina[i].length && @mina[i][j+1] == '*')

			@mina[i][j] += 1 if (i > 0 && @mina[i-1][j] == '*')
			@mina[i][j] += 1 if (i+1 < @mina.length && @mina[i+1][j] == '*')

			@mina[i][j] = @mina[i][j].to_s
		end
	end

end

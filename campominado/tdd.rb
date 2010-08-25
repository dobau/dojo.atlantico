require 'test/unit'
require 'campominado'

class Testador < Test::Unit::TestCase
	
	def test_1x1
		campoMinado = CampoMinado.new(1,1)
		campoMinado.adicionaMina(0,0)
		minaProcessada = campoMinado.processa()
		
		assert_equal([['*']], minaProcessada)
	end

	def test_1x2
		campoMinado = CampoMinado.new(1,2)
		campoMinado.adicionaMina(0,1)
		minaProcessada = campoMinado.processa()
		
		assert_equal([['1','*']], minaProcessada)
	end	

	def test_2x1
		campoMinado = CampoMinado.new(2,1)
		campoMinado.adicionaMina(0,0)
		minaProcessada = campoMinado.processa()
		
		assert_equal([['*'],['1']], minaProcessada)
	end

	def test_2x2
		campoMinado = CampoMinado.new(2,2)
		campoMinado.adicionaMina(0,0)
		minaProcessada = campoMinado.processa()
		
		assert_equal([['*', '1'],['1', '1']], minaProcessada)
	end
end

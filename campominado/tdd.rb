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
	
	def test_4x4
		campoMinado = CampoMinado.new(4,4)
		campoMinado.adicionaMina(0,3)
		campoMinado.adicionaMina(1,2)
		campoMinado.adicionaMina(2,0)
		campoMinado.adicionaMina(2,3)
		minaProcessada = campoMinado.processa()
		
		assert_equal([
			['0', '1', '2', '*'],
			['1', '2', '*', '3'],
			['*', '2', '2', '*'],
			['1', '1', '1', '1']],
			minaProcessada)
	end
	
	def test_10x10
		campoMinado = CampoMinado.new(10,10)
		campoMinado.adicionaMinas(
			[[0,3],
			[1,2], [1,5], [1,7], [1,8],
			[2,0], [2,3], [2,9],
			[3,3], [3,6], [3,7], [3,8],
			[4,0], [4,6],
			[5,1], [5,3], [5,8],
			[6,1], [6,3], [6,5], [6,8],
			[7,0], [7,2], [7,4], [7,6],
			[8,1], [8,4],
			[9,3], [9,7], [9,9]])
		minaProcessada = campoMinado.processa()
		
		assert_equal([
			['0', '1', '2', '*', '2', '1', '2', '2', '2', '1'],
			['1', '2', '*', '3', '3', '*', '2', '*', '*', '2'],
			['*', '2', '3', '*', '3', '2', '4', '5', '5', '*'],
			['2', '2', '2', '*', '2', '2', '*', '*', '*', '2'],
			['*', '2', '3', '2', '2', '2', '*', '5', '3', '2'],
			['3', '*', '4', '*', '3', '2', '2', '3', '*', '2'],
			['3', '*', '5', '*', '4', '*', '2', '3', '*', '2'],
			['*', '4', '*', '4', '*', '4', '*', '2', '1', '1'],
			['2', '*', '3', '4', '*', '3', '2', '2', '2', '1'],
			['1', '1', '2', '*', '2', '1', '1', '*', '2', '*']],
			minaProcessada)
	end
end

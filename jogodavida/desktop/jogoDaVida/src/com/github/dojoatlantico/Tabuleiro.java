package com.github.dojoatlantico;

public class Tabuleiro implements Cloneable {

	private Celula[][] celulas;
	
	public Tabuleiro(Integer x, Integer y) {
		celulas = new Celula[x][y];

		for (int i = 0; i < celulas.length; i++) {
			for (int j = 0; j < celulas[i].length; j++) {
				celulas[i][j] = new Celula();
			}
		}
	}
	
	public void createLife(Integer x, Integer y) {
		Tabuleiro.createLife(x, y, this);
	}

	public static void createLife(Integer x, Integer y, Tabuleiro tabuleiro) {
		tabuleiro.getCelulas()[x][y].born();
	}

	public static void kill(Integer x, Integer y, Tabuleiro tabuleiro) {
		tabuleiro.getCelulas()[x][y].die();
	}

	public void kill(Integer x, Integer y) {
		Tabuleiro.kill(x, y, this);
	}

	public Celula[][] getCelulas() {
		return celulas;
	}

	public void setCelulas(Celula[][] celulas) {
		this.celulas = celulas;
	}

	public void nextGeneration() {
		Tabuleiro clone = null;
		try {
			clone = (Tabuleiro) this.clone();
		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
		
		int vivos = 0;
		int mortos = 0;
		int continua = 0;
		for (int i = 0; i < clone.getCelulas().length; i++) {
			for (int j = 0; j < clone.getCelulas()[i].length; j++) {
				Integer quantidade = this.getQuantidadeVizinhos(i, j);
				if (quantidade < 2 || quantidade > 3) {
					Tabuleiro.kill(i, j, clone);
					mortos++;
				} else if (quantidade == 3) {
					Tabuleiro.createLife(i, i, clone);
					vivos++;
				} else {
					continua++;
				}
			}			
		}
		
		System.out.println("VIVOS: "+vivos+", Mortos: "+mortos+", Continua: "+continua);
		
		this.setCelulas(clone.celulas.clone());
	}

	private Integer getQuantidadeVizinhos(Integer i, Integer j) {
		Integer quantidade = 0;

		if (isCelulaAlive(i - 1, j - 1)) {
			quantidade++;
		}
		if (isCelulaAlive(i - 1, j)) {
			quantidade++;
		}
		if (isCelulaAlive(i - 1, j + 1)) {
			quantidade++;
		}
		if (isCelulaAlive(i, j - 1)) {
			quantidade++;
		}
		if (isCelulaAlive(i, j + 1)) {
			quantidade++;
		}
		if (isCelulaAlive(i + 1, j - 1)) {
			quantidade++;
		}
		if (isCelulaAlive(i + 1, j)) {
			quantidade++;
		}
		if (isCelulaAlive(i + 1, j + 1)) {
			quantidade++;
		}

		return quantidade;
	}

	private boolean isCelulaAlive(int i, int j) {
		if (i >= 0 && i < getCelulas().length && j >= 0 && j < getCelulas()[i].length) {
			return getCelulas()[i][j].isAlive();
		} else {
			return false;
		}
	}
	
}

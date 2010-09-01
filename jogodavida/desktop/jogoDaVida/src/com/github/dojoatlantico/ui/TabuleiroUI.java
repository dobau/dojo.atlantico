package com.github.dojoatlantico.ui;

import java.awt.Dimension;
import java.awt.GridLayout;

import javax.swing.JPanel;

import com.github.dojoatlantico.Celula;
import com.github.dojoatlantico.Tabuleiro;

public class TabuleiroUI extends JPanel {

	private CelulaUI celulasUI[][] = null;
	private Tabuleiro tabuleiro;

	private Integer rows; 
	private Integer columns; 
	
	public TabuleiroUI(Integer r, Integer c) {
		super();
		
		this.rows = r;
		this.columns = c;
		
		initialize();
	}

	/**
	 * This method initializes this
	 * 
	 */
	private void initialize() {
        GridLayout gridLayout = new GridLayout(rows, columns);
        this.setLayout(gridLayout);
        this.setSize(new Dimension(373, 180));
        
        this.reset();
        
		for (int i = 0; i < getCelulasUI().length; i++) {
			for (int j = 0; j < getCelulasUI()[i].length; j++) {
				this.add(getCelulasUI()[i][j]);
			}
		}
		
		this.doLayout();
	}

	public void reset() {
		tabuleiro = new Tabuleiro(rows, columns);
		this.resetCelulasUI();
		this.repaint();
	}

	private void resetCelulasUI() {
		this.celulasUI = null;
		atualizarCelulasUI();
		this.removeAll();
		for (int i = 0; i < getCelulasUI().length; i++) {
			for (int j = 0; j < getCelulasUI()[i].length; j++) {
				this.add(getCelulasUI()[i][j]);
			}
		}
		
		this.doLayout();
	}

	public void nextGeneration() {
		tabuleiro.nextGeneration();
	}

	private void atualizarCelulasUI() {
		Celula celulas[][] = tabuleiro.getCelulas();
		for (int i = 0; i < celulas.length; i++) {
			for (int j = 0; j < celulas[i].length; j++) {
				getCelulasUI()[i][j].setCelula(celulas[i][j]);
				getCelulasUI()[i][j].repaint();
			}
		}
	}

	private CelulaUI[][] getCelulasUI() {
		if (celulasUI == null) {
			Celula celula[][] = tabuleiro.getCelulas();
			// TODO Verifizer posição 0
			celulasUI = new CelulaUI[celula.length][celula[0].length];
			
			for (int i = 0; i < celulasUI.length; i++) {
				for (int j = 0; j < celulasUI[i].length; j++) {
					celulasUI[i][j] = new CelulaUI(celula[i][j]);
				}
			}
		}

		return celulasUI;
	}
	
}  //  @jve:decl-index=0:visual-constraint="10,10"

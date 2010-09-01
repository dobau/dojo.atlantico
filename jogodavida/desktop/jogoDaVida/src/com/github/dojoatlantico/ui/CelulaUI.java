package com.github.dojoatlantico.ui;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Date;

import javax.swing.BorderFactory;
import javax.swing.JLabel;

import com.github.dojoatlantico.Celula;

public class CelulaUI extends JLabel {

	private Celula celula;
	
	public CelulaUI() {
		this(new Celula());
	}

	public CelulaUI(Celula c) {
		this.celula = new Celula();
		this.setOpaque(Boolean.TRUE);
		this.addMouseListener(new MouseAdapter() {
			
			@Override
			public void mouseEntered(MouseEvent e) {
				setBorder(BorderFactory.createLineBorder(Color.RED));
			}
			
			@Override
			public void mouseExited(MouseEvent e) {
				setBorder(null);
			}
			
			@Override
			public void mouseClicked(MouseEvent e) {
				if (celula.isAlive()) {
					celula.die();
				} else {
					celula.born();
				}
				
				System.out.println("Clicou: "+ new Date().getTime());
				repaint();
			}
			
		});
	}
	
	@Override
	public void paint(Graphics g) {
		if (celula.isAlive()) {
			paintLive(g);
		} else {
			paintDead(g);
		}
	}

	private void paintDead(Graphics g) {
		this.setBackground(Color.WHITE);
		super.paint(g);
	}

	private void paintLive(Graphics g) {
		this.setBackground(Color.BLACK);
		super.paint(g);
	}

	public Celula getCelula() {
		return celula;
	}

	public void setCelula(Celula celula) {
		this.celula = celula;
	}
	
}

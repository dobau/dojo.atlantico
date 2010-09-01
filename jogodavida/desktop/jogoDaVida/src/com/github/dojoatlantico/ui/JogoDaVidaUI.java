package com.github.dojoatlantico.ui;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.util.Date;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class JogoDaVidaUI extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel pnTop = null;
	private JPanel pnCenter = null;
	private JButton btNew = null;
	
	private TabuleiroUI tabuleiro = null;
	private JButton btStart = null;
	private JButton btStop = null;
	
	private Thread player = null;
	private Boolean isPlaying = Boolean.FALSE;  //  @jve:decl-index=0:

	/**
	 * This is the default constructor
	 */
	public JogoDaVidaUI() {
		super();
		initialize();
	}

	/**
	 * This method initializes this
	 * 
	 * @return void
	 */
	private void initialize() {
		this.setSize(800, 600);
		this.setTitle("Jogo da Vida");

		this.add(getPnTop(), BorderLayout.NORTH);
		this.add(getPnCenter(), BorderLayout.CENTER);
		this.setLocationRelativeTo(null);
		
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	/**
	 * This method initializes pnTop	
	 * 	
	 * @return javax.swing.JPanel	
	 */
	private JPanel getPnTop() {
		if (pnTop == null) {
			pnTop = new JPanel();
			pnTop.setLayout(new FlowLayout());
			pnTop.add(getBtNew(), null);
			pnTop.add(getBtStart(), null);
			pnTop.add(getBtStop(), null);
		}
		return pnTop;
	}

	/**
	 * This method initializes pnCenter	
	 * 	
	 * @return javax.swing.JPanel	
	 */
	private JPanel getPnCenter() {
		if (pnCenter == null) {
			pnCenter = new JPanel();
			pnCenter.setLayout(new BorderLayout());
			pnCenter.add(getTabuleiro(), BorderLayout.CENTER);
		}
		return pnCenter;
	}

	/**
	 * This method initializes btNew	
	 * 	
	 * @return javax.swing.JButton	
	 */
	private JButton getBtNew() {
		if (btNew == null) {
			btNew = new JButton();
			btNew.setText("Novo");
			btNew.addActionListener(new java.awt.event.ActionListener() {
				public void actionPerformed(java.awt.event.ActionEvent e) {
					getTabuleiro().reset();
				}
			});
		}
		return btNew;
	}
	
	private TabuleiroUI getTabuleiro() {
		if (tabuleiro == null) {
			tabuleiro = new TabuleiroUI(5, 5);
		}
		
		return tabuleiro;
	}

	/**
	 * This method initializes btStart	
	 * 	
	 * @return javax.swing.JButton	
	 */
	private JButton getBtStart() {
		if (btStart == null) {
			btStart = new JButton();
			btStart.setText("Iniciar");
			btStart.addActionListener(new java.awt.event.ActionListener() {
				public void actionPerformed(java.awt.event.ActionEvent e) {
					getBtNew().setEnabled(Boolean.FALSE);
					getBtStart().setEnabled(Boolean.FALSE);
					getBtStop().setEnabled(Boolean.TRUE);
					getPlayer().start();
				}
			});
		}
		return btStart;
	}

	/**
	 * This method initializes btStop	
	 * 	
	 * @return javax.swing.JButton	
	 */
	private JButton getBtStop() {
		if (btStop == null) {
			btStop = new JButton();
			btStop.setText("Parar");
			btStop.addActionListener(new java.awt.event.ActionListener() {
				public void actionPerformed(java.awt.event.ActionEvent e) {
					getBtNew().setEnabled(!getBtNew().isEnabled());
					getBtStart().setEnabled(!getBtStart().isEnabled());
					getBtStop().setEnabled(!getBtStop().isEnabled());
					isPlaying = Boolean.FALSE;
				}
			});
		}
		return btStop;
	}
	
	private Thread getPlayer() {
		if (!isPlaying) {
			player = new Thread(new Runnable() {
				
				@Override
				public void run() {
					isPlaying = Boolean.TRUE;
					while(true) {
						try {
							getTabuleiro().nextGeneration();
							getTabuleiro().repaint();
							Thread.sleep(1000);
							System.out.println("Rodando: "+new Date().getTime());
						} catch (InterruptedException e) {
							throw new RuntimeException(e);
						}
					}
				}
			});
			
			player.setPriority(5);
		}
		
		return player;
	}
	
}

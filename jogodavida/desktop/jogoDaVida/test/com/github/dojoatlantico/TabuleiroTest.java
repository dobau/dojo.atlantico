package com.github.dojoatlantico;

import java.util.Arrays;

public class TabuleiroTest {

	public static void teste() {
		Tabuleiro tabuleiro = new Tabuleiro(5, 5);
		tabuleiro.createLife(2, 2);
		tabuleiro.createLife(2, 3);
		tabuleiro.createLife(2, 4);
		tabuleiro.createLife(3, 2);
		tabuleiro.createLife(4, 3);

		tabuleiro.nextGeneration();
		
		String a[][] = tabuleiro.toArray();
		String b[][] = new String[][] {
			{".", ".", ".", ".", "."},
			{".", ".", ".", "*", "."},
			{".", ".", "*", "*", "."},
			{".", ".", "*", ".", "*"},
			{".", ".", ".", ".", "."}
		};
		
		for (int i = 0; i < a.length; i++) {
			for (int j = 0; j < a[i].length; j++) {
				System.out.print(a[i][j]);
			}
			System.out.println();
		}
		
		System.out.println(Arrays.equals(a, b));
		
	}
	
	public static void main(String[] args) {
		teste();
	}
	
}

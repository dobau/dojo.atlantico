package com.github.dojoatlantico;

public class Celula {

	private Boolean alive;
	
	public Celula() {
		this.alive = Boolean.FALSE;
	}

	public boolean isAlive() {
		return this.alive;
	}

	public void die() {
		alive = Boolean.FALSE;
	}

	public void born() {
		alive = Boolean.TRUE;
	}
	
}

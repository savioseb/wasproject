package com.savio.waslyzer.beans.impl;

public final class WordInfo extends AbstractNameInfo {
	
	private int count;
	
	public WordInfo() {
	}

	public WordInfo(final String n) {
		name = n;
		count = 1;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public void incrementCount() {
		count++;
	}
	
}
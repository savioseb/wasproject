package com.savio.waslyzer.beans.impl;

import java.util.ArrayList;
import java.util.Collection;

public class SongInfo extends AbstractNameInfo {
	
	private String alternateName;
	private Collection<WordInfo> wordInfos;
	private transient ArrayList<String> newNonuniqueWords;

	public String getAlternateName() {
		return alternateName;
	}

	public void setAlternateName(String alternateName) {
		this.alternateName = alternateName;
	}

	public Collection<WordInfo> getWordInfos() {
		return wordInfos;
	}

	public void setWordInfos(Collection<WordInfo> wordInfos) {
		this.wordInfos = wordInfos;
	}

	public ArrayList<String> getNewNonuniqueWords() {
		return newNonuniqueWords;
	}

	public void setNewNonuniqueWords(ArrayList<String> newNonuniqueWords) {
		this.newNonuniqueWords = newNonuniqueWords;
	}
	
	
	
	

}

package com.savio.waslyzer.resource.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import com.google.gson.Gson;
import com.savio.waslyzer.beans.impl.SongInfo;
import com.savio.waslyzer.beans.impl.WordInfo;
import com.savio.waslyzer.dao.impl.SongDao;
import com.savio.waslyzer.dao.impl.WordDao;
import com.savio.waslyzer.util.api.ISongName;


public final class SongAnalyzerResource implements ISongName {
	
	private final HashMap<String, WordInfo> wordMap = new HashMap<String, WordInfo>();
	private final HashMap<String,WordInfo> addedWordMap = new HashMap<String, WordInfo>();
	private final HashMap<String, String> nonUniqueWordMap = new HashMap<String, String>();
	private final ArrayList<String> newNonUniqueWords = new ArrayList<String>();
	private final SongInfo songInfo = new SongInfo();
	
	
	public SongAnalyzerResource() {
		new WordDao(1).initialize(wordMap, nonUniqueWordMap);
	}
	
	
	public static void main( String[] args ) throws Exception {
		final File file = new File( SONG_FILE_PATH + GLORIFIED + EXTENSION );
		final FileReader fileReader = new FileReader( file );
		final BufferedReader bufferedReader = new BufferedReader( fileReader );
		final SongAnalyzerResource songAnalyzerResource = new SongAnalyzerResource();
		songAnalyzerResource.readText(bufferedReader);
		songAnalyzerResource.saveTheWords();
	}
	
	private void readText(final BufferedReader bufferedReader ) throws Exception {
		String line = bufferedReader.readLine();
		do {
			tokenizeLine( line );
			line = bufferedReader.readLine();
		} while( null != line );
		
		System.out.println( "Word MAP: " + new Gson().toJson( wordMap ) );
		System.out.println( " Non unique: " + new Gson().toJson( nonUniqueWordMap ) );
	}
	
	private void saveTheWords() throws Exception {
		getSongInfoFromUserInput(songInfo);
		songInfo.setWordInfos( addedWordMap.values() );
		songInfo.setNewNonuniqueWords( newNonUniqueWords );
		new SongDao( 1 ).put(songInfo);
	}
	
	private void getSongInfoFromUserInput( final SongInfo songInfo ) throws Exception {
		final BufferedReader bufferedReader = new BufferedReader( new InputStreamReader( System.in ) );
		String songName = null;
		do {
			System.out.println( "\n\n\nSong Name: " );
			songName = bufferedReader.readLine().trim();
		} while ( 3 > songName.length() );
		songInfo.setName( songName );
		System.out.println( "Alternate name/names " );
		final String alternateName = bufferedReader.readLine().trim();
		songInfo.setAlternateName( ( 0 == alternateName.length() )? null: alternateName );
	}
	
	
	
	private void tokenizeLine( final String line ) throws Exception {
		final StringTokenizer tokenizer = new StringTokenizer( line , " ';,-.!:()\"\'?" );
		while( tokenizer.hasMoreTokens() ) {
			final String word = tokenizer.nextToken().trim().toLowerCase();
			// check String length
			if( 3 < word.length() ) {
				songInfo.incrementCount();
				isWordUnique(word);
			}
		}
	}
	
	private void isWordUnique( final String word ) throws Exception {
		// check if word belongs to the unique word set
		final WordInfo isWordUnique = wordMap.get( word );
		if( null != isWordUnique ) {
			isWordUnique.incrementCount();
			addedWordMap.put( word, isWordUnique);
		} else {
			// check if word belongs to non-unique word
			final String isWordNonUnique = nonUniqueWordMap.get( word );
			if( null == isWordNonUnique ) {
				isWordUniqueAskUser(word);
			}
		}
	}
	
	private void isWordUniqueAskUser( final String word) throws Exception {
		System.out.println( "Is \"" + word + "\" unique? (y/n)" );
		final BufferedReader bufferedReader = new BufferedReader( new InputStreamReader( System.in ) );
		final int choice = bufferedReader.read();
		if( 121 == choice ) {
			final WordInfo wordObj = new WordInfo( word );
			wordMap.put( word , wordObj );
			addedWordMap.put( word, wordObj);
		} else {
			nonUniqueWordMap.put( word, word);
			newNonUniqueWords.add( word );
		}
	}

}

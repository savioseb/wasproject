package com.savio.waslyzer.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Logger;

import com.savio.waslyzer.beans.impl.WordInfo;
import com.savio.waslyzer.dao.api.IWordDao;


public final class WordDao extends AbstractNameDao implements IWordDao {
	
	private static final Logger LOGGER = Logger.getLogger(WordDao.class.getName() );
	
	public WordDao(){
		super( TBL_WORD );
	}
	
	public WordDao( final int jdbc ) {
		super(TBL_WORD, jdbc);
	}
	
	public WordDao( final Connection connection ) {
		super( TBL_WORD, connection );
	}
	
	public void initialize( final HashMap<String, WordInfo> wordMap, final HashMap<String, String> nonUniqueWordMap ) {
		try {
			getWords( wordMap );
			getNonQuiqueWords(nonUniqueWordMap);
			connection.commit();
		} catch( final SQLException e ) {
			exceptionHandler(e, LOGGER);
		} finally {
			finallyMethod();
		}
	}
	
	private void getWords( final HashMap<String, WordInfo> wordMap ) throws SQLException {
		final PreparedStatement statement = connection.prepareStatement( GET_WORDS_SQL );
		final ResultSet resultSet = statement.executeQuery();
		while( resultSet.next() ) {
			final WordInfo wordInfo = new WordInfo();
			wordInfo.setId( resultSet.getLong( ID ) );
			wordInfo.setName( resultSet.getString( NAME ) );
			wordMap.put( wordInfo.getName() , wordInfo );
		}
		resultSet.close();
		statement.close();
	}
	
	private void getNonQuiqueWords( final HashMap<String, String> nonUniqueWordMap ) throws SQLException {
		final PreparedStatement statement = connection.prepareStatement( GET_NON_UNIQUE_WORDS_SQL );
		final ResultSet resultSet = statement.executeQuery();
		while( resultSet.next() ) {
			final String word = resultSet.getString( NAME ); 
			nonUniqueWordMap.put( word, word );
		}
		resultSet.close();
		statement.close();
	}

}

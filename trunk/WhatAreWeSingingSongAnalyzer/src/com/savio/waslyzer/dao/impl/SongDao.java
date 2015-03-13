package com.savio.waslyzer.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Logger;

import com.savio.waslyzer.beans.impl.SongInfo;
import com.savio.waslyzer.beans.impl.WordInfo;
import com.savio.waslyzer.dao.api.ISongDao;

public class SongDao extends AbstractDao implements ISongDao {
	
	private WordDao wordDao = null;
	private NonuniqueWordDao nonuniqueWordDao = null;
	
	public SongDao() {
	}
	
	public SongDao( int jdbc ) {
		super(jdbc);
	}
	
	private static final Logger LOGGER = Logger.getLogger( SongDao.class.getName() );

	/**
	 * Things to do
	 * - save the song Info in SongTable ( Name, alternate name )
	 * - get the id of the song just added using 'SELECT LAST_INSERT_ID();'
	 * - Insert the WordMap Table
	 *     - check if it is a new word - the object will not have an ID 
	 *         - then save into WordTable
	 *         - get the id of the inserted row
	 *     - insert row into SongWordMapTable
	 * - Insert the new non-unique words
	 * @param songInfo
	 */
	public void put( final SongInfo songInfo ) {
		try {
			insertSongInfo( songInfo );
			insertSongWordMap(songInfo);
			if( 0 != songInfo.getNewNonuniqueWords().size() ) {
				nonuniqueWordDao =  new NonuniqueWordDao(connection);
				nonuniqueWordDao.put( songInfo.getNewNonuniqueWords() );
			}
			connection.commit();
		} catch( final SQLException ex ) {
			songInfo.setDbError(true);
			exceptionHandler(ex, LOGGER);
		} finally {
			finallyMethod();
		}
	}
	
	public final void finalize() {
		if( null != wordDao ) {
			wordDao.finalize();
		}
		if( null != nonuniqueWordDao ) {
			nonuniqueWordDao.finalize();
		}
		super.finalize();
	}
	
	private void insertSongWordMap( final SongInfo songInfo ) throws SQLException {
		final Collection<WordInfo> wordInfos = songInfo.getWordInfos();
		wordDao = new WordDao(connection);
		final PreparedStatement insertSongWordMapStatement = connection.prepareStatement( INSERT_SONG_WORD_MAP );
		for( final WordInfo wordInfo: wordInfos ) {
			if( 0 == wordInfo.getId() ) {
				wordDao.put( wordInfo );
				wordInfo.setId( wordDao.getLastId() );
			}
			insertSongWordMapStatement.setLong( 1, songInfo.getId() );
			insertSongWordMapStatement.setLong( 2, wordInfo.getId() );
			insertSongWordMapStatement.setInt( 3, wordInfo.getCount() );
			insertSongWordMapStatement.executeUpdate();
		}
		insertSongWordMapStatement.close();
	}
	

	private void insertSongInfo( final SongInfo songInfo ) throws SQLException {
		final PreparedStatement statement = connection.prepareStatement( INSERT_SONG_INFO );
		statement.setString( 1 , songInfo.getName() );
		statement.setString( 2 , songInfo.getAlternateName() );
		statement.setInt( 3 , songInfo.getCount() );
		statement.executeUpdate();
		statement.close();
		songInfo.setId( getLastId() );
	}
	
	
}
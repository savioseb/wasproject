package com.savio.waslyzer.dao.api;

public interface ITableInfo {
	
	public static final String ID = "id";
	public static final String NAME = "name";
	
	public static final String LAST_ID = " SELECT LAST_INSERT_ID(); ";
	public static final String INS_SQL = " INSERT INTO ";
	
	public static final String NAME_INSERTS = " ( " + NAME + " ) " + " VALUES ( ? ) ";
	public static final String NAME_SELECTS = " SELECT " + ID + " , " + NAME + " FROM ";
	
	public static final String TBL_NON_UNIQUE_WORD = "NonuniqueWordTable";
	public static final String TBL_WORD = "WordTable";
	
	
	public static final String TBL_SONG = "SongTable";
	public static final String SONG_ALTERNATE_NAME = "alternateName";
	
	public static final String TBL_MAP_SONG_WORD = "SongWordMapTable";
	public static final String SONG_ID = "songId";
	public static final String WORD_ID = "wordId";
	public static final String COUNT = "count";
	
	
	

}

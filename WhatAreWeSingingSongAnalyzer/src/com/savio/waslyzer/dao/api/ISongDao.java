package com.savio.waslyzer.dao.api;

import com.savio.waslyzer.util.api.IProjectSettings;

public interface ISongDao extends ITableInfo, IProjectSettings {
	
	public static final String INSERT_SONG_INFO = INS_SQL + TBL_SONG + " ( " + NAME + " , " + 
	SONG_ALTERNATE_NAME + " ) VALUES ( ? , ? ) ";
	
	
	public static final String INSERT_SONG_WORD_MAP = " INSERT INTO " + TBL_MAP_SONG_WORD + " ( " +
	SONG_ID + " , " + WORD_ID + " , " + COUNT + " ) VALUES ( ? , ? , ? ) ";
	 

}

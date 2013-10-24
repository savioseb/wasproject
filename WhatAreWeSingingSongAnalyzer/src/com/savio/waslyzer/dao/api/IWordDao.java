package com.savio.waslyzer.dao.api;

public interface IWordDao extends ITableInfo {
	
	public static final String GET_WORDS_SQL = NAME_SELECTS + TBL_WORD;
	public static final String GET_NON_UNIQUE_WORDS_SQL = NAME_SELECTS + TBL_NON_UNIQUE_WORD;
	

}

package com.savio.waslyzer.dao.impl;

import java.sql.Connection;

public final class NonuniqueWordDao extends AbstractNameDao {
	
	public NonuniqueWordDao() {
		super( TBL_NON_UNIQUE_WORD );
	}
	
	public NonuniqueWordDao( int jdbc ) {
		super( TBL_NON_UNIQUE_WORD, jdbc );
	}
	
	public NonuniqueWordDao( final Connection connection ) {
		super( TBL_NON_UNIQUE_WORD, connection );
	}

}

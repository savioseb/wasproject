package com.savio.waslyzer.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Logger;

import com.savio.waslyzer.beans.impl.AbstractNameInfo;
import com.savio.waslyzer.dao.api.INameDao;

public abstract class AbstractNameDao extends AbstractDao implements INameDao {
	
	private PreparedStatement insertNameStatement = null;
	private final String TABLE_NAME;
	
	private static final Logger LOGGER = Logger.getLogger( AbstractNameDao.class.getName() );
	
	AbstractNameDao( final String TABLE_NAME ) {
		super();
		this.TABLE_NAME = TABLE_NAME;
	}
	
	AbstractNameDao( final String TABLE_NAME, final int jdbc) {
		super(jdbc);
		this.TABLE_NAME = TABLE_NAME;
	}
	
	AbstractNameDao( final String TABLE_NAME, final Connection connection ) {
		super(connection);
		this.TABLE_NAME = TABLE_NAME;
	}
	
	
	
	@Override
	public final void finalize() {
		try {
			if( null != insertNameStatement && !insertNameStatement.isClosed() ) {
				insertNameStatement.close();
			}
		}  catch (final SQLException e2) {
			exceptionHandler(e2, LOGGER);
		}  catch (final Exception ex) {
			exceptionHandler( ex, LOGGER);
		}
		super.finalize();
	}

	@Override
	public final Collection<AbstractNameInfo> gets() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public final void get(AbstractNameInfo abstractNameInfo) {
		// TODO Auto-generated method stub
	}

	/**
	 * Since this method is called from other DAOs we do not close or COMMIT the DB Connection
	 */
	@Override
	public final void put( final AbstractNameInfo nameInfo ) {
		try {
			insertNameStatement = ( null != insertNameStatement )? insertNameStatement: connection.prepareStatement( INS_SQL + TABLE_NAME + NAME_INSERTS  );
			insertNameStatement.setString( 1 , nameInfo.getName() );
			insertNameStatement.executeUpdate();
			
		} catch ( final SQLException e) {
			nameInfo.setDbError(true);
			exceptionHandler(e, LOGGER);
		}
	}
	
	/**
	 * Since this method is called from other DAOs we do not close or COMMIT the DB Connection
	 */
	@Override
	public final void put( final Collection<String> names ) {
		try {
			insertNameStatement = ( null != insertNameStatement )? insertNameStatement: connection.prepareStatement( INS_SQL + TABLE_NAME + NAME_INSERTS  );
			for( final String name: names ) {
				insertNameStatement.setString( 1 , name );
				insertNameStatement.executeUpdate();
			}
		} catch ( final SQLException e) {
			exceptionHandler(e, LOGGER);
		}
	}
	

}
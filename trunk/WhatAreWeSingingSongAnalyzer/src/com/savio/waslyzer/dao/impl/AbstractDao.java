package com.savio.waslyzer.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.savio.waslyzer.dao.api.IDao;

abstract class AbstractDao implements IDao {
	
	private static final Logger LOGGER = Logger.getLogger(AbstractDao.class.getName() );
	private static PreparedStatement getLastIdStatement = null;
	
	protected Connection connection = null;
	
	
	protected AbstractDao() {
		createJNDIConnection();
	}
	
	protected AbstractDao( final Connection connection1 ) {
		connection = connection1;
	}
	
	protected AbstractDao( final boolean isLazy  ) {
		if( !isLazy ) {
			createJNDIConnection();
		}
	}
	
	protected AbstractDao( final int jdbc ) {
		createJDBCConnection();
	}
	
	protected final void createJNDIConnection() {
		try {
			final Context ctx = new InitialContext();
		    final DataSource ds = (DataSource)ctx.lookup(DB_CONTEXT_LOOKUP);
		    if (ds != null) {
		        connection = ds.getConnection();
		    }
		    connection.setAutoCommit( false );
		} catch (final NamingException e) {
			LOGGER.severe( e.toString() );
			connection = null;
		} catch (final SQLException e) {
			LOGGER.severe( e.toString() );
			connection = null;
		}
	}
	
	protected final void createJDBCConnection() {
		try {
			connection = DriverManager.getConnection( DB_URL, DB_USER, DB_PASSWORD);
		    connection.setAutoCommit( false );
		} catch (final SQLException e) {
			LOGGER.severe( e.toString() );
			connection = null;
		}
	}
	
	
	protected final void finallyMethod() {
		try {
			if( null != getLastIdStatement && !getLastIdStatement.isClosed() ) {
				getLastIdStatement.close();
				getLastIdStatement = null;
			}
			if( null != connection && !connection.isClosed() ) {
				connection.close();
				connection = null;
			}
		}  catch (final SQLException e2) {
			exceptionHandler(e2, LOGGER);
		}  catch (final Exception ex) {
			exceptionHandler( ex, LOGGER);
		}
	}
	
	@Override
	public void finalize() {
		finallyMethod();
	}
	

	protected final void exceptionHandler( final Exception e, final Logger logger ) {
		logger.log( Level.SEVERE, logger.getName() + " " + e.toString() );
		if( IS_DEBUG_DAO ) {
			logger.log( Level.SEVERE , logger.getName() + " " + e.toString(), e );
			e.printStackTrace();
		}
	}
	
	protected final long getLastId() throws SQLException {
		final long ID;
		getLastIdStatement = (null != getLastIdStatement)? getLastIdStatement: connection.prepareStatement( LAST_ID );
		final ResultSet lastIdResultSet = getLastIdStatement.executeQuery();
		ID = ( lastIdResultSet.next() )? lastIdResultSet.getLong( 1 ) : 0;
		lastIdResultSet.close();
		return ID;
	}
	
	

}

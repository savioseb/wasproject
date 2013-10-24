package com.savio.waslyzer.dao.api;

import java.util.Collection;

import com.savio.waslyzer.beans.impl.AbstractNameInfo;

public interface INameDao {
	
	public Collection<AbstractNameInfo> gets();
	public void get( final AbstractNameInfo abstractNameInfo );
	public void put( final AbstractNameInfo abstractNameInfo );
	public void put( final Collection<String> names );

}

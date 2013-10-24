package com.savio.waslyzer.beans.impl;

import com.google.gson.Gson;

public abstract class AbstractNameInfo {
	
	protected long id;
	protected String name;
	protected transient boolean isDbError = false;
	
	@Override
	public final String toString() {
		return new Gson().toJson( this );
	}
	
	public final long getId() {
		return id;
	}
	
	public final void setId(long id) {
		this.id = id;
	}
	
	public final String getName() {
		return name;
	}
	
	public final void setName(String name) {
		this.name = name;
	}

	public final boolean isDbError() {
		return isDbError;
	}

	public final void setDbError(boolean isDbError) {
		this.isDbError = isDbError;
	}
	
	

}
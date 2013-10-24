package com.savio.waslyzer.dao.api;

import java.util.logging.Logger;

import com.savio.waslyzer.util.api.IProjectSettings;

public interface IDao extends IProjectSettings, ITableInfo {
	
	public static final String DB_CONTEXT_LOOKUP = "java:comp/env/jdbc/wasdb";
	
	public static final String DB_URL = "jdbc:mysql://localhost:3306/wasdb";
    public static final String DB_USER = "root";
    public static final String DB_PASSWORD = "root123";
	
}

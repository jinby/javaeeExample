package com.self.usermanager.Utils;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.springframework.beans.factory.annotation.Value;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
    @Value("db.url")
    private String url;
    @Value("db.driveclass")
    private String driveClass;
    @Value("db.username")
    private String userName;
    @Value("db.password")
    private String password;

    public static Connection getConnection() throws SQLException,ClassNotFoundException
    {
        Connection conn = null;
        if ( conn != null  )
            return conn;

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","1234");

        return conn;
    }

}

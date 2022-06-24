package common;


import java.sql.*;
import java.util.*;

public class DBConMgr{
    private Vector connections = new Vector(10);
    private String _driver = "com.mysql.cj.jdbc.Driver",
    _url = "jdbc:mysql://localhost:3307/workjob",
    _user = "root",
    _password = "1234";
    private boolean _traceOn = true;
    private boolean initialized = false;
    private int _openConnections = 10; // 커넥션 객체 개수를 지정

    // 싱글턴 패턴(Singleton Pattern)
    private static DBConMgr instance = null;
    
    public DBConMgr() {
    }

    /** Use this method to set the maximum number of open connections before
     unused connections are closed.
     */
    
    // 싱글턴 문법
    // 객체를 일일이 만드는 것이 아니라 getInstance 메소드 안에 따로 만들어 줘서
    // 필요할 때마다 해당 메소드를 통해 그 객체를 반환해 줌
    // 이때 static을 해 줌으로 따로 객체를 만들지 않아도 접근 가능함
    public static DBConMgr getInstance() {
        if (instance == null) {
            synchronized (DBConMgr.class) {
                if (instance == null) {
                    instance = new DBConMgr();
                }
            }
        }
        return instance;
    }

    public void setOpenConnectionCount(int count) {
        _openConnections = count;
    }

    public void setEnableTrace(boolean enable) {
        _traceOn = enable;
    }

    /** Returns a Vector of java.sql.Connection objects */
    public Vector getConnectionList() {
        return connections;
    }

    /** Opens specified "count" of connections and adds them to the existing pool */
    public synchronized void setInitOpenConnections(int count)
            throws SQLException {
        Connection c = null;
        ConnectionObject co = null;
        
        for (int i = 0; i < count; i++) {
            c = createConnection();
            co = new ConnectionObject(c, false);
            connections.addElement(co);
            trace("ConnectionPoolManager: Adding new DB connection to pool (" + connections.size() + ")");
        }
    }

    /** Returns a count of open connections */
    public int getConnectionCount() {
        return connections.size();
    }

    /** Returns an unused existing or new connection.  */
    public synchronized Connection getConnection()
            throws Exception {
        if (!initialized) {
            Class c = Class.forName(_driver);
            DriverManager.registerDriver((Driver) c.newInstance());
            initialized = true;
        }
        Connection c = null;
        ConnectionObject co = null;
        boolean badConnection = false;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.get(i);
            // If connection is not in use, test to ensure it's still valid!
            if (!co.inUse) {
                try {
                	// 접속이 이미 된 것들은 닫아줌
                    badConnection = co.connection.isClosed();
                    if (!badConnection)
                        badConnection = (co.connection.getWarnings() != null);
                } catch (Exception e) {
                    badConnection = true;
                    e.printStackTrace();
                }
                // Connection is bad, remove from pool
                if (badConnection) {
                    connections.removeElementAt(i);
                    trace("ConnectionPoolManager: Remove disconnected DB connection #" + i);
                    continue;
                }
                c = co.connection;
                co.inUse = true;
                trace("ConnectionPoolManager: Using existing DB connection #" + (i + 1));
                break;
            }
        }

        if (c == null) {
            c = createConnection();
            co = new ConnectionObject(c, true);
            // 비워진 부분은 채워줌
            connections.addElement(co);
            trace("ConnectionPoolManager: Creating new DB connection #" + connections.size());
        }
        return c;
    }

    /** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
    public synchronized void freeConnection(Connection c) {
        if (c == null)
            return;

        ConnectionObject co = null;
        
        // 반복문 돌면서 같은 객체가 있으면 해당 인덱스를 다시 쓸 수 있게끔 해 줌
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.get(i);
            if (c == co.connection) {
                co.inUse = false;
                break;
            }
        }

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.get(i);
            // 현재 사용하는 수(10개)에 맞게 제한함
            if ((i + 1) > _openConnections && !co.inUse)
                removeConnection(co.connection);
        }
    }

    public void freeConnection(Connection c, PreparedStatement p, ResultSet r) {
        try {
            if (r != null) r.close();
            if (p != null) p.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, Statement s, ResultSet r) {
        try {
            if (r != null) r.close();
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, PreparedStatement p) {
        try {
            if (p != null) p.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, Statement s) {
        try {
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
    // synchronized: 동시 접속 제한하는 기능
    public synchronized void removeConnection(Connection c) {
        if (c == null)
            return;

        ConnectionObject co = null;
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.get(i);
            if (c == co.connection) {
                try {
                    c.close();
                    connections.removeElementAt(i);
                    trace("Removed " + c.toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }

    private Connection createConnection()
            throws SQLException {
        Connection con = null;
        
        try {
            if (_user == null)
                _user = "";
            if (_password == null)
                _password = "";

            Properties props = new Properties();
            props.put("user", _user);
            props.put("password", _password);

            con = DriverManager.getConnection(_url, props);
        } catch (Throwable t) {
            throw new SQLException(t.getMessage());
        }
        return con;
    }

    /** Closes all connections and clears out the connection pool */
    public void releaseFreeConnections() {
        trace("ConnectionPoolManager.releaseFreeConnections()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.get(i);
            if (!co.inUse)
                removeConnection(co.connection);
        }
    }

    /** Closes all connections and clears out the connection pool */
    public void finalize() {
        trace("ConnectionPoolManager.finalize()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.get(i);
            try {
                co.connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            co = null;
        }
        connections.removeAllElements();
    }

    private void trace(String s) {
        if (_traceOn)
            System.err.println(s);
    }
}
// Wrapper Class
// 한 클래스에서 하는 기능과 추가로 어떠한 기능을 쓰고싶을때 관리하기 편하도록 하나로 묶어서(래핑) 클래스화 시킴 
class ConnectionObject {
    public java.sql.Connection connection = null;	// 커넥션 객체
    public boolean inUse = false;					// 커넥션이 사용되고 있는지 아닌지 확인

    public ConnectionObject(Connection c, boolean useFlag) {
        connection = c;
        inUse = useFlag;
    }
}
package com.self.usermanager.Dao;

import com.mysql.cj.xdevapi.SqlDataResult;
import com.self.usermanager.Bean.Customer;
import com.self.usermanager.Bean.CustomerQueryVo;
import com.self.usermanager.Bean.PageBean;
import com.self.usermanager.Utils.ConnectionManager;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@Repository(value = "customerDao")
public class CustomerDaoImpl implements CustomerDao{

    private Connection conn = null;

    public void insert(Customer customer) throws Exception{
         if ( conn == null || conn.isClosed())
                conn = ConnectionManager.getConnection();

        String sql = "INSERT INTO t_customer VALUES(?,?,?,?,?,?)";

        int result = new QueryRunner().update(conn, sql , new Object[] {
                customer.getId(),
                customer.getName(),
                customer.getGender(),
                customer.getPhone(),
                customer.getEmail(),
                customer.getDescription()
            });
        if (0 < result)
            System.out.println( customer + "数据插入成功...");
    }

    public void update(String id , Customer customer) throws Exception
    {
        if ( conn == null || conn.isClosed())
            conn = ConnectionManager.getConnection();

        QueryRunner qr = new QueryRunner();
        String sql = "UPDATE t_customer SET id=?,name=?,gender=?,phone=?,email=?,description=? WHERE id=?";
        qr.update( conn, sql, new Object[]{
                customer.getId(),
                customer.getName(),
                customer.getGender(),
                customer.getPhone(),
                customer.getEmail(),
                customer.getDescription(),
                id} );
    }

    private StringBuffer getQuerySql(CustomerQueryVo customerQueryVo)
    {
        StringBuffer queryCondition = new StringBuffer("");
        if (customerQueryVo.getName() != null && customerQueryVo.getName().length() > 0 ) {
            if (queryCondition.length() == 0)
                queryCondition.append(" WHERE ");
            queryCondition.append(String.format("name like '%%%s%%'", customerQueryVo.getName()));
        }
        if (customerQueryVo.getEmail() != null && customerQueryVo.getEmail().length() > 0 ){
            if (queryCondition.length() == 0)
                queryCondition.append(" WHERE ");
            else
                queryCondition.append(" AND ");
            queryCondition.append(String.format("email like '%%%s%%'", customerQueryVo.getEmail()));
        }

        if (customerQueryVo.getGender() != null && customerQueryVo.getGender().length() > 0 ) {
            if (queryCondition.length() == 0)
                queryCondition.append(" WHERE ");
            else
                queryCondition.append(" AND ");

            queryCondition.append(String.format("gender = '%s'", customerQueryVo.getGender()));
        }
        if (customerQueryVo.getPhone() != null && customerQueryVo.getPhone().length() > 0 ){

            if (queryCondition.length() == 0)
                queryCondition.append(" WHERE ");
            else
                queryCondition.append(" AND ");
            queryCondition.append(String.format("phone like '%%%s%%'", customerQueryVo.getPhone()));
        }

        return queryCondition;
    }
    public int GetTotalCount(CustomerQueryVo customerQueryVo) throws Exception {
        if ( conn == null || conn.isClosed())
            conn = ConnectionManager.getConnection();
//        QueryRunner qr = new QueryRunner();
//        String sql = "SELECT count(*) FROM t_customer";
//        //调用方法传递结果集的实现类BeanListHandler
//        //BeanListHandler(Class<T> type)
//        Object count = qr.query(conn, sql ,new ScalarHandler(1));

        QueryRunner qr = new QueryRunner();
        String sql;
        if ( customerQueryVo == null )
            sql = "SELECT count(*) FROM t_customer";
        else{

            StringBuffer querySql = new StringBuffer("SELECT count(*) FROM t_customer");
            StringBuffer queryCondition = getQuerySql(customerQueryVo);
            querySql.append(queryCondition);

            sql = querySql.toString();
        }

        Object count = qr.query(conn, sql ,new ScalarHandler(1));
        return Integer.parseInt(count.toString());
    }

    public PageBean<Customer> findPage(int pageNum, int pageSize,CustomerQueryVo customerQueryVo) throws Exception {
        if ( conn == null || conn.isClosed())
            conn = ConnectionManager.getConnection();

        PageBean<Customer> pb = new PageBean<Customer>(pageNum, pageSize, GetTotalCount(customerQueryVo) );
        int startindex = pb.getStartIndex();
        pb.setList(findList(startindex, pageSize, customerQueryVo) );
        return pb;
    }

    public List<Customer> findList(int startIndex, int pageSize, CustomerQueryVo customerQueryVo) throws Exception
    {
        if ( conn == null || conn.isClosed())
            conn = ConnectionManager.getConnection();

        QueryRunner qr = new QueryRunner();
        String sql;
        if ( customerQueryVo == null )
            sql = "SELECT * FROM t_customer LIMIT ?,?";
        else{
            StringBuffer querySql = new StringBuffer("SELECT * FROM t_customer");
            StringBuffer queryCondition = getQuerySql(customerQueryVo);

            querySql.append(queryCondition);
            querySql.append(" LIMIT ?,?");

            sql = querySql.toString();
        }
        //调用方法传递结果集的实现类BeanListHandler
        //BeanListHandler(Class<T> type)
        List<Customer> list = qr.query(conn, sql , new Object[]{startIndex, pageSize}, new BeanListHandler<Customer>(Customer.class));
        return list;
    }

    public List<Customer> find() throws Exception{
        if ( conn == null || conn.isClosed())
            conn = ConnectionManager.getConnection();

        QueryRunner qr = new QueryRunner();
        String sql = "SELECT * FROM t_customer";
        //调用方法传递结果集的实现类BeanListHandler
        //BeanListHandler(Class<T> type)
        List<Customer> list = qr.query(conn, sql, new BeanListHandler<Customer>(Customer.class));
        return list;
    }

    public Customer find(String id) throws Exception{
        if ( conn == null || conn.isClosed())
            conn = ConnectionManager.getConnection();

        QueryRunner qr = new QueryRunner();
        String sql = "SELECT * FROM t_customer WHERE id=?";
        //调用方法传递结果集的实现类BeanListHandler
        //BeanListHandler(Class<T> type)
        List<Customer> list = qr.query(conn, sql, new Object[]{id} ,new BeanListHandler<Customer>(Customer.class));
        if ( list.size() > 0 )
            return list.get(0);

        return null;
    }

    public void delete(Customer customer) throws Exception{
        if ( conn == null || conn.isClosed())
            conn = ConnectionManager.getConnection();

        QueryRunner qr = new QueryRunner();
        String sql="DELETE FROM t_customer WHERE id=?";
        int result = qr.update(conn, sql , new Object[] {customer.getId()} );
        if (0 < result)
            System.out.println( customer + "数据删除成功...");
    }

}

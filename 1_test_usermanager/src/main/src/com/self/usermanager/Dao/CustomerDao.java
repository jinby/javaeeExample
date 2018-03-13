package com.self.usermanager.Dao;

import com.self.usermanager.Bean.Customer;
import com.self.usermanager.Bean.CustomerQueryVo;
import com.self.usermanager.Bean.PageBean;

import java.sql.SQLException;
import java.util.List;


public interface CustomerDao {
    public void insert(Customer customer) throws Exception;
    public void update(String id,Customer customer) throws Exception;
    public List<Customer> find() throws Exception;
    public Customer find(String id) throws Exception;
    public void delete(Customer customer) throws Exception;
    public int GetTotalCount(CustomerQueryVo customerQueryVo) throws Exception;
    public PageBean<Customer> findPage(int pageNum, int pageSize, CustomerQueryVo customerQueryVo) throws Exception ;
    public List<Customer> findList(int startIndex, int pageSize, CustomerQueryVo customerQueryVo) throws Exception;

}

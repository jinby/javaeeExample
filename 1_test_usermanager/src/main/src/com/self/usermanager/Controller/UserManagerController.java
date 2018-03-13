package com.self.usermanager.Controller;

import com.alibaba.fastjson.JSON;
import com.self.usermanager.Bean.Customer;
import com.self.usermanager.Bean.CustomerQueryVo;
import com.self.usermanager.Bean.PageBean;
import com.self.usermanager.Dao.CustomerDao;
import org.apache.logging.log4j.core.config.plugins.validation.constraints.Required;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class UserManagerController {

    @Autowired
    private CustomerDao customerDao;

    @RequestMapping({"/add","/"})
    String index() throws Exception  { return "add";  }

    @RequestMapping({"/list"})
    String list() throws Exception {   return "list";  }

    @RequestMapping("/query")
    String query()
    {
        return "query";
    }

    @RequestMapping("/add_do")
    String add_do(Customer customer) throws Exception
    {
        customer.setId(UUID.randomUUID().toString());
        customerDao.insert(customer);
        return "add_result";
    }

    @RequestMapping("/update_pre/{id}")
    String update_pre(@PathVariable("id") String id, Model map) throws Exception
    {
        Customer customer = customerDao.find(id);
        map.addAttribute("customer", customer);
        return "update";
    }

    @RequestMapping("/update_do")
    String update_do(String id, Customer customer, Model map) throws Exception
    {
        customer.setId(id);
        customerDao.update(id,  customer);
        return "add_result";
    }

    @RequestMapping("/delete_pre/{id}")
    String delete_pre(@PathVariable String id) throws Exception
    {
        Customer customer = new Customer();
        customer.setId(id);;
        customerDao.delete(customer);
        return "add_result";
    }

    @RequestMapping("/list_ajax")
    String list_ajax()
    {return "list_ajax";}

    @RequestMapping("/ajaxQuery")
    @ResponseBody
    String ajaxQuery( Integer pageIndex, Integer pageSize,@RequestParam(required=false) CustomerQueryVo customerQueryVo) throws Exception
    {
        PageBean<Customer> pageBean = customerDao.findPage(pageIndex.intValue(), pageSize.intValue(), customerQueryVo);
        return JSON.toJSONString(pageBean);
    }
}

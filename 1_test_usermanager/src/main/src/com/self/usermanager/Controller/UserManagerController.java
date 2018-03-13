package com.self.usermanager.Controller;

import com.self.usermanager.Bean.Customer;
import com.self.usermanager.Bean.CustomerQueryVo;
import com.self.usermanager.Bean.PageBean;
import com.self.usermanager.Dao.CustomerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    String index()
    {
        return "add";
    }

    @RequestMapping({"/list","/list/{pagenum}"})
    String list(HttpSession session,@PathVariable(value = "pagenum",required = false) Integer pageNum, Model mode) throws Exception
    {
        CustomerQueryVo customerQueryVo = null;

        if ( pageNum == null)
        {
            pageNum = 1;
            session.removeAttribute("customerQueryVo");
        }
        else
        {
            if ( session.getAttribute("customerQueryVo") != null )
                customerQueryVo = (CustomerQueryVo) session.getAttribute("customerQueryVo");
        }

        PageBean<Customer> pageBean = customerDao.findPage(pageNum, 20, customerQueryVo);
        mode.addAttribute("pageBean", pageBean);
        return "list";
    }

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

    @RequestMapping("/researchdo")
    String researchdo(HttpSession session, CustomerQueryVo customerQueryVo, Model model) throws Exception
    {
        session.setAttribute("customerQueryVo", customerQueryVo );
        PageBean<Customer> pageBean = customerDao.findPage(1, 20, customerQueryVo);
        model.addAttribute("pageBean", pageBean);
        return "list";
    }
}

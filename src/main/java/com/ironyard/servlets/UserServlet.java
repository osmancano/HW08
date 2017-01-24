package com.ironyard.servlets;

import com.ironyard.data.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by osmanidris on 1/23/17.
 */
@WebServlet(name = "UserServlet", urlPatterns = "/createUser")
public class UserServlet extends HttpServlet {
    private final static String filePath = "/tmp/users.json";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first_name = request.getParameter("txtFirstName");
        String last_name = request.getParameter("txtLastName");
        int age = Integer.parseInt(request.getParameter("txtAge"));
        String city = request.getParameter("txtCity");
        String county = request.getParameter("txtCounty");
        User user = new User(first_name, last_name, age, city,county);
        user.writeUserToDisk(filePath);
        request.getSession().setAttribute("result","User info added successfuly.");
        String nextJSP = "/home.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<User> users_list = getUsersFromFile(filePath);
        request.getSession().setAttribute("users_list",users_list);
        String nextJSP = "/userinfo.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request,response);
    }

    public ArrayList<User> getUsersFromFile(String filePath){
        ArrayList<User> users_list = new ArrayList<User>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                User user = new User(line);
                users_list.add(user);
            }
        }catch (IOException e){
            e.printStackTrace();
        }
        return users_list;
    }
}

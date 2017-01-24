package com.ironyard.data;

import com.google.gson.Gson;

import java.io.FileWriter;
import java.io.IOException;

/**
 * Created by osmanidris on 1/23/17.
 */
public class User {
    private String first_name;
    private String last_name;
    private int age;
    private String city;
    private String county;

    public User(String first_name, String last_name, int age, String city, String county){
        this.first_name = first_name;
        this.last_name = last_name;
        this.age = age;
        this.city = city;
        this.county = county;
    }

    public User(String jsonInString){
        Gson gson = new Gson();
        User user = gson.fromJson(jsonInString, User.class);
        this.first_name = user.first_name;
        this.last_name = user.last_name;
        this.age = user.age;
        this.city = user.city;
        this.county = user.county;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public void writeUserToDisk(String filePath){

        try (FileWriter fw = new FileWriter(filePath,true)) {
            Gson gson = new Gson();
            gson.toJson(this, fw);
            fw.write("\n");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


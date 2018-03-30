package com.lxw.videoworld.domain;

import java.io.Serializable;


/**
 * 登录 时  提价的 个人信息 User info
 */
public class User implements Serializable {

    /* id */
    private String userId;
    /* 用户名 */
    private String userName;

    /* 密码 */
    private String password;

    /* 电话号码 */
    private String phone;
    /* 性别 */
    private int sex;
    /* 住址 */
    private String address;
    /* 公司名称 */
    private String company;


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }


    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", sex=" + sex +
                ", address='" + address + '\'' +
                ", company='" + company + '\'' +
                '}';
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

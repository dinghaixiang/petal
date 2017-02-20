package com.maiya.model;

/**
 * Created by beck on 2017/2/6.
 */
public class Random {
   private String userName;
   private String random;

    public Random() {
    }

    public Random(String userName, String random) {
        this.userName = userName;
        this.random = random;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRandom() {
        return random;
    }

    public void setRandom(String random) {
        this.random = random;
    }
}

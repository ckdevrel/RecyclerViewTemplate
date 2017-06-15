package com.takeoffandroid.recyclerviewtemplate.models;

import java.util.ArrayList;

public class AbstractModel {

    private String title;

    private String message;


    public AbstractModel(String title, String message) {
        this.title = title;
        this.message = message;
    }

    public AbstractModel() {

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}

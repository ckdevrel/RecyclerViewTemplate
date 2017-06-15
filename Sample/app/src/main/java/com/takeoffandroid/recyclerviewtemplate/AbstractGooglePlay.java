package com.takeoffandroid.recyclerviewtemplate;

import java.util.ArrayList;

public class AbstractGooglePlay {

    private String title;

    private String message;

    private ArrayList<AbstractGooglePlay> singleItemModelArrayList;

    public AbstractGooglePlay(String title, String message) {
        this.title = title;
        this.message = message;
    }

    public AbstractGooglePlay(String title, String message, ArrayList<AbstractGooglePlay> singleItemModelArrayList) {
        this.title = title;
        this.message = message;
        this.singleItemModelArrayList = singleItemModelArrayList;
    }


    public AbstractGooglePlay() {

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

    public ArrayList<AbstractGooglePlay> getSingleItemArrayList() {
        return singleItemModelArrayList;
    }

    public void setSingleItemArrayList(ArrayList<AbstractGooglePlay> singleItemModelArrayList) {
        this.singleItemModelArrayList = singleItemModelArrayList;
    }
}

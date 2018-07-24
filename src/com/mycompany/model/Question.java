package com.mycompany.model;

public class Question {

    private String body;

    private boolean response;

    public Question() {
    }

    public Question(String body, boolean response) {
        this.body = body;
        this.response = response;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public boolean isResponse() {
        return response;
    }

    public void setResponse(boolean response) {
        this.response = response;
    }
}

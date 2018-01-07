package com.scinter.www.model;

import java.io.Serializable;

public class Ticket implements Serializable {
    private String tid;

    private String ticket;

    private String errcode;

    private String errmsg;

    private String expiresIn;

    private String acquiretime;

    private String noncestr;

    private String timestamp;

    private static final long serialVersionUID = 1L;

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid == null ? null : tid.trim();
    }

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket == null ? null : ticket.trim();
    }

    public String getErrcode() {
        return errcode;
    }

    public void setErrcode(String errcode) {
        this.errcode = errcode == null ? null : errcode.trim();
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg == null ? null : errmsg.trim();
    }

    public String getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(String expiresIn) {
        this.expiresIn = expiresIn == null ? null : expiresIn.trim();
    }

    public String getAcquiretime() {
        return acquiretime;
    }

    public void setAcquiretime(String acquiretime) {
        this.acquiretime = acquiretime == null ? null : acquiretime.trim();
    }

    public String getNoncestr() {
        return noncestr;
    }

    public void setNoncestr(String noncestr) {
        this.noncestr = noncestr == null ? null : noncestr.trim();
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp == null ? null : timestamp.trim();
    }
}
package model;

import java.util.Date;

/**
 * 订单类
 *
 * @author cyh
 */

public class AccountDetail {
    private String id;//自增
    private String accountid; //帐号
    private String accountid2; //对方的帐号
    private String type; //交易方式
    private double amount;//金额
    private double balance; //余额
    private Date createTime;//订单创建时间

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccountid() {
        return accountid;
    }

    public void setAccountid(String accountid) {
        this.accountid = accountid;
    }

    public String getAccountid2() {
        return accountid2;
    }

    public void setAccountid2(String accountid2) {
        this.accountid2 = accountid2;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}

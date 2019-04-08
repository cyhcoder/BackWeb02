package model;

import java.util.Date;

public class AccountDetailDTO {

    private String id; //序号
    private String accountid; //自身id
    private Date createTime; //交易时间
    private Double amount; //交易金额
    private Double balance; //余额
    private String type; //类型
    private String accountid2; //对方ID
    private String name2; //对方姓名


    public void printString() {
        System.out.println("AccountDetailDTO [id=" + id + ", accountid=" + accountid + ", createTime=" + createTime + ", amount="
                + amount + ", balance=" + balance + ", type=" + type + ", accountid2=" + accountid2 + ", name2=" + name2
                + "]");
    }

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAccountid2() {
        return accountid2;
    }

    public void setAccountid2(String accountid2) {
        this.accountid2 = accountid2;
    }

    public String getName2() {
        return name2;
    }

    public void setName2(String name2) {
        this.name2 = name2;
    }
}

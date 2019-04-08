package model;

import javax.persistence.*;
import java.sql.Time;
import java.util.Objects;

/**
 * @Description
 * @Author cyh
 * @Version V1.0.0
 * @Since 1.0
 * @Date 2019/4/8
 */
@Entity
@Table(name = "ACCOUNT", schema = "BACK", catalog = "")
public class AccountEntity {
    private long id;
    private String accountid;
    private String name;
    private String pwd;
    private Long amount;
    private Time createtime;
    private Long status;

    @Id
    @Column(name = "ID", nullable = false, precision = 0)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "ACCOUNTID", nullable = false, length = 18)
    public String getAccountid() {
        return accountid;
    }

    public void setAccountid(String accountid) {
        this.accountid = accountid;
    }

    @Basic
    @Column(name = "NAME", nullable = false, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "PWD", nullable = false, length = 50)
    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Basic
    @Column(name = "AMOUNT", nullable = true, precision = 0)
    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "CREATETIME", nullable = true)
    public Time getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Time createtime) {
        this.createtime = createtime;
    }

    @Basic
    @Column(name = "STATUS", nullable = true, precision = 0)
    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AccountEntity that = (AccountEntity) o;
        return id == that.id &&
                Objects.equals(accountid, that.accountid) &&
                Objects.equals(name, that.name) &&
                Objects.equals(pwd, that.pwd) &&
                Objects.equals(amount, that.amount) &&
                Objects.equals(createtime, that.createtime) &&
                Objects.equals(status, that.status);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, accountid, name, pwd, amount, createtime, status);
    }
}

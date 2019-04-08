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
@Table(name = "ACCOUNTDETAIL", schema = "BACK", catalog = "")
public class AccountdetailEntity {
    private long id;
    private String type;
    private Long amount;
    private Time createtime;
    private Long balance;

    @Id
    @Column(name = "ID", nullable = false, precision = 0)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "TYPE", nullable = false, length = 50)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
    @Column(name = "BALANCE", nullable = true, precision = 0)
    public Long getBalance() {
        return balance;
    }

    public void setBalance(Long balance) {
        this.balance = balance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AccountdetailEntity that = (AccountdetailEntity) o;
        return id == that.id &&
                Objects.equals(type, that.type) &&
                Objects.equals(amount, that.amount) &&
                Objects.equals(createtime, that.createtime) &&
                Objects.equals(balance, that.balance);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, type, amount, createtime, balance);
    }
}

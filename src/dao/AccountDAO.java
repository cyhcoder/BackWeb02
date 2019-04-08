package dao;

import java.sql.*;

import db.*;
import model.*;

public class AccountDAO {

    private TransactionContext tran;

    public AccountDAO() {
    }

    public AccountDAO(TransactionContext tran) {
        this.tran = tran;
    }

    /**
     * 创建用户
     *
     * @param a
     * @return 0 表示没有插入
     * @throws Exception
     */
    public int addAccount(Account a) throws Exception {
        Connection conn = tran.getConnection();
        String sql = "insert into account(accountid,pwd,name,amount,id) values(?,?,?,?,ACCOUNTID1.nextval)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, a.getAccountid());
        pst.setString(2, a.getPassword());
        pst.setString(3, a.getName());
        pst.setDouble(4, a.getAmount());
        return pst.executeUpdate();
    }

    /**
     * 根据id查询用户
     *
     * @param id
     * @return null表示没有查到
     * @throws Exception
     */
    public Account findAccountByID(String id) throws Exception {
        Connection conn = tran.getConnection();
        String sql = "select accountid,name,amount from account where accountid=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, id);
        ResultSet rs = pst.executeQuery();
        Account a = null;
        if (rs != null && rs.next()) {
            a = new Account();
            a.setAccountid(rs.getString("accountid"));
            a.setName(rs.getString("name"));
            a.setAmount(rs.getDouble("amount"));
        }
        return a;
    }

    /**
     * 修改acount表里的amount列
     *
     * @param a
     * @param id
     * @return
     * @throws Exception
     */
    public int updateAmount(Account a, double m) throws Exception {
        Connection conn = tran.getConnection();
        String sql = "update account set amount=amount+? where accountid=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setDouble(1, m);
        pst.setString(2, a.getAccountid());
        return pst.executeUpdate();
    }

    /**
     * 修改amount表中的pwd列
     *
     * @param a
     * @param pwd
     * @return
     * @throws Exception
     */
    public int updatePwd(Account a, String pwd) throws Exception {
        Connection conn = tran.getConnection();
        String sql = "update account set pwd=? where accountid=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, pwd);
        pst.setString(2, a.getAccountid());
        return pst.executeUpdate();
    }

    /**
     * 根据id和密码查询
     *
     * @param id
     * @param pwd
     * @return
     * @throws Exception
     */
    public Account findAccountByIdPwd(String id, String pwd) throws Exception {
        Connection conn = tran.getConnection();
        String sql = "select accountid,name,amount,pwd from account where accountid=? and pwd=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, id);
        pst.setString(2, pwd);
        ResultSet rs = pst.executeQuery();
        Account a = null;
        if (rs != null && rs.next()) {
            a = new Account();
            a.setAccountid(rs.getString("accountid"));
            a.setName(rs.getString("name"));
            a.setAmount(rs.getDouble("amount"));
        }
        return a;
    }
}

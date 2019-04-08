package dao;

import java.sql.*;
import java.util.ArrayList;

import db.*;
import model.*;

public class AccountDetailDAO {
    private TransactionContext tran;

    public AccountDetailDAO() {
    }

    public AccountDetailDAO(TransactionContext tran) {
        this.tran = tran;
    }

    /**
     * 插入流水记录
     *
     * @param ad
     * @return 0 表示没有插入
     * @throws Exception
     */
    public int addAccountDetail(AccountDetail ad) throws Exception {
        Connection conn = tran.getConnection();
        String sql = "insert into accountdetail(accountid,accountid2,type,amount,balance,id) values(?,?,?,?,?,ACCOUNTDETAILID1.nextval)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, ad.getAccountid());
        pst.setString(2, ad.getAccountid2());
        pst.setString(3, ad.getType());
        pst.setDouble(4, ad.getAmount());
        pst.setDouble(5, ad.getBalance());
        return pst.executeUpdate();
    }

    /**
     * 根据id查询其所有AccountDetail表的记录
     *
     * @param a
     * @return null 表示没有记录
     * @throws Exception
     */
    public ArrayList<AccountDetailDTO> findAccountDetailByAccount(Account a) throws Exception {
        Connection conn = tran.getConnection();
        String sql = "select ad.id id,ad.accountid accountid,ad.createtime createtime,ad.amount 交易金额,ad.balance 余额,ad.type type,ad.accountid2 accountid2,(select b.name from BACK.ACCOUNT b where b.accountid = ad.accountid2) name from BACK.ACCOUNT a, BACK.accountdetail ad where a.accountid=ad.accountid and ad.accountid=? order by createtime desc";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, a.getAccountid());
        ResultSet rs = pst.executeQuery();
        ArrayList<AccountDetailDTO> aladDTO = new ArrayList<AccountDetailDTO>();
        AccountDetailDTO adDTO = null;
        while (rs != null && rs.next()) {
            adDTO = new AccountDetailDTO();
            adDTO.setId(rs.getString("id"));
            adDTO.setAccountid(rs.getString("accountid"));
            adDTO.setCreateTime(rs.getDate("createtime"));
            adDTO.setAmount(rs.getDouble("交易金额"));
            adDTO.setBalance(rs.getDouble("余额"));
            adDTO.setType(rs.getString("type"));
            if (rs.getString("accountid2") == null) {
                adDTO.setAccountid2("");
                adDTO.setName2("");
            } else {
                adDTO.setAccountid2(rs.getString("accountid2"));
                adDTO.setName2(rs.getString("name"));
            }
            aladDTO.add(adDTO);
        }
        return aladDTO;
    }
}

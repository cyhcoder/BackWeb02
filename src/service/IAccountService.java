package service;

import java.util.*;

import model.*;

/**
 * @author cyh
 */
public interface IAccountService {
    public Account createAccount(Account a);// 建帐号

    public Account loginAccount(String name, String pwd) throws Exception;// 登录

    public boolean saveMoney(Account a, double m) throws Exception;// 存钱

    public Account findAccunt(String accountid) throws Exception;// 查询用户

    public boolean drawMoney(Account a, double m) throws Exception;// 取钱

    public boolean transferMoney(Account a, Account b, double m) throws Exception; // 转帐

    public ArrayList<AccountDetailDTO> queryTransactionDail(Account a) throws Exception;// 查询流水

    public boolean updatePwd(Account a, String pwd, String newPwd) throws Exception;
}

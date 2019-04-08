package service;

import java.util.*;

import dao.*;
import db.*;
import model.*;

public class AccountServiceImpl implements IAccountService {

    /**
     * @param Account a
     * @return null表示创建失败
     */
    @Override
    public Account createAccount(Account a) {
        TransactionContext tran = null;
        try {
            tran = new TransactionContext();
            tran.beginTran(true); // 开始手动事务
            AccountDAO aDAO = new AccountDAO(tran);// 创建新的DAO
            // 调用DAO提供的方法来完成创建用户
            aDAO.addAccount(a);
            Account acc = aDAO.findAccountByID(a.getAccountid());
            tran.commitTran();
            System.out.println("创建用户成功");
            return acc;
        } catch (Exception e) {
            try {
                tran.rollBackTran();
                System.out.println("创建用户失败");
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Account loginAccount(String name, String pwd) throws Exception {
        TransactionContext tran = null;
        Account acc = null;
        try {
            tran = new TransactionContext();
            tran.beginTran(false); // 开始自动事务
            AccountDAO aDAO = new AccountDAO(tran);// 创建新的DAO
            acc = aDAO.findAccountByIdPwd(name, pwd);
            return acc;
        } catch (Exception e) {
            System.out.println("这里出错");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public boolean saveMoney(Account a, double m) throws Exception {
        String type = "save";
        // 初始流水对象
        AccountDetail ad = new AccountDetail();
        ad.setAccountid(a.getAccountid());
        ad.setAccountid2(null);
        ad.setType(type);
        ad.setAmount(m);

        TransactionContext tran = null;
        try {
            tran = new TransactionContext();
            tran.beginTran(true); // 开始手动事务
            AccountDAO aDAO = new AccountDAO(tran);// 创建新的DAO
            AccountDetailDAO adDAO = new AccountDetailDAO(tran);
            // 调用DAO提供的方法来存钱和添加流水记录
            int i = aDAO.updateAmount(a, m); // 存钱
            double b = aDAO.findAccountByID(a.getAccountid()).getAmount();
            ad.setBalance(b);
            int j = adDAO.addAccountDetail(ad); // 记录流水
            if (i > 0 && j > 0) {
                tran.commitTran();
                System.out.println("存钱成功：" + m + "元");
                return true;
            }
        } catch (Exception e) {
            try {
                tran.rollBackTran();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return false;
    }

    @Override
    public boolean drawMoney(Account a, double m) throws Exception {
        String type = "draw";
        // 初始流水对象
        AccountDetail ad = new AccountDetail();
        ad.setAccountid(a.getAccountid());
        ad.setAccountid2(null);
        ad.setType(type);
        ad.setAmount(-m);

        TransactionContext tran = null;
        try {
            tran = new TransactionContext();
            tran.beginTran(true); // 开始手动事务
            AccountDAO aDAO = new AccountDAO(tran);// 创建新的DAO
            AccountDetailDAO adDAO = new AccountDetailDAO(tran);
            // 调用DAO提供的方法来取钱
            double b = aDAO.findAccountByID(a.getAccountid()).getAmount();// 查询用户当前余额
            if (b < m) {
                throw new Exception("250");
            }
            int i = aDAO.updateAmount(a, -m);
            b = aDAO.findAccountByID(a.getAccountid()).getAmount();
            ad.setBalance(b);
            int j = adDAO.addAccountDetail(ad);
            if (i > 0 && j > 0) {
                tran.commitTran();
                System.out.println("取钱成功：" + m + "元");
                return true;
            }
        } catch (Exception e) {
            try {
                tran.rollBackTran();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return false;
    }

    @Override
    public boolean transferMoney(Account a, Account b, double m) throws Exception {
        System.out.println("开始转账");
        String type = "transfer";
        // 初始流水对象
        AccountDetail ad = new AccountDetail();
        ad.setAccountid(a.getAccountid());
        ad.setAccountid2(b.getAccountid());
        ad.setType(type);
        ad.setAmount(-m);

        AccountDetail ad2 = new AccountDetail();
        ad2.setAccountid(b.getAccountid());
        ad2.setAccountid2(a.getAccountid());
        ad2.setType(type);
        ad2.setAmount(m);

        TransactionContext tran = null;
        try {
            tran = new TransactionContext();
            tran.beginTran(true); // 开始手动事务
            AccountDAO aDAO = new AccountDAO(tran);// 创建新的DAO
            AccountDetailDAO adDAO = new AccountDetailDAO(tran);
            // 判断当前转账的用户金额是否足够
            double bl = aDAO.findAccountByID(a.getAccountid()).getAmount();
            if (bl < m) {
                throw new Exception("250");
            }
            // 判断是否存在目标用户
            Account accB = aDAO.findAccountByID(b.getAccountid());
            if (accB == null) {
                throw new Exception("抱歉！不存在用户" + b.getAccountid());
            }
            // 调用DAO提供的方法来转账
            int i = aDAO.updateAmount(a, -m); // 开始转账
            int l = aDAO.updateAmount(b, m);
            bl = aDAO.findAccountByID(a.getAccountid()).getAmount(); // 交易完后的余额
            ad.setBalance(bl);
            double bl2 = aDAO.findAccountByID(b.getAccountid()).getAmount();
            ad2.setBalance(bl2);
            int j = adDAO.addAccountDetail(ad);
            int k = adDAO.addAccountDetail(ad2);
            if (i > 0 && l > 0 && j > 0 && k > 0) {
                tran.commitTran();
                System.out.println("转账成功：" + m + "元");
                return true;
            }
        } catch (Exception e) {
            try {
                tran.rollBackTran();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            throw new Exception(e.getMessage());
        }
        return false;
    }

    @Override
    public Account findAccunt(String id) throws Exception {
        TransactionContext tran = null;
        Account acc = null;
        try {
            tran = new TransactionContext();
            tran.beginTran(false); // 开始手动事务
            AccountDAO aDAO = new AccountDAO(tran);
            acc = aDAO.findAccountByID(id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return acc;

    }

    @Override
    public ArrayList<AccountDetailDTO> queryTransactionDail(Account a) throws Exception {
        TransactionContext tran = null;
        ArrayList<AccountDetailDTO> arrAcc = null;
        try {
            tran = new TransactionContext();
            tran.beginTran(false); // 开始自动事务
            AccountDetailDAO adDAO = new AccountDetailDAO(tran);// 开始新的DAO
            arrAcc = adDAO.findAccountDetailByAccount(a);// 调用DAO提供的方法
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return arrAcc;
    }

    @Override
    public boolean updatePwd(Account a, String pwd, String newPwd) throws Exception {
        TransactionContext tran = null;
        try {
            tran = new TransactionContext();
            tran.beginTran(true);//开始手动事务
            AccountDAO aDAO = new AccountDAO(tran);// 创建新的DAO
            int i;
            if (aDAO.findAccountByIdPwd(a.getAccountid(), pwd) != null) {
                i = aDAO.updatePwd(a, newPwd);
            } else {
                throw new Exception("260");
            }
            if (i > 0) {
                tran.commitTran();
                System.out.println("成功修改密码");
                return true;
            }
        } catch (Exception e) {
            tran.rollBackTran();
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return false;
    }

}

package com.khoahd7621.dao;

import com.khoahd7621.model.Account;
import com.khoahd7621.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KhoaHD7621
 */
public class AccountDAO {

    private static final String GET_AN_ACCOUNT = "SELECT AccID, Email, Password, FullName, Phone, Status, Role FROM Accounts WHERE Email = ? AND Password = ?";
    private static final String GET_ACCOUNTS = "SELECT AccID, Email, Password, FullName, Phone, Status, Role FROM Accounts";
    private static final String UPDATE_ACCOUNT_STATUS = "UPDATE Accounts Set status = ? WHERE email = ?";
    private static final String UPDATE_ACCOUNT = "UPDATE Accounts Set fullname = ?, phone = ?, password = ? WHERE email = ?";
    private static final String INSERT_ACCOUNT = "INSERT INTO Accounts (email, password, fullname, phone, status, role) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String GET_ACCOUNT_INFO_BY_EMAIL = "SELECT AccID, Email, Password, FullName, Phone, Status, Role FROM Accounts WHERE Email = ?";
    private static final String CHANGE_ACCOUNT_INFO = "UPDATE Accounts SET fullname = ?, phone = ? WHERE email = ?";
    private static final String GET_AN_ACCOUNT_BY_TOKEN = "SELECT AccID, Email, Password, FullName, Phone, Status, Role FROM Accounts WHERE token = ?";
    private static final String UPDATE_TOKEN = "UPDATE Accounts Set token = ? WHERE email = ?";
    private static final String VALID_TOKEN = "SELECT AccID, Email, Password, FullName, Phone, Status, Role FROM Accounts WHERE token = ?";
    private static final String GET_ROLE_ACCOUNT_BY_TOKEN = "SELECT role FROM Accounts WHERE token = ?";
    private static final String CHECK_OLD_PASSWORD = "SELECT Password FROM Accounts WHERE accId = ?";
    private static final String UPDATE_PASSWORD = "UPDATE Accounts Set password = ? WHERE accId = ?";

    public boolean updateAccountPassword(int accId, String newPassword) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(UPDATE_PASSWORD);
                psm.setString(1, newPassword);
                psm.setInt(2, accId);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkOldPassword(int accId, String oldPassword) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(CHECK_OLD_PASSWORD);
                psm.setInt(1, accId);
                rs = psm.executeQuery();
                if (rs.next()) {
                    String accPsw = rs.getString("Password");
                    if (accPsw.equalsIgnoreCase(oldPassword)) {
                        check = true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getRoleAccountByToken(String token) throws SQLException {
        int role = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GET_ROLE_ACCOUNT_BY_TOKEN);
                stm.setString(1, token);
                rs = stm.executeQuery();
                if (rs.next()) {
                    role = rs.getInt("role");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return role;
    }

    public boolean validToken(String token) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(VALID_TOKEN);
                psm.setString(1, token);
                rs = psm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateToken(String token, String email) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(UPDATE_TOKEN);
                psm.setString(1, token);
                psm.setString(2, email);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean getAccountByEmail(String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GET_ACCOUNT_INFO_BY_EMAIL);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public Account getAccount(String email, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Account acc = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GET_AN_ACCOUNT);
                stm.setString(1, email);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int AccId = rs.getInt("AccID");
                    String Email = rs.getString("Email");
                    String FullName = rs.getString("FullName");
                    String Phone = rs.getString("Phone");
                    int Status = rs.getInt("Status");
                    int Role = rs.getInt("Role");
                    acc = new Account(AccId, Email, "******", FullName, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return acc;
    }

    public Account getAccount(String token) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Account acc = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GET_AN_ACCOUNT_BY_TOKEN);
                stm.setString(1, token);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int AccId = rs.getInt("AccID");
                    String Email = rs.getString("Email");
                    String Password = rs.getString("Password");
                    String FullName = rs.getString("FullName");
                    String Phone = rs.getString("Phone");
                    int Status = rs.getInt("Status");
                    int Role = rs.getInt("Role");
                    acc = new Account(AccId, Email, Password, FullName, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return acc;
    }

    public Account getAccountInfoByEmail(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Account acc = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(GET_ACCOUNT_INFO_BY_EMAIL);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int AccId = rs.getInt("AccID");
                    String Email = rs.getString("Email");
                    String Password = rs.getString("Password");
                    String FullName = rs.getString("FullName");
                    String Phone = rs.getString("Phone");
                    int Status = rs.getInt("Status");
                    int Role = rs.getInt("Role");
                    acc = new Account(AccId, Email, Password, FullName, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return acc;
    }

    public List<Account> getAccounts() throws SQLException {
        List<Account> list = new ArrayList<>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.createStatement();
                rs = stm.executeQuery(GET_ACCOUNTS);
                while (rs.next()) {
                    int AccId = rs.getInt("AccID");
                    String Email = rs.getString("Email");
                    String Password = rs.getString("Password");
                    String FullName = rs.getString("FullName");
                    String Phone = rs.getString("Phone");
                    int Status = rs.getInt("Status");
                    int Role = rs.getInt("Role");
                    Account acc = Account.builder()
                            .accId(AccId)
                            .email(Email)
                            .password(Password)
                            .fullName(FullName)
                            .status(Status)
                            .phone(Phone)
                            .role(Role)
                            .build();
                    list.add(acc);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean updateAccountStatus(String email, int status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_ACCOUNT_STATUS);
                stm.setInt(1, status);
                stm.setString(2, email);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateAccount(String email, String newPassword, String newFullname, String newPhone) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_ACCOUNT);
                stm.setString(1, newFullname);
                stm.setString(2, newPhone);
                stm.setString(3, newPassword);
                stm.setString(4, email);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean changeAccount(String email, String newFullname, String newPhone) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHANGE_ACCOUNT_INFO);
                stm.setString(1, newFullname);
                stm.setString(2, newPhone);
                stm.setString(3, email);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newStatus, int newRole) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(INSERT_ACCOUNT);
                stm.setString(1, newEmail);
                stm.setString(2, newPassword);
                stm.setString(3, newFullname);
                stm.setString(4, newPhone);
                stm.setInt(5, newStatus);
                stm.setInt(6, newRole);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}

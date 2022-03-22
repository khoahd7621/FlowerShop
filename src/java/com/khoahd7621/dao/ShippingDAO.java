package com.khoahd7621.dao;

import com.khoahd7621.model.Shipping;
import com.khoahd7621.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author KhoaHD7621
 */
public class ShippingDAO {
    
    public Shipping getShippingById(int shippingId) throws SQLException {
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id, name, phone, address FROM Shipping WHERE id = ?";
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(sql);
                psm.setInt(1, shippingId);
                rs = psm.executeQuery();
                if (rs.next()) {
                    return new Shipping(rs.getInt("id"), rs.getString("name"), rs.getString("phone"), rs.getString("address"));
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
        return null;
    }

    public int createReturnId(Shipping shipping) throws SQLException {
        int num = 0;
        String sql = "INSERT INTO Shipping (name, phone, address) VALUES (?, ?, ?)";
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                psm.setString(1, shipping.getName());
                psm.setString(2, shipping.getPhone());
                psm.setString(3, shipping.getAddress());
                psm.executeUpdate();

                rs = psm.getGeneratedKeys();
                if (rs.next()) {
                    num = rs.getInt(1);
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
        return num;
    }
}

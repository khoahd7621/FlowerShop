package com.khoahd7621.dao;

import com.khoahd7621.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author KhoaHD7621
 */
public class OrderStatusDAO {

    private static final String GET_ORDERS_STATUS = "SELECT id, name FROM OrderStatus";

    public Map<Integer, String> getOrderStatus() throws SQLException {
        Map<Integer, String> list = new LinkedHashMap<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ORDERS_STATUS);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        list.put(id, name);
                    }
                }
            }
        } catch (Exception e) {
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
        return list;
    }
    
}

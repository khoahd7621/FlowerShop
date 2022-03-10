package com.khoahd7621.dao;

import com.khoahd7621.model.Cart;
import com.khoahd7621.model.OrderDetail;
import com.khoahd7621.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KhoaHD7621
 */
public class OrderDetailDAO {
    
    private static final String SAVE_CART = "INSERT INTO OrderDetails (orderId, pId, price, quantity) VALUES (?, ?, ?, ?)";
    private static final String GET_LIST_ORDERS_DETAIL = "SELECT detailId, orderId, pId, quantity, price FROM OrderDetails WHERE orderId = ?";
    
    public List<OrderDetail> getListOrdersDetail(int orderId) throws SQLException {
        List<OrderDetail> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_LIST_ORDERS_DETAIL);
                psm.setInt(1, orderId);
                rs = psm.executeQuery();
                while (rs.next()) {
                    list.add(OrderDetail.builder()
                            .orderDetailId(rs.getInt("detailId"))
                            .orderId(rs.getInt("orderId"))
                            .plantId(rs.getInt("pId"))
                            .quantity(rs.getInt("quantity"))
                            .price(rs.getInt("price")).build());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (psm != null) psm.close();
            if (conn != null) conn.close();
        }
        return list;
    }

    public void saveCart(int orderId, Map<Integer, Cart> carts) throws SQLException {
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(SAVE_CART);
                psm.setInt(1, orderId);
                for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                    Integer pid = entry.getKey();
                    Cart cart = entry.getValue();
                    psm.setInt(2, pid);
                    psm.setInt(3, cart.getPlant().getPrice());
                    psm.setInt(4, cart.getQuantity());
                    psm.executeUpdate();
                }
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
    }

}

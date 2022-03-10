package com.khoahd7621.dao;

import com.khoahd7621.model.Cart;
import com.khoahd7621.model.Order;
import com.khoahd7621.model.Shipping;
import com.khoahd7621.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KhoaHD7621
 */
public class OrderDAO {

    private static final String GET_ORDERS = "SELECT orderId, ordDate, shipDate, note, status, accId, shippingId, totalPrice \n" +
            "FROM Orders WHERE accId = ?";
    private static final String GET_ORDERS_BY_STATUS = "SELECT orderId, ordDate, shipDate, note, status, accId, shippingId, totalPrice \n" +
            "FROM Orders WHERE accId = ? AND status = ?";
    private static final String UPDATE_ORDER_STATUS = "UPDATE Orders SET status = ? WHERE orderId = ?";
    private static final String FINISH_ORDER = "UPDATE Orders SET status = ?, shipDate = GETDATE() WHERE orderId = ?";
    private static final String GET_ORDERS_BY_ARRANGE_TIME = "SELECT orderId, ordDate, shipDate, note, status, accId, shippingId, totalPrice \n" +
            "FROM Orders WHERE accId = ? AND (ordDate >= ? AND ordDate <= ?)";
    private static final String GET_ORDERS_BY_ARRANGE_TIME_2 = "SELECT orderId, ordDate, shipDate, note, status, accId, shippingId, totalPrice \n" +
            "FROM Orders WHERE (ordDate >= ? AND ordDate <= ?)";
    private static final String INSERT_RETURN_ID = "INSERT INTO Orders (accId, totalPrice, note, status, shippingId) VALUES (?, ?, ?, 1, ?)";
    private static final String GET_ORDER_BY_ID = "SELECT orderId, ordDate, shipDate, note, status, accId, shippingId, totalPrice \n" +
            "FROM Orders WHERE orderId = ?";
    private static final String GET_ALL_ORDERS = "SELECT orderId, ordDate, shipDate, note, status, accId, shippingId, totalPrice FROM Orders";
    
     public List<Order> getAllOrders() throws SQLException {
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_ORDERS);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderId");
                    String orderDate = rs.getString("ordDate");
                    String shipDate = rs.getString("shipDate");
                    String note = rs.getString("note");
                    int status = rs.getInt("status");
                    int accId = rs.getInt("accId");
                    int shippingId = rs.getInt("shippingId");
                    int totalPrice = rs.getInt("totalPrice");
                    Order ord = new Order(orderID, orderDate, shipDate, note, totalPrice, status, accId, shippingId);
                    list.add(ord);
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
        return list;
    }
    
    public Order getOrderById(int orderId) throws SQLException {
        Order order = null;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ORDER_BY_ID);
                psm.setInt(1, orderId);
                rs = psm.executeQuery();
                while (rs.next()) {
                    String orderDate = rs.getString("ordDate");
                    String shipDate = rs.getString("shipDate");
                    String note = rs.getString("note");
                    int status = rs.getInt("status");
                    int accId = rs.getInt("accId");
                    int shippingId = rs.getInt("shippingId");
                    int totalPrice = rs.getInt("totalPrice");
                    order = new Order(orderId, orderDate, shipDate, note, totalPrice, status, accId, shippingId);
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
        return order;
    }
    
    public List<Order> getOrdersByPeriodTime(String from, String to) throws SQLException {
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ORDERS_BY_ARRANGE_TIME_2);
                psm.setString(1, from);
                psm.setString(2, to);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderId");
                    String orderDate = rs.getString("ordDate");
                    String shipDate = rs.getString("shipDate");
                    String note = rs.getString("note");
                    int status = rs.getInt("status");
                    int accId = rs.getInt("accId");
                    int shippingId = rs.getInt("shippingId");
                    int totalPrice = rs.getInt("totalPrice");
                    Order ord = new Order(orderID, orderDate, shipDate, note, totalPrice, status, accId, shippingId);
                    list.add(ord);
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
        return list;
    }
    
    public List<Order> getOrdersByPeriodTime(int accId, String from, String to) throws SQLException {
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ORDERS_BY_ARRANGE_TIME);
                psm.setInt(1, accId);
                psm.setString(2, from);
                psm.setString(3, to);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderId");
                    String orderDate = rs.getString("ordDate");
                    String shipDate = rs.getString("shipDate");
                    String note = rs.getString("note");
                    int status = rs.getInt("status");
                    int shippingId = rs.getInt("shippingId");
                    int totalPrice = rs.getInt("totalPrice");
                    Order ord = new Order(orderID, orderDate, shipDate, note, totalPrice, status, accId, shippingId);
                    list.add(ord);
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
        return list;
    }

    public int insertReturnId(int userId, Order order) throws SQLException {
        int id = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(INSERT_RETURN_ID, Statement.RETURN_GENERATED_KEYS);
                psm.setInt(1, userId);
                psm.setDouble(2, order.getTotalPrice());
                psm.setString(3, order.getNote());
                psm.setInt(4, order.getShippingId());
                psm.executeUpdate();

                rs = psm.getGeneratedKeys();
                if (rs.next()) {
                    id = rs.getInt(1);
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
        return id;
    }

    public boolean insertOrder(int userId, Map<Integer, Cart> carts, String name, String phone, String address, String note) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                int orderid = 0;
                conn.setAutoCommit(false); // Off autocommit
                // 1. Insert Shipping
                Shipping shipping = Shipping.builder()
                        .name(name)
                        .phone(phone)
                        .address(address)
                        .build();
                int shippingId = new ShippingDAO().createReturnId(shipping); // Tra ve ID tu tang cua ban ghi vua luu vao database

                // 2. Calculate Total money
                int totalPrice = 0;
                for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                    Cart cart = entry.getValue();
                    totalPrice += cart.getQuantity() * cart.getPlant().getPrice();
                }

                // 3. Insert new order
                Order order = Order.builder()
                        .accId(userId)
                        .totalPrice(totalPrice)
                        .note(note)
                        .shippingId(shippingId)
                        .build();
                int orderId = new OrderDAO().insertReturnId(userId, order);

                // 4. Insert OrderDetail
                new OrderDetailDAO().saveCart(orderId, carts);
                conn.commit();
                conn.setAutoCommit(true);
                check = true;
            } else {
                System.out.println("Cannot add order!");
            }
        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            check = false;
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

    public List<Order> getOrders(int accId) throws SQLException {
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ORDERS);
                psm.setInt(1, accId);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderId");
                    String orderDate = rs.getString("ordDate");
                    String shipDate = rs.getString("shipDate");
                    String note = rs.getString("note");
                    int status = rs.getInt("status");
                    int shippingId = rs.getInt("shippingId");
                    int totalPrice = rs.getInt("totalPrice");
                    Order ord = new Order(orderID, orderDate, shipDate, note, totalPrice, status, accId, shippingId);
                    list.add(ord);
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
        return list;
    }

    public List<Order> getOrderByStatus(int accId, int status) throws SQLException {
        List<Order> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ORDERS_BY_STATUS);
                psm.setInt(1, accId);
                psm.setInt(2, status);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderId");
                    String orderDate = rs.getString("ordDate");
                    String shipDate = rs.getString("shipDate");
                    String note = rs.getString("note");
                    int shippingId = rs.getInt("shippingId");
                    int totalPrice = rs.getInt("totalPrice");
                    int accID = rs.getInt("AccID");
                    Order ord = new Order(orderID, orderDate, shipDate, note, totalPrice, status, accID, shippingId);
                    list.add(ord);
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
        return list;
    }
    
    public boolean finishOrder(int orderId, int orderStatus) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(FINISH_ORDER);
                stm.setInt(1, orderStatus);
                stm.setInt(2, orderId);
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

    public boolean updateOrderStatus(int orderId, int orderStatus) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE_ORDER_STATUS);
                stm.setInt(1, orderStatus);
                stm.setInt(2, orderId);
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

}

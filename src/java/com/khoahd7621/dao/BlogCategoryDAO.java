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
public class BlogCategoryDAO {
    
    private static final String GET_ALL_BLOG_CATEGORIES = "SELECT id, name FROM BlogCategory";
    private static final String GET_RANDOM_N_BLOG_CATEGORIES = "SELECT TOP(?) id, name FROM BlogCategory ORDER BY NEWID()";
    private static final String UPDATE_BLOG_CATEGORY_INFO = "";
    private static final String INSERT_NEW_BLOG_CATEGORY = "";

    public boolean insertNewCategory(String cateName) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(INSERT_NEW_BLOG_CATEGORY);
                psm.setString(1, cateName);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
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

    public boolean updateCategoryInfo(int id, String name) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(UPDATE_BLOG_CATEGORY_INFO);
                psm.setString(1, name);
                psm.setInt(2, id);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
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
    
    public Map<Integer, String> getRandomNBlogCategories(int quantity) throws SQLException {
        Map<Integer, String> list = new LinkedHashMap<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_RANDOM_N_BLOG_CATEGORIES);
                psm.setInt(1, quantity);
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
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public Map<Integer, String> getAllBlogCategories() throws SQLException {
        Map<Integer, String> list = new LinkedHashMap<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_BLOG_CATEGORIES);
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
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }
}

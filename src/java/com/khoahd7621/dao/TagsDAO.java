package com.khoahd7621.dao;

import com.khoahd7621.model.Tags;
import com.khoahd7621.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author KhoaHD7621
 */
public class TagsDAO {
    
    private static final String GET_ALL_TAGS = "SELECT id, name FROM BlogCategory";
    private static final String GET_RANDOM_N_TAGS = "SELECT TOP(?) id, name FROM BlogCategory ORDER BY NEWID()";
    private static final String GET_LIST_TAGS_BY_BLOG_ID = "SELECT T.id, T.name FROM BlogTags B INNER JOIN Tags T ON B.tagId = T.id WHERE B.blogId = ?";
    
    public List<Tags> getListTagsOfBlog(int blogId) throws SQLException {
        List<Tags> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_LIST_TAGS_BY_BLOG_ID);
                psm.setInt(1, blogId);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(Tags.builder().id(rs.getInt("id")).name(rs.getString("name")).build());
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
    
    public Map<Integer, String> getRandomNTags(int quantity) throws SQLException {
        Map<Integer, String> list = new LinkedHashMap<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_RANDOM_N_TAGS);
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
    
    public Map<Integer, String> getAllTags() throws SQLException {
        Map<Integer, String> list = new LinkedHashMap<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_TAGS);
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

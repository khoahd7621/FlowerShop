package com.khoahd7621.dao;

import com.khoahd7621.model.Blog;
import com.khoahd7621.model.Comment;
import com.khoahd7621.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KhoaHD7621
 */
public class CommentDAO {
    
    private static final String GET_LIST_COMMENT_BY_BLOG_ID = "SELECT id, blogId, accId, content FROM Comment WHERE blogId = ?";
    
    public List<Comment> getListCommentsOfBlog(int blogId) throws SQLException {
        List<Comment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_LIST_COMMENT_BY_BLOG_ID);
                psm.setInt(1, blogId);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(Comment.builder()
                                .id(rs.getInt("id"))
                                .accId(rs.getInt("accId"))
                                .blogId(rs.getInt("blogId"))
                                .content(rs.getString("content")).build());
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

package com.khoahd7621.dao;

import com.khoahd7621.model.Blog;
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
public class BlogDAO {
    
    private static final String GET_ALL_BLOGS = "SELECT id, title, description, content, coverImgPath, mainImgPath, createdDate, cateId, accId FROM Blog";
    private static final String GET_RANDOM_N_BLOGS = "SELECT TOP(?) id, title, description, content, coverImgPath, mainImgPath, createdDate, cateId, accId FROM Blog ORDER BY NEWID()";
    private static final String GET_A_BLOG_BY_ID = "SELECT id, title, description, content, coverImgPath, mainImgPath, createdDate, cateId, accId FROM Blog WHERE id = ?";
    private static final String GET_RANDOM_N_LATEST_BLOG = "SELECT TOP(?) id, title, description, content, coverImgPath, mainImgPath, createdDate, cateId, accId FROM Blog ORDER BY createdDate DESC";
    
    public List<Blog> getRandomNLatestBlogs(int quantity) throws SQLException {
        List<Blog> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_RANDOM_N_LATEST_BLOG);
                psm.setInt(1, quantity);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(Blog.builder()
                                .id(rs.getInt("id"))
                                .title(rs.getString("title"))
                                .description(rs.getString("description"))
                                .content(rs.getString("content"))
                                .coverImgPath(rs.getString("coverImgPath"))
                                .mainImgPath(rs.getString("mainImgPath"))
                                .createdDate(rs.getDate("createdDate"))
                                .cateId(rs.getInt("cateId"))
                                .account(new AccountDAO().getAccount(rs.getInt("accId")))
                                .comment(new CommentDAO().getListCommentsOfBlog(rs.getInt("id"))).build());
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
    
    public Blog getABlogById(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        Blog blog = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_A_BLOG_BY_ID);
                psm.setInt(1, id);
                rs = psm.executeQuery();
                if (rs.next()) {
                    blog = Blog.builder()
                                .id(rs.getInt("id"))
                                .title(rs.getString("title"))
                                .description(rs.getString("description"))
                                .content(rs.getString("content"))
                                .coverImgPath(rs.getString("coverImgPath"))
                                .mainImgPath(rs.getString("mainImgPath"))
                                .createdDate(rs.getDate("createdDate"))
                                .cateId(rs.getInt("cateId"))
                                .account(new AccountDAO().getAccount(rs.getInt("accId")))
                                .comment(new CommentDAO().getListCommentsOfBlog(id))
                                .tags(new TagsDAO().getListTagsOfBlog(id)).build();
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
        return blog;
    }
    
    public List<Blog> getRandomNBlogs(int quantity) throws SQLException {
        List<Blog> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_RANDOM_N_BLOGS);
                psm.setInt(1, quantity);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(Blog.builder()
                                .id(rs.getInt("id"))
                                .title(rs.getString("title"))
                                .description(rs.getString("description"))
                                .content(rs.getString("content"))
                                .coverImgPath(rs.getString("coverImgPath"))
                                .mainImgPath(rs.getString("mainImgPath"))
                                .createdDate(rs.getDate("createdDate"))
                                .cateId(rs.getInt("cateId"))
                                .account(new AccountDAO().getAccount(rs.getInt("accId")))
                                .comment(new CommentDAO().getListCommentsOfBlog(rs.getInt("id"))).build());
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
    
    public List<Blog> getAllBlogs() throws SQLException {
        List<Blog> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_BLOGS);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(Blog.builder()
                                .id(rs.getInt("id"))
                                .title(rs.getString("title"))
                                .description(rs.getString("description"))
                                .content(rs.getString("content"))
                                .coverImgPath(rs.getString("coverImgPath"))
                                .mainImgPath(rs.getString("mainImgPath"))
                                .createdDate(rs.getDate("createdDate"))
                                .cateId(rs.getInt("cateId"))
                                .account(new AccountDAO().getAccount(rs.getInt("accId")))
                                .comment(new CommentDAO().getListCommentsOfBlog(rs.getInt("id"))).build());
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

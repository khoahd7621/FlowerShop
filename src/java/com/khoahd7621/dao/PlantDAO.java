package com.khoahd7621.dao;

import com.khoahd7621.model.Plant;
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
public class PlantDAO {

    private static final String GETPLANT = "SELECT pid, pName, price, imgPath, description, "
            + "status, cateId FROM Plants WHERE pid = ?";
    private static final String GET_ALL_PLANTS = "SELECT pid, pName, price, imgPath, "
            + "description, status, cateId FROM Plants";
    private static final String GET_TOP_4_PLANTS = "SELECT TOP(4) pid, pName, price, "
            + "imgPath, description, status, cateId FROM Plants ORDER BY pid";
    private static final String GET_NEXT_4_PLANTS = "SELECT pid, pName, price, "
            + "imgPath, description, status, cateId \n"
            + "FROM Plants ORDER BY pid OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
    private static final String GET_TOP_4_PLANTS_BY_CATEGORY = "SELECT TOP(4) pid, "
            + "pName, price, imgPath, description, status, cateId FROM Plants WHERE cateId = ? ORDER BY pid";
    private static final String GET_ALL_PLANTS_WITH_PAGING = "SELECT pid, pName, price, imgPath, description, status, cateId \n"
            + "FROM Plants ORDER BY pid ASC OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
    private static final String GET_TOTAL_PLANTS = "SELECT COUNT(pid) AS total FROM Plants";
    private static final String GET_PLANTS_BY_CATEGORY_WITH_PAGGING = "SELECT pId, pName, "
            + "price, imgPath, description, status, cateId FROM Plants WHERE cateId = ? ORDER BY pId ASC "
            + "OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
    private static final String GET_TOTAL_PLANTS_BY_CATEGORY = "SELECT COUNT(pId) AS total FROM Plants WHERE cateId = ?";
    private static final String UPDATE_PLANT_INFO = "UPDATE Plants SET pName = ? , price = ? , imgPath = ?\n"
            + "      , description = ?, status = ?, cateId = ? WHERE pId = ?";
    private static final String INSERT_NEW_PLANT = "INSERT INTO Plants (pName, price, imgPath, description, status, cateId) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String GET_LIST_TOP_PLANTS_RANDOM = "SELECT TOP(?) * FROM Plants WHERE cateId = ? ORDER BY NEWID()";
    
    public List<Plant> getListTopPlantsRandom(int top, int cateId) throws SQLException {
        List<Plant> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_LIST_TOP_PLANTS_RANDOM);
                psm.setInt(1, top);
                psm.setInt(2, cateId);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("pId");
                        String fullName = rs.getString("pName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        Plant plant = new Plant(id, fullName, price, imgPath, description, status, cateId);
                        list.add(plant);
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
    
    public boolean insertNewPlant(String name, String imgPath, int price, String description, int status, int cateId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(INSERT_NEW_PLANT);
                psm.setString(1, name);
                psm.setInt(2, price);
                psm.setString(3, imgPath);
                psm.setString(4, description);
                psm.setInt(5, status);
                psm.setInt(6, cateId);
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

    public boolean updatePlantInfo(int pid, String name, String imgPath, int price, String description, int status, int cateId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(UPDATE_PLANT_INFO);
                psm.setString(1, name);
                psm.setInt(2, price);
                psm.setString(3, imgPath);
                psm.setString(4, description);
                psm.setInt(5, status);
                psm.setInt(6, cateId);
                psm.setInt(7, pid);
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

    public int getTotalPlantsByCategory(int category) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOTAL_PLANTS_BY_CATEGORY);
                psm.setInt(1, category);
                rs = psm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
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
        return total;
    }

    public List<Plant> getPlantsByCategoryWithPagging(int category, int page, int PAGE_SIZE) throws SQLException {
        List<Plant> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_PLANTS_BY_CATEGORY_WITH_PAGGING);
                psm.setInt(1, category);
                psm.setInt(2, page);
                psm.setInt(3, PAGE_SIZE);
                psm.setInt(4, PAGE_SIZE);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("pId");
                        String fullName = rs.getString("pName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("cateId");
                        Plant plant = new Plant(id, fullName, price, imgPath, description, status, cateId);
                        list.add(plant);
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

    public int getTotalPlants() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOTAL_PLANTS);
                rs = psm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
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
        return total;
    }

    public List<Plant> getAllPlantsWithPaging(int page, int PAGE_SIZE) throws SQLException {
        List<Plant> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_PLANTS_WITH_PAGING);
                psm.setInt(1, page);
                psm.setInt(2, PAGE_SIZE);
                psm.setInt(3, PAGE_SIZE);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Plant plant = new Plant(id, fullName, price, imgPath, description, status, cateId);
                        list.add(plant);
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

    public int getTotalPlantsFromSearchKeyword(String keyword, String searchby) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String getPlants = "SELECT COUNT(pid) AS total\n"
                    + "FROM Plants P JOIN Categories C ON P.cateId = C.cateId ";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchby.equalsIgnoreCase("byname")) {
                    getPlants += "WHERE pName LIKE ?";
                } else {
                    getPlants += "WHERE cateName LIKE ?";
                }
                psm = conn.prepareStatement(getPlants);
                psm.setString(1, "%" + keyword + "%");
                rs = psm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
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
        return total;
    }

    public List<Plant> getSearchPlantsWithPaging(String keyword, String searchby, int page, int PAGE_SIZE) throws SQLException {
        List<Plant> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String getPlants = "SELECT pid, pName, price, imgPath, description, status, P.cateId \n"
                    + "FROM Plants P JOIN Categories C ON P.cateId = C.cateId ";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchby.equalsIgnoreCase("byname")) {
                    getPlants += "WHERE pName LIKE ? ORDER BY pid ASC OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
                } else {
                    getPlants += "WHERE cateName LIKE ? ORDER BY pid ASC OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
                }
                psm = conn.prepareStatement(getPlants);
                psm.setString(1, "%" + keyword + "%");
                psm.setInt(2, page);
                psm.setInt(3, PAGE_SIZE);
                psm.setInt(4, PAGE_SIZE);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Plant plant = new Plant(id, fullName, price, imgPath, description, status, cateId);
                        list.add(plant);
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

    public List<Plant> getTop4PlantsByCateId(int cateId) throws SQLException {
        List<Plant> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOP_4_PLANTS_BY_CATEGORY);
                psm.setInt(1, cateId);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        Plant plant = new Plant(id, fullName, price, imgPath, description, status, cateId);
                        list.add(plant);
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

    public List<Plant> getNext4Plants(int amount) throws SQLException {
        List<Plant> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_NEXT_4_PLANTS);
                psm.setInt(1, amount);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Plant plant = new Plant(id, fullName, price, imgPath, description, status, cateId);
                        list.add(plant);
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

    public List<Plant> getTop4Plants() throws SQLException {
        List<Plant> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOP_4_PLANTS);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Plant plant = new Plant(id, fullName, price, imgPath, description, status, cateId);
                        list.add(plant);
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

    public Plant getPlant(int pid) throws SQLException {
        Plant plant = null;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GETPLANT);
                psm.setInt(1, pid);
                rs = psm.executeQuery();
                if (rs.next()) {
                    plant = new Plant(rs.getInt("PID"), rs.getString("PName"),
                            rs.getInt("price"), rs.getString("imgPath"),
                            rs.getString("description"), rs.getInt("status"),
                            rs.getInt("CateID"));
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
        return plant;
    }

    public List<Plant> getPlants(String keyword, String searchby) throws SQLException {
        List<Plant> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String getPlants = "SELECT pid, pName, price, imgPath, description, status, P.cateId \n"
                    + "FROM Plants P JOIN Categories C ON P.cateId = C.cateId ";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchby.equalsIgnoreCase("byname")) {
                    getPlants += "WHERE pName like ?";
                } else {
                    getPlants += "WHERE cateName like ?";
                }
                psm = conn.prepareStatement(getPlants);
                psm.setString(1, "%" + keyword + "%");
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Plant plant = new Plant(id, fullName, price, imgPath, description, status, cateId);
                        list.add(plant);
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

    public List<Plant> getAllPlants() throws SQLException {
        List<Plant> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_PLANTS);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Plant plant = new Plant(id, fullName, price, imgPath, description, status, cateId);
                        list.add(plant);
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

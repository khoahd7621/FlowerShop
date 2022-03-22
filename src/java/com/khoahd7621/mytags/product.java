package com.khoahd7621.mytags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

/**
 *
 * @author KhoaHD7621
 */
public class product implements Tag {

    private String id;
    private String imgpath;
    private String name;
    private String price;
    private String quantity;
    private PageContext pc;
    private Tag parentTag;

    public void setId(String id) {
        this.id = id;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    @Override
    public void setPageContext(PageContext pc) {
        this.pc = pc;
    }

    @Override
    public void setParent(Tag t) {
        this.parentTag = t;
    }

    @Override
    public Tag getParent() {
        return parentTag;
    }

    @Override
    public int doStartTag() throws JspException {
        try {
            pc.getOut().println("<form action=\"UpdateCartQuantityController\">\n"
                    + "    <tr>\n"
                    + "        <td>" + id + "</td><input type=\"hidden\" name=\"pid\" value=\"" + id + "\">\n"
                    + "    <td><img src=\"" + imgpath + "\" width=\"100\"></td>\n"
                    + "    <td>" + name + "</td>\n"
                    + "    <td>$" + price + "</td>\n"
                    + "    <td><input onchange=\"this.form.submit()\" type=\"number\" min=\"1\" name=\"quantity\" value=\"" + quantity + "\"></td>\n"
                    + "    <td>$" + Integer.parseInt(price) * Integer.parseInt(quantity) + "</td>\n"
                    + "    <td>\n"
                    + "        <!-- Block btn -->\n"
                    + "        <span>\n"
                    + "            <!-- Button trigger modal -->\n"
                    + "            <button type=\"button\" class=\"btn btn-outline-danger\" data-bs-toggle=\"modal\" data-bs-target=\"#blockBtn" + id + "\">\n"
                    + "                <i class=\"bi bi-trash\"></i> Delete\n"
                    + "            </button>\n"
                    + "            <!-- Modal -->\n"
                    + "            <div class=\"modal fade\" id=\"blockBtn" + id + "\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n"
                    + "                <div class=\"modal-dialog modal-dialog-centered\">\n"
                    + "                    <div class=\"modal-content\">\n"
                    + "                        <div class=\"modal-header\">\n"
                    + "                            <h5 class=\"modal-title\" id=\"exampleModalLabel\">Warning</h5>\n"
                    + "                            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n"
                    + "                        </div>\n"
                    + "                        <div class=\"p-4 text-center fs-3\"\n"
                    + "                             style=\"color: red;\">\n"
                    + "                            Are you sure you want to remove plant \"<span class=\"text-dark\">" + name + "</span>\" from your cart?\n"
                    + "                        </div>\n"
                    + "                        <div class=\"modal-footer\">\n"
                    + "                            <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Cancel</button>\n"
                    + "                            <a href=\"DeleteCartController?pid=" + id + "\" class=\"btn btn-danger\">Delete</a>\n"
                    + "                        </div>\n"
                    + "                    </div>\n"
                    + "                </div>\n"
                    + "            </div>\n"
                    + "        </span>\n"
                    + "    </td>\n"
                    + "</tr>\n"
                    + "</form>");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }

    @Override
    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }

    @Override
    public void release() {
    }

}

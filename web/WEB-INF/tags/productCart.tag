<%-- 
    Document   : newtag_file
    Created on : Mar 17, 2022, 3:02:39 PM
    Author     : KhoaHD7621
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="id" required="true"%>
<%@attribute name="imgpath" required="true"%>
<%@attribute name="name" required="true"%>
<%@attribute name="price" required="true"%>
<%@attribute name="quantity" required="true"%>

<%-- any content can be specified here e.g.: --%>
<form action="UpdateCartQuantityController">
    <tr>
        <td>${id}</td><input type="hidden" name="pid" value="${id}">
    <td><img src="${imgpath}" width="100"></td>
    <td>${name}</td>
    <td>$${price}</td>
    <td><input onchange="this.form.submit()" type="number" min="1" name="quantity" value="${quantity}" style="display: inline !important; border: 0.5px solid black !important;"></td>
    <td>$${price * quantity}</td>
    <td>
        <!-- Block btn -->
        <span>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#blockBtn${id}">
                <i class="bi bi-trash"></i> Delete
            </button>
            <!-- Modal -->
            <div class="modal fade" id="blockBtn${id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="p-4 text-center fs-3"
                             style="color: red;">
                            Are you sure you want to remove plant "<span class="text-dark">${name}</span>" from your cart?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <a href="DeleteCartController?pid=${id}" class="btn btn-danger">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </span>
    </td>
</tr>
</form>
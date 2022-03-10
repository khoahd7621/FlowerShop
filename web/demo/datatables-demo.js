/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#plantsTable').DataTable();
  $('#accountsTable').DataTable();
  $('#ordersTable').DataTable();
  $('#adminAccountTable').DataTable();
  $('#activeUserAccountTable').DataTable();
  $('#inactiveUserAccountTable').DataTable();
  $('#processingOrderTable').DataTable();
  $('#completedOrderTable').DataTable();
  $('#canceledOrderTable').DataTable();
});

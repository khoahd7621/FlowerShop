window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const plantsTable = document.getElementById('plantsTable');
    const accountsTable = document.getElementById('accountsTable');
    const ordersTable = document.getElementById('ordersTable');
    const adminAccountTable = document.getElementById('adminAccountTable');
    const activeUserAccountTable = document.getElementById('activeUserAccountTable');
    const inactiveUserAccountTable = document.getElementById('inactiveUserAccountTable');
    const processingOrderTable = document.getElementById('processingOrderTable');
    const completedOrderTable = document.getElementById('completedOrderTable');
    const canceledOrderTable = document.getElementById('canceledOrderTable');
    
    if (plantsTable) {
        new simpleDatatables.DataTable(plantsTable);
    }
    
    if (accountsTable) {
        new simpleDatatables.DataTable(accountsTable);
    }
    
    if (ordersTable) {
        new simpleDatatables.DataTable(ordersTable);
    }
    
    if (adminAccountTable) {
        new simpleDatatables.DataTable(adminAccountTable);
    }
    
    if (activeUserAccountTable) {
        new simpleDatatables.DataTable(activeUserAccountTable);
    }
    
    if (inactiveUserAccountTable) {
        new simpleDatatables.DataTable(inactiveUserAccountTable);
    }
    
    if (processingOrderTable) {
        new simpleDatatables.DataTable(processingOrderTable);
    }
    
    if (completedOrderTable) {
        new simpleDatatables.DataTable(completedOrderTable);
    }
    
    if (canceledOrderTable) {
        new simpleDatatables.DataTable(canceledOrderTable);
    }
});

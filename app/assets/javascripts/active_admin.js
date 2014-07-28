// #= require active_admin/base


$(function() { 
    $("li#order_product_submit_action.action.input_action.update,li#product_submit_action.action.input_action.update,li#order_submit_action.action.input_action.update,li#size_submit_action.action.input_action.update").on("click", function(){
    var con = confirm("Are you sure you want to update this?");
        if (con == true) {

        }
        else
            return false;           
}); 
});
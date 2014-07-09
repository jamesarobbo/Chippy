// #= require active_admin/base


$(function() { 
    $("form input[type=submit] ").on("click", function(){
    var con = confirm("Are you sure you want to update this?");
        if (con == true) {

        }
        else
            return false;           
}); 
});
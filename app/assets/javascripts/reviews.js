// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
    $("#review-button").click(function(){
        $(".review-form").toggleClass("hidden").delay(3000);
    });
});

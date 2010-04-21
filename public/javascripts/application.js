// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
	$("#log_entry_feel_slider").slider({min:0, max:100});
	$('#log_entry_feel_slider').bind('slidechange', function(event, ui) {
		$("#log_entry_feel").val($("#log_entry_feel_slider").slider('value'));
	});
	if ($("#log_entry_feel").val() != ""){
    	$("#log_entry_feel_slider").slider('value', $("#log_entry_feel").val());				
	}else{
    	$("#log_entry_feel_slider").slider('value', 50);		
	}
	
	$("input.duration_field").live("click", function(event){
		if ($(this).val() == "0:00"){
			$(this).val("");
		}
	});
});

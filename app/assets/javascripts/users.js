
openEventLB = function(eventId){
	$("#eventLightBox").html("loading...").dialog({
		modal: true,
		width: 970
	});
	$.ajax({
		url : '/clinic/events/' + eventId,
		success: function(resp){
			$("#eventLightBox").html(resp).dialog({
				modal: true,
				width: 970
			});
		}
	})
}



$(function(){
	if(window.location.hash !== ""){
		var eventId = window.location.hash.split("#")[1];
		openEventLB(eventId);
	}
	$(".eventReadMore").click(function(){
		openEventLB($(this).data().eventid)
		return false;
	})
});
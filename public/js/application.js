$(document).ready(function() {
	$('#create-list').submit( function() {
		event.preventDefault();
		var path = $(this).attr('action');
		$.ajax({
			method: "GET",
			url: path
		}).done(function(response) {
			$('#create-list').after(response);
			$('#create-list').addClass("hidden");
		});
	});

	$('#create-list-div').on("submit", "#submit-list", function() {
		event.preventDefault();
		var path = $(this).attr('action');
		var data = $(this).serialize();
		$.ajax({
			method: "POST",
			url: path,
			data: data
		}).done(function(response) {
			$("#your-lists").append(response);
			$("#submit-list-partial").addClass("hidden");
			$("#create-list").removeClass("hidden");
		});
	});

	$('#create-task').submit( function() {
		event.preventDefault();
		var path = $(this).attr('action');
		var data = $(this).serialize();
		$.ajax({
			method: "GET",
			url: path,
			data: data
		}).done(function(response) {
			$("#create-task-div").append(response);
			$("#create-task").addClass("hidden");
		});
	});

	$('#create-task-div').on("submit", "#submit-task", function() {
		event.preventDefault();
		var path = $(this).attr('action');
		var data = $(this).serialize();
		$.ajax({
			method: "POST",
			url: path,
			data: data,
		}).done(function(response) {
			$("#task-list").append(response);
			$("#submit-task-partial").addClass("hidden");
			$("#create-task").removeClass("hidden");
		})
	});
});

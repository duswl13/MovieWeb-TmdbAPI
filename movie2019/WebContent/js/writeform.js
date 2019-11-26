$(document).ready(function() {
	$(document).submit(function() {
		if ($.trim($("textarea").val()) == "") {
			alert("내용을 입력하세요");
			$("textarea").focus();
			return false;
		}
	});

	$("#upfile").change(function() {
		$('#filevalue').val('');
		console.log($(this).val());
		var inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
	});

});
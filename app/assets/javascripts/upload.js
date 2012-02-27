var Upload = {
	files_queued: 0,
 
	file_dialog_complete: function(num_selected, num_queued)
	{
		if (num_queued > 0)
		{
			Upload.files_queued += num_queued;
			$('#upload').removeClass('disabled')
				.attr('disabled', '')
				.text('Upload ' + Upload.files_queued + ' Files');
		}
	},
 
	file_queued: function(file)
	{
		div = $('<div></div>').attr({ 'id': file.id, 'class': 'track' });
		div.append($('<div></div>').attr('class', 'name').html(file.name.substring(0, 10) + '...'));
		div.append($('<div></div>').attr('class', 'status').html('pending'));
		div.append($('<div></div>').attr('class', 'progress').append($('<div></div>')));
		$('#tracks').prepend(div);
	},
 
	upload_start: function(file)
	{
		$('#' + file.id + ' div.status').html('Uploading...');
	},
 
	upload_progress: function(file, bytes, total)
	{
		percent = Math.ceil((bytes / total) * 100);
		$('#' + file.id + ' div.progress div').width(percent + '%');
	},
 
	upload_error: function(file, code, message)
	{
	},
 
	upload_success: function(file, data)
	{
		$('#' + file.id).html($(data).html());
	},
 
	upload_complete: function(file)
	{
		Upload.files_queued -= 1;
 
		if (Upload.files_queued == 0)
		{
			$('#upload').addClass('disabled')
				.attr('disabled', 'true')
				.text('Upload 0 Files');
		}
 
		// Start Next Upload
		swfu.startUpload();
	},
 
	flash_ready: function() {},
 
	swf_upload_loaded: function() {},
 
	file_dialog_start: function() {},
	file_queue_error: function(file, error_code, message) {},
	debug: function(message) {}
}


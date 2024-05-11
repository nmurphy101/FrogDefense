function json_file_to_string(fileName) {
	if (file_exists(fileName)) {
	    // open the file for reading
	    var _fileToRead = file_text_open_read(working_directory + fileName);
	    var _jsonStr = "";

		// while the end of the text file has not been reached
	    while (!file_text_eof(_fileToRead)) {
	        var _stringToRead = file_text_read_string(_fileToRead);
		
			// add string to jsonStr ONLY if the line is NOT a comment (equals 0)
			if (string_pos("//", _stringToRead) == 0) {
				_jsonStr += _stringToRead;
			} else {
				show_debug_message(string_pos("/", _stringToRead));
			}
		
			// go to next line regardless
			file_text_readln(_fileToRead);
	    }
	    file_text_close(_fileToRead);
	
	    return _jsonStr;
	}
}
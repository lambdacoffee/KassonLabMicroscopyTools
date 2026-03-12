/*

*/


analysis_parent_directory = getDirectory("Please select parent directory of analysis...");	// trailing file separator
info_filepath = analysis_parent_directory + "info.txt";

text = File.openAsString(info_filepath);
text_lines = split(text, "\n");
labels_arr = newArray(text_lines.length - 1);
filepaths_arr = newArray(text_lines.length - 1);
for (i = 1; i < text_lines.length; i++) {
	curr_line = text_lines[i];
	line_arr = split(curr_line, ",");
	labels_arr[i - 1] = line_arr[0];
	filepaths_arr[i - 1] = line_arr[line_arr.length - 1];
} analysis_pardir = File.getDirectory(info_filepath);	// trailing file separator
fusion_ouput_directory = analysis_pardir + "FusionOutput";	// "Detections" for changepoints, "FusionOutput" for manual assignments
fusion_output_file_list = getFileList(fusion_ouput_directory);
for (i=0; i<labels_arr.length; i++) {
	kept_boxes_filepath = analysis_pardir + "Segmentation" + File.separator + labels_arr[i] + File.separator + "keptBoxes.zip";
	open(kept_boxes_filepath);
	matching_fusion_output_filename = "";
	for (j=0; j<fusion_output_file_list.length; j++) {
		if (indexOf(fusion_output_file_list[j], labels_arr[i]) != -1) {
			matching_fusion_output_filename = fusion_output_file_list[j];
		}
	} fusion_output_filepath = fusion_ouput_directory + File.separator + matching_fusion_output_filename;
	fusion_output_text = File.openAsString(fusion_output_filepath);
	fusion_output_lines = split(fusion_output_text, "\n");
	roiManager("List");
	for (j=0; j<Table.size; j++) {
		roi_idx = Table.getString("Index", j);
		matching_roi_name = Table.getString("Name", j);
		line = split(fusion_output_lines[parseInt(matching_roi_name)], ",");
		if (line[2] == "1") {
			// set fused particles to cyan
			roiManager("select", roi_idx);
			roiManager("Set Color", "cyan");
		} if (line[2] == "0") {
			// set non-fused particles to yello
			roiManager("select", roi_idx);
			roiManager("Set Color", "yellow");
		} if (line[line.length - 1] == "1") {
			// set excluded particles to red
			roiManager("select", roi_idx);
			roiManager("Set Color", "red");
		}
	} roiManager("Associate", "false");
	selectWindow("ROI Manager");
	roiManager("save", kept_boxes_filepath);
	run("Close");
} run("Close All");

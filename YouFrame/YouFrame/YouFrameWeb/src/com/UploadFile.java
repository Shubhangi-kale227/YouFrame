package com;

import java.io.File;

import org.apache.commons.fileupload.FileItem;



public class UploadFile {
	
	public static final String PROJECT_DIR = "D:/work/project/YouFrame/";
	public static final String IMAGE_DIR = PROJECT_DIR + "images/"; 
	
	
	public static String uploadDocumentNew(FileItem fi) {
		// docId, docName, docSize, docData, udate
		// documents
		System.out.println("::::: file name " + fi.getName());
		String imgname=fi.getName();
		try {
			File f = new File(IMAGE_DIR
					+ imgname+ ".png");

			fi.write(f);
			System.out.println("File Uploaded Successfully!");
			return "File Uploaded Successfully! File Indexing Completed!";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}

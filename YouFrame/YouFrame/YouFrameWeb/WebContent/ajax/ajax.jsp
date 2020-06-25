

<%@page import="java.util.Arrays"%>
<%@page import="com.UploadFile"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.ArrayList"%>  
<%@page import="java.io.Writer"%>
<%@page import="java.awt.image.BufferedImageFilter"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ServeltHepler"%>
<%@page import="com.UploadFile"%>

<% 

String sMethod = String.valueOf(request.getParameter("methodId"));
String returnString = "";
System.out.println("HIIIII");
boolean bypasswrite = false;

HashMap parameters = ServeltHepler.displayRequest(request);

 if (sMethod.equalsIgnoreCase("uploadFile")) { 
		HashMap uploadMap=ServeltHepler.parseMultipartRequest(request);
		uploadMap.putAll(parameters);
		 
		FileItem fi=(FileItem)uploadMap.get("fileITEM");
		System.out.println(uploadMap);	
		String message=UploadFile.uploadDocumentNew(fi);
		request.getRequestDispatcher("../page/index.jsp").forward(request, response);

	}
 else if (sMethod.equalsIgnoreCase("showImage")) {  
	  String imgname = String.valueOf(parameters.get("imgname"));
	  String id = String.valueOf(parameters.get("idd"));
	  File folder = new File(UploadFile.IMAGE_DIR);
	  List<File> files = Arrays.asList(folder.listFiles());
	  

		  String filePath=files.get(Integer.parseInt(id)).toString() ;
		  File f=new File(filePath);
		  System.out.println(f.getAbsolutePath());
		  BufferedImage bi=ImageIO.read(f);
		  ImageIO.write(bi, "png", response.getOutputStream());
	  return;  
	    
	 }
	%>
package com;

import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashMap;






import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.io.InputStream;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.Socket;
import java.net.URL;
import java.net.URLConnection;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class ServeltHepler {
	
	
	
	 public static HashMap displayRequest(ServletRequest request){

		  Enumeration paraNames = request.getParameterNames();

		   System. out.println(" ------------------------------");

		   System. out.println("parameters:");

		    HashMap parameters=new HashMap();
		    

		    String pname;

		    String pvalue;

		    while (paraNames.hasMoreElements()) {

		      pname = (String)paraNames.nextElement();

		      pvalue = request.getParameter(pname);

		      System.out.println(pname + " = " + pvalue + "");

		      parameters.put(pname, pvalue);
		    }
		    
		    Enumeration<String> requestAttributes = request.getAttributeNames();
	        while (requestAttributes.hasMoreElements()) {
	        	try{
	            String attributeName = String.valueOf(requestAttributes.nextElement());
	            String attributeValue = String.valueOf(request.getAttribute(attributeName));
	     
	            parameters.put(attributeName, attributeValue);
	        	}catch (Exception e) {
					// TODO: handle exception
				}
	        	
	        }
	        return parameters;
	 }
	 
	 public static HashMap parseMultipartRequest(HttpServletRequest request) {
			System.out.println("Multipart Parser Start");
			HashMap param = new HashMap();
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			try {
				String s = URLDecoder.decode(request.getQueryString());
				System.out.println("URL " + s);
				String[] keyval = s.split("&");
				for (int i = 0; i < keyval.length; i++) {
					String kbv = keyval[i];
					String[] tok = kbv.split("=");
					param.put(tok[0], tok[1]);
				}
			} catch (Exception e) {
			}
			System.out.println(isMultipart);
			String inputFile = "", outputFile = "";
			if (!isMultipart) {
				System.out.println("File Not Uploaded");
			} else {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List items = null;
				String uid = "", desc = "";
				try {
					items = upload.parseRequest(request);
					System.out.println("Multipart items: " + items);
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				Iterator itr = items.iterator();
				while (itr.hasNext()) {
					FileItem item = (FileItem) itr.next();
					if (item.isFormField()) {
						String name = item.getFieldName();
						String value = String.valueOf(item.getString());
						param.put(name, value);
					} else {
						String itemName = item.getName();
						param.put(item.getFieldName(), item.getName());
						try {
							param.put(item.getFieldName() + "FILE",
									item.getInputStream());
							param.put(item.getFieldName() + "ITEM", item);
							param.put(item.getFieldName() + "_FILE_CTYPE",
									item.getContentType());
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
			System.out.println("PARAMETER HASHMAP " + param);
			return param;
		}
	 
}


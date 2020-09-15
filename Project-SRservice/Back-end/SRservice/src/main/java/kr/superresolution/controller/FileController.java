package kr.superresolution.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

@Controller
@RequestMapping(path="/api/fileupload")
public class FileController {
	
	@PostMapping
	public String fileUpload(@RequestParam(name="file", required=false) MultipartFile file,
			@RequestParam(name="email", required=false) String email,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws IOException{
		Map<String, Object> map = new HashMap<>();
		
		//file upload

		String fileName=null;
        String defaultDir="D:/tmp/";
        String saveDir="img/";
        String contentType=null;
        String saveFileName=null;
        
        //이미지가 들어왔을 경우
		if(file!=null) {
			
			fileName=file.getOriginalFilename();
			saveFileName=email;
			contentType=file.getContentType().substring(6);			
			if(contentType.equals("jpeg")) {
				contentType="jpg";
			}
			
			System.out.println("파일 이름 : " + file.getOriginalFilename());
			System.out.println("파일 크기 : " + file.getSize());
			
			//Image 파일 저장
	        
	                // 맥 or linux 일 경우 
	                //FileOutputStream fos = new FileOutputStream("/usr/share/tomcat8/webapps/SRservice/" + file.getOriginalFilename());
					FileOutputStream fos = new FileOutputStream("/home/ec2-user/srservice/image/" + saveFileName+'.'+contentType);
            
					// 윈도우일 경우
	                //FileOutputStream fos = new FileOutputStream(defaultDir+saveDir + saveFileName+'.'+contentType); //파일이 저장될 경로 설정
	                InputStream is = file.getInputStream();
	        
	        	    int readCount = 0;
	        	    byte[] buffer = new byte[1024];
	            while((readCount = is.read(buffer)) != -1){
	                fos.write(buffer,0,readCount);
	            }
	            map.put("success", true);
	            //response.sendRedirect("success"); // URI: api/success
	            //response.sendRedirect("/SRservice");
	            
	            
	            return "main"; // api/ 가 main.jsp 안에서 상대 경로가됨.
	        
		}else {
			map.put("success", false);
			map.put("error", "file didn't insert");
			response.sendRedirect("/SRservice");
			return "main";
		}
		
	}
}

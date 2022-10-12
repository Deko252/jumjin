package com.jumjin.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class Util {
	public static String save(String realPath, MultipartFile file) throws IOException {
		File upFile = new File(realPath);
		if (!upFile.exists()) {
			upFile.mkdirs();
		}

		
		String fileName = UUID.randomUUID().toString();
		fileName = fileName + "_" + file.getOriginalFilename();

		upFile = new File(upFile, fileName);
		FileCopyUtils.copy(file.getBytes(), upFile);
		return fileName;
	}


	public static int strToInt(String str) {// 2AAA3
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			return 1;
		}
	}


	public static String getIP(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
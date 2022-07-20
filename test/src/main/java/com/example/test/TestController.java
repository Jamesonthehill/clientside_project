package com.example.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.apache.catalina.util.URLEncoder;
import org.apache.ibatis.io.ResolverUtil.Test;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.sl.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class TestController {
	
	@Autowired
	TestServiceImpl service; // 프로세스 관리
	
	@RequestMapping(value = "/index")
	public String selectList(@ModelAttribute TestVo vo, Model model) throws Exception {
		
		/*
		 * String valueArr[][] = {{"gid","emd_cd","emd_nm"},
		 * {"sgg_oid","col_adm_se","geom"}};
		 * 
		 * Map<String, String[]> list = new HashMap<>(); // 뒤에있는 HashMap<[생략가능]>
		 * list.put("key01", valueArr[0]); list.put("key02", valueArr[1]);
		 */
		List<com.example.test.Test> list = service.selectList(); 
		model.addAttribute("list", list);
	
		return "index";
	}


	    @GetMapping("/excel/download")
	    public void excelDownload(HttpServletResponse response) throws IOException {
//	        Workbook wb = new HSSFWorkbook();
	        Workbook wb = new XSSFWorkbook();
	        org.apache.poi.ss.usermodel.Sheet sheet = wb.createSheet("첫번째 시트");
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;

	        // Header
	        row = sheet.createRow(rowNum++);
	        cell = row.createCell(0);
	        cell.setCellValue("번호");
	        cell = row.createCell(1);
	        cell.setCellValue("주소1");
	        cell = row.createCell(2);
	        cell.setCellValue("주소2");
	        cell = row.createCell(3);
	        cell.setCellValue("호수");
	        cell = row.createCell(4);
	        cell.setCellValue("평당가격");
	        cell = row.createCell(5);
	        cell.setCellValue("번지수");

	        // Body
	        for (int i=0; i<6; i++) {
	            row = sheet.createRow(rowNum++);
	            cell = row.createCell(0);
	            cell.setCellValue(i);
	            cell = row.createCell(1);
	            cell.setCellValue(i+"_name");
	            cell = row.createCell(2);
	            cell.setCellValue(i+"_title");
	            cell = row.createCell(1);
	            cell.setCellValue(i+"_name");
	            cell = row.createCell(2);
	            cell.setCellValue(i+"_title");
	            cell = row.createCell(2);
	            cell.setCellValue(i+"_title");
	        }

	        // 컨텐츠 타입과 파일명 지정
	        response.setContentType("ms-vnd/excel");
//	        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
	        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        // Excel File Output
	        wb.write(response.getOutputStream());
	        wb.close();
	    }
	    
//	    public static void main(String[] args) {
//	    	try {
//	    	    OutputStream output = new FileOutputStream("D:/factory/Output.txt");
//	    	    String str ="오늘 날씨는 아주 좋습니다.";
//	    	    byte[] by=str.getBytes();
//	    	    output.write(by);
//	    			
//	    	} catch (Exception e) {
//	                e.getStackTrace();
//	    	}
//	        }
	    }
		 
	    


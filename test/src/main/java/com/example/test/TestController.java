package com.example.test;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

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
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class TestController {
	
	@Autowired
	TestServiceImpl service; // 프로세스 관리
	
	@RequestMapping(value = "/index")
	public String selectList(@ModelAttribute TestVo vo, Model model, HttpServletResponse response) throws Exception {

			
		List<com.example.test.Test> list = service.selectList();
		model.addAttribute("list", list);
	
		return "index";
	}

	   @GetMapping("/")
	    public String home() {
	        return "home";
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
	        cell.setCellValue("이름");
	        cell = row.createCell(2);
	        cell.setCellValue("제목");

	        // Body
	        for (int i=0; i<3; i++) {
	            row = sheet.createRow(rowNum++);
	            cell = row.createCell(0);
	            cell.setCellValue(i);
	            cell = row.createCell(1);
	            cell.setCellValue(i+"_name");
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
	}

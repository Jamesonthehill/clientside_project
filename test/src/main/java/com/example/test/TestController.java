package com.example.test;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class TestController {
	
	@Autowired
	TestServiceImpl service; // 프로세스 관리
	
	@RequestMapping(value = "/index")
	public String selectList(@ModelAttribute TestVo vo, Model model) throws Exception {

			
		List<com.example.test.Test> list = service.selectList();
		model.addAttribute("list", list);
	
		return "index";
	}

}
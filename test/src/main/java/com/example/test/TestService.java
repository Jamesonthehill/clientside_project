package com.example.test;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;


@Service
@Transactional
public interface TestService {
	
	
	public List<Test> selectList() throws Exception;
		
	}
	
 
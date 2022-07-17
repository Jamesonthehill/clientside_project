package com.example.test;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;


@Service
public interface TestService {
	
	public List<com.example.test.Test> selectList() throws Exception;
		
	}
	

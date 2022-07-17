package com.example.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TestServiceImpl implements TestService {
	/* private final TestMapper testMapper; */
	@Autowired
	TestDao dao;
	
	@Override
	public List<com.example.test.Test> selectList() throws Exception {
		
		return dao.selectList();
	}
}

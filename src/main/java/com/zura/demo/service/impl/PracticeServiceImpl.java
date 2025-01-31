package com.zura.demo.service.impl;

import org.springframework.stereotype.Service;

import com.zura.demo.service.PracticeService;

@Service
public class PracticeServiceImpl implements PracticeService {

	@Override
	public String getData() {

		return "Welcome to Java Spring Boot Application";
	}
}

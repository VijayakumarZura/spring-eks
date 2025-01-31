package com.zura.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.zura.demo.api.PracticeApi;
import com.zura.demo.service.PracticeService;

@RestController
public class PracticeController implements PracticeApi {
	
	@Autowired
	PracticeService practiceService;

	@Override
	public String getData() {
		
		return practiceService.getData();
	}
}

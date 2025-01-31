package com.zura.demo.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public interface PracticeApi {

	@GetMapping("/getSampleData")
	public String getData();
}

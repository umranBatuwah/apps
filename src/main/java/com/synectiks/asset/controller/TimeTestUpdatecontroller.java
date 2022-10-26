package com.synectiks.asset.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.synectiks.asset.business.service.TimeService;

import com.synectiks.asset.domain.time;
import com.synectiks.asset.response.AvailabilityResponse;
import com.synectiks.asset.response.DataProtectionResponse;
import com.synectiks.asset.response.PerformanceResponse;
import com.synectiks.asset.response.SecurityResponse;
import com.synectiks.asset.response.UserExperianceResponse;
import com.synectiks.asset.util.RandomUtil;

@RestController
@RequestMapping("/api")
public class TimeTestUpdatecontroller {
    private static final Logger logger = LoggerFactory.getLogger(TimeTestUpdatecontroller.class);

    @Autowired
    private TimeService timeService;

    @GetMapping("/time-detail/leaving_json")
	public ResponseEntity<String> leaving_json() throws JsonProcessingException {
		logger.info("Start testing leaving_json");
        Map<String, Object> map = new HashMap<>();
    	List<time> list = timeService.getAlltimeDetail();
    	logger.debug("Updating leaving_json");
        for(time sd: list) {
			map.put("performance",(PerformanceResponse.builder().score(RandomUtil.getRandom()).build()));
			map.put("availability",(AvailabilityResponse.builder().score(RandomUtil.getRandom()).build()));
			map.put("security",(SecurityResponse.builder().score(RandomUtil.getRandom()).build()));
			map.put("dataProtection",(DataProtectionResponse.builder().score(RandomUtil.getRandom()).build()));
			map.put("userExperiance",(UserExperianceResponse.builder().score(RandomUtil.getRandom()).build()));
			sd.setLeaving_json(map);
			timeService.updatetimeDetail(sd);
		}
        logger.info("End testing leaving_json");
		return ResponseEntity.status(HttpStatus.OK).body("leaving_json updated");
	}
}

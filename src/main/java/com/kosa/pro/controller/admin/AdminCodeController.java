package com.kosa.pro.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.common.SearchVO;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminCodeController {

	@RequestMapping("/admincodemanagement")
	public String adminMangementMain(SearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>관리자 공지사항");
		return "admin/admincodemanagement";
	}
}

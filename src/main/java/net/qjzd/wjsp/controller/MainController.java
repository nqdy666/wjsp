package net.qjzd.wjsp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("")
public class MainController {

	@Autowired
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() throws Exception {
		return "index/index";
	}

	@RequestMapping(value="/start", method=RequestMethod.GET)
	public String start() throws Exception {
		return "start/index";
	}

	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public String contact() throws Exception {
		return "contact/index";
	}

	@RequestMapping(value="/404", method=RequestMethod.GET)
	public String notFound() throws Exception {
		return "index/index";
	}

	@RequestMapping(value="/error", method=RequestMethod.GET)
	public String error() throws Exception {
		return "index/index";
	}
}

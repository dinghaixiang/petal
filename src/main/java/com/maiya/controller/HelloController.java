package com.maiya.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



/**
 * Created by beck on 2016/11/16.
 */
@Controller
@RequestMapping("/petal")
public class HelloController {
    Logger logger= LoggerFactory.getLogger(HelloController.class);
    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public @ResponseBody String hello() {
        logger.info("11111111");
        return "hello";
    }
}

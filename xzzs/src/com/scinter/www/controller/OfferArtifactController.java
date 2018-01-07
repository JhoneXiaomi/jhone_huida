package com.scinter.www.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.scinter.www.dao.OfferArtifactMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.model.OfferArtifact;
import com.scinter.www.model.OrderInfo;

@Controller
public class OfferArtifactController {

	
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	@Autowired
	private OfferArtifactMapper offerArtifactMapper;
	
	@RequestMapping("getPrice")
	@ResponseBody
	private void getPrice(OfferArtifact offerArtifact,OrderInfo orderInfo,HttpServletResponse response){
		
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = null;
		JSONObject json = new JSONObject();
	 	Date currentDate = new Date();
		orderInfo.setCreateTime(currentDate);
		orderInfo.setStatus(1);
		orderInfoMapper.insert(orderInfo);
		
		Integer acreage =  offerArtifact.getAcreage();
		Integer badRoom =  offerArtifact.getBedRoom();
		Integer livingRoom = offerArtifact.getLivingRoom();
		Integer Toilet = offerArtifact.getToilet();
		Integer price ;
		
		if(acreage<40){
			
			json.put("price", 26800);
			json.put("res","您的报价为26800，稍后客服会与您联系！" );
		}
		
		if(acreage>=40 && acreage<60){
			
			price = (int) ((26800+(acreage-40)*368)*1.12);
			json.put("price", price);
			json.put("res","您的报价为"+price+"，稍后客服会与您联系！" );
		}else if(acreage>=60 && acreage<63){
			
			price = (int) ((26800+(acreage-40)*368)*1.12+1280);
			json.put("price", price);
			json.put("res","您的报价为"+price+"，稍后客服会与您联系！" );
		}else if(acreage>=63 &&acreage<=70){
			
			price = (int) (36800*1.12);
			json.put("price", price);
			json.put("res","您的报价为"+price+"，稍后客服会与您联系！" );
		}else if(acreage>=71 &&acreage<=79){
			
			price = (int) ((36800+(acreage-70)*368)*1.12);
			json.put("price", price);
			json.put("res","您的报价为"+price+"，稍后客服会与您联系！" );
		}else if(acreage>=80 && acreage<=109){
			
			price = (int) ((36800+(acreage-70)*368)*1.12+1280);
			json.put("price", price);
			json.put("res","您的报价为"+price+"，稍后客服会与您联系！" );
		}else if(acreage>=110){
			
			price = (int) ((36800+(acreage-70)*368)*1.12+1280+6000);
			json.put("price", price);
			json.put("res","您的报价为"+price+"，稍后客服会与您联系！" );

		}
			
			
		try {
			out = response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
}

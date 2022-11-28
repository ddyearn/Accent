package com.test.project01.master.category.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.test.project01.master.category.Dto.ItemDto;
import com.test.project01.master.category.Dto.categoryDto;
import com.test.project01.master.category.serevice.categoryService;
import com.test.project01.order.dto.OrdersDto;
import com.test.project01.qna.service.QnaService;
import com.test.project01.review.service.ReviewService;
import com.test.project01.unknown.service.Unknown_service;
import com.test.project01.users.Dto.UsersDto;
import com.test.project01.utils.UpLoadFileUtils;

@Controller
public class categoryController{
	
	@Autowired
	private categoryService service;
	@Autowired
	ReviewService reviewService;
	@Autowired
	QnaService qnaService;
	@Autowired
	Unknown_service unknown_service;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	@RequestMapping("/master/master_index")
	public ModelAndView Master_master_index(HttpServletRequest request,ModelAndView mView) {
		unknown_service.bestItemList(mView);
		unknown_service.newItemList(mView);
		mView.setViewName("master/master_index");
		return mView;
	}

	@RequestMapping("/master/register_form")
	public ModelAndView cotagoryList(@ModelAttribute categoryDto dto, 
			ModelAndView mView, HttpServletRequest request, HttpServletResponse response) {
		service.categoryList(mView);
		mView.setViewName("master/register_form");
		return mView;
	}
	@RequestMapping(value="/master/register", method = RequestMethod.POST)
	public ModelAndView Master_ItemInsert(@ModelAttribute ItemDto dto, MultipartFile file, HttpServletRequest request) throws IOException, Exception {
		String imgUpLoadPath = upLoadPath + File.separator + "imgUpLoad";
		String ymdPath = UpLoadFileUtils.calcPath(imgUpLoadPath);
		String fileName = null;
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName =  UpLoadFileUtils.fileUpload(imgUpLoadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 dto.setItemImg(File.separator + "imgUpLoad" + ymdPath + File.separator + fileName);
		 dto.setItemThumbImg(File.separator + "imgUpLoad" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			
		 fileName = File.separator + "images" + File.separator + "none.png";
		 dto.setItemImg(fileName);
		 dto.setItemThumbImg(fileName);

		}
		
		service.itemInsert(dto);
		return new ModelAndView("redirect:itemList.do");
	}
	@RequestMapping("/master/itemList")
	public ModelAndView Master_itemList(@ModelAttribute categoryDto dto, 
			ModelAndView mView, HttpServletRequest request, HttpServletResponse response) {
		service.itemList(mView, request);
		mView.setViewName("master/itemList");
		return mView;
	}
	@RequestMapping("/master/itemView_form")
	public ModelAndView Master_itemView_form(HttpServletRequest request, @RequestParam int itemNum, ModelAndView mView) {
		service.getItemView(mView, itemNum);
		/*리뷰,Q&A 추가*/
		reviewService.list2(request);
		String itemNum2=Integer.toString(itemNum);
		qnaService.getList2(request, itemNum2);
		mView.setViewName("master/itemView_form");
		return mView;
	}
	@RequestMapping("/master/item_modifyForm")
	public ModelAndView Master_itemModify_form(HttpServletRequest request, @RequestParam int itemNum, ModelAndView mView) {
		service.getItemViewList(mView, itemNum);
		mView.setViewName("master/item_modifyForm");
		return mView;
	}
	@RequestMapping(value="/master/item_modify", method = RequestMethod.POST)
	public ModelAndView Master_ItemUpDate(MultipartFile file, @ModelAttribute ItemDto dto, HttpServletRequest request, @RequestParam int itemNum) throws IOException, Exception {
		// 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(upLoadPath + request.getParameter("itemImg")).delete();
		  new File(upLoadPath + request.getParameter("itemThumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUpLoadPath = upLoadPath + File.separator + "imgUpLoad";
		  String ymdPath = UpLoadFileUtils.calcPath(imgUpLoadPath);
		  String fileName = UpLoadFileUtils.fileUpload(imgUpLoadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  dto.setItemImg(File.separator + "imgUpLoad" + ymdPath + File.separator + fileName);
		  dto.setItemThumbImg(File.separator + "imgUpLoad" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else { 
		  dto.setItemImg(request.getParameter("itemImg"));
		  dto.setItemThumbImg(request.getParameter("itemThumbImg"));
		  
		 }
		service.getItemUpdateDate(dto);	
		return new ModelAndView
				("redirect:itemView_form.do?itemNum="+itemNum);
	}
	@RequestMapping(value="/master/delete")
	public ModelAndView Master_ItemDelete(@RequestParam int itemNum, HttpServletRequest request) {
		service.itemDelete(itemNum,request);
		return new ModelAndView("redirect:itemList.do");	
	}
		
	@RequestMapping(value="fileupload.do", method=RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
                 MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null){
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = req.getServletContext().getRealPath("/img");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                        String fileUrl = req.getContextPath() + "/img/" + fileName;
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}	

	@RequestMapping("/master/no_master")
	public ModelAndView no_master(ModelAndView mView) {
		mView.setViewName("master/no_master");
		return mView;	
	}
		
	@ResponseBody
	@RequestMapping(value="/master/resultUpDate", method=RequestMethod.POST)
	public Map<String, Object> resultUpData(@RequestParam(value="resultArray[]")List<String> item) {
		OrdersDto orderDto = new OrdersDto();
		orderDto.setDelivery(item.get(0));
		orderDto.setOrderNum(Integer.parseInt(item.get(1)));
		service.upResult(orderDto);
		Map<String,Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	
	@RequestMapping("/master/usersList")
	public ModelAndView OrderAllList(ModelAndView mView, HttpServletRequest request) {
		service.OrderList(mView, request);
		mView.setViewName("master/usersList");
		return mView;	
	}
	
	@RequestMapping("/master/userVerify")
	public ModelAndView userVerify(ModelAndView mView, HttpServletRequest request) {
		service.getUserAllList(mView, request);
		mView.setViewName("master/userVerify");
		return mView;	
	}
	
	@ResponseBody
	@RequestMapping(value="/master/verifyUpDate", method=RequestMethod.POST)
	public Map<String, Object> verifyUpDate(@RequestParam(value="verifyArray[]")List<String> item) {
		UsersDto userDto = new UsersDto();
		userDto.setUserId(item.get(0));
		userDto.setVerify(Integer.parseInt(item.get(1)));
		service.userVerify(userDto);
		Map<String,Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	
}

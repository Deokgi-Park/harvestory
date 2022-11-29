package kr.ac.cropfit.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.cropfit.common.FileRename;
import kr.ac.cropfit.common.Pager;
import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Member;
import kr.ac.cropfit.model.Trade;
import kr.ac.cropfit.service.TradeService;

@Controller
@RequestMapping("/trade")
public class TradeController {

	final String tradePath = "trade/";

	@Autowired
	TradeService tradeSvc;


	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 포전매매 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	
	
	/* 상품 리스트 */
	   @GetMapping("/tradeList")
	   String productList(Model model, Pager pager) {
	      List<Trade> tradeList = tradeSvc.tradeList(pager);
	      model.addAttribute("tradeList",tradeList);
	      
	      return tradePath  + "tradeList";
	   }
	   
	   /* 나의 거래 리스트 */
	   @GetMapping("/tradeMyList")
	   void tradeMyList(Trade trade,Model model,HttpSession session) {
	      
	      Member loginMember = (Member) session.getAttribute("loginMember");
	      String user_ID = loginMember.getUser_ID();
	      
	      System.out.println(user_ID);
	      List<Trade> tradeMyList = tradeSvc.tradeMyList(user_ID);
	      
	      
	      model.addAttribute("tradeMyList", tradeMyList);

	         }
	   
	   /* 상품등록 */

	   @GetMapping("/tradeAdd")
	   String tradeAdd() {
	      return tradePath + "tradeAdd";
	   }

	   @Transactional
	   @PostMapping("/tradeAdd")
	   int tradeAdd(Trade tradeAddItem, HttpServletRequest request, Model model, HttpSession session,
	         @RequestParam(value = "Image", required = false) List<MultipartFile> Image) {
	      
	      int result1 = 1;
	      String user_ID = tradeAddItem.getUser_ID();
	      
	        String root = request.getSession().getServletContext().getRealPath("/");
	        String folderPath = "resources\\uploadThumbnail"; String savePath = root + folderPath;
	        String savePath1 = root + folderPath;
	        File folder = new File(savePath1);
	        
	        if (folder.exists() == false) 
	           folder.mkdir();
	       
	       List<Image> files = new ArrayList<Image>();
	       Image uv = null;
	        
	       try {
	            for (MultipartFile mf : Image) {
	               if (!mf.getOriginalFilename().equals("")) {
	                  String changeFileName = FileRename.rename(mf.getOriginalFilename());
	                  String originFileName = mf.getOriginalFilename(); // uv 객체 생성
	                  uv = new Image(changeFileName, originFileName, savePath1);

	                  // List<Image> files에 list 추가
	                  files.add(uv);
	               }
	            }
	            
	            uv.setUser_ID(user_ID);
	            
	            // 사진 + 게시글 업로드 Method
	            int result = tradeSvc.tradeAdd(tradeAddItem, files);
	            if (result > 0) {
	               for (Image file : files) { // 서버에 파일 저장
	                  for (MultipartFile mf : Image) {
	                     // 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
	                     System.out.println("mf.getOriginalFilename() : " + mf.getOriginalFilename());
	                     System.out.println("file.getIMG_ORGN_NM() : " + file.getImg_ORGN_NM());
	                     System.out.println("getIMG_PATH() : " + file.getImg_PATH());

	                     if (mf.getOriginalFilename().equals(file.getImg_ORGN_NM())) {
	                        mf.transferTo(new File(file.getImg_PATH() + "\\" + file.getImg_CHNG_NM()));
	                        break;
	                     }
	                  }
	               }
	            }
	         } catch (Exception e) {
	            e.printStackTrace();
	         }

	         return result1;
	   }
	   
	   
	   /*상품 삭제 */
	   @GetMapping("/tradeDelete")
	   String tradeDelete(int trade_NO) {
	      tradeSvc.tradeDelete(trade_NO);
	      
	      return "redirect:../trade/tradeList";
	   }
	   
	   /* 상품 업데이트 */
	   @GetMapping("/tradeUpdate")
	   String tradeUpdate(int trade_NO, Model model) {
	      System.out.println(trade_NO);
	      Trade tradeUpdateItem = tradeSvc.tradeUpdateItem(trade_NO);
	      model.addAttribute("tradeUpdateItem", tradeUpdateItem);
	      
	      return tradePath + "tradeUpdate";
	   }
	   
	   @Transactional
	   @PostMapping("/tradeUpdate")
	   String tradeUpdate(Trade trade, HttpServletRequest request, Model model, HttpSession session, Image image,
	         @RequestParam(value = "Thumbnail", required = false) List<MultipartFile> Thumbnail, String user_ID, int trade_NO) {
	      
	      trade.setUser_ID(user_ID);
	      trade.setTrade_NO(trade_NO);
	      
	      tradeSvc.tradeUpdate(trade);
	        
	      if(Thumbnail != null) {
	        String root = request.getSession().getServletContext().getRealPath("/");
	        String folderPath = "resources\\uploadThumbnail";
	        String savePath = root + folderPath;
	         
	        File folder = new File(savePath);
	        
	        if (folder.exists() == false) 
	           folder.mkdir();
	       
	       Image uv = null;
	        
	        try {
	        
	        for (MultipartFile mf : Thumbnail) {
	        
	           if (!mf.getOriginalFilename().equals("")) {
	       
	              List<Image> files = new ArrayList<Image>(); 
	              // 파일명 rename 
	              String changeFileName = FileRename.rename(mf.getOriginalFilename()); 
	              String  originFileName = mf.getOriginalFilename(); // uv 객체 생성 
	              uv = new Image(changeFileName, originFileName, savePath);
	       
	              // List<Image> files에 list 추가
	              files.add(uv); 
	              }
	           } 
	        
	           List<Image> files = new ArrayList<Image>();
	        
	           uv.setTrade_NO(trade_NO); 
	           uv.setUser_ID(user_ID); 
	           files.add(uv);
	      
	           // 사진 업로드 Method 
	           tradeSvc.tradeUpdateImage(files);
	        
	           for (Image file : files) { 
	              // 서버에 파일 저장 
	              for (MultipartFile mf : Thumbnail) {
	                 // 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
	                 System.out.println("mf.getOriginalFilename() : " + mf.getOriginalFilename());
	                 System.out.println("file.getIMG_ORGN_NM() : " + file.getImg_ORGN_NM());
	                 System.out.println("getIMG_PATH() : " + file.getImg_PATH());
	        
	                 if (mf.getOriginalFilename().equals(file.getImg_ORGN_NM())) {
	                    mf.transferTo(new File(file.getImg_PATH() + "\\" + file.getImg_CHNG_NM()));
	                    break; 
	                    }
	                 } 
	              }
	        
	       } catch (Exception e) { 
	          e.printStackTrace(); 
	       }
	       }
	      return "redirect:../trade/tradeList";
	   }
	   
	   /* 상품 상세페이지 */
	   @GetMapping("/tradeDetail")
	   String tradeDetail( Model model,int trade_NO) {
	      
	      Trade tradeDetail = tradeSvc.tradeDetail(trade_NO);
	      List<Image> tradeDetailImage = tradeSvc.tradeDetailImage(trade_NO);
	      
	      model.addAttribute("tradeDetail", tradeDetail);
	      model.addAttribute("tradeDetailImage", tradeDetailImage);
	      
	      /*
	      List<Trade> otherTrade = tradeSvc.otherTrade(trade);
	      if(!otherTrade.isEmpty()) {
	         model.addAttribute("otherTrade", otherTrade);
	      }
	      */
	      return tradePath + "tradeDetail";
	   }
	
	
	
	
	
	
	
	
	
	
	
	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비규격품 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	
	
	
	/**
	 * 비규격품 거래 리스트 출력
	 * 
	 * @param pager
	 * @return
	 */
	@GetMapping("/nspList")
	String nspList(Pager pager, Model model) {
		List<Trade> nspList = tradeSvc.nspList(pager);		
		model.addAttribute("nspList", nspList);		
		
		return tradePath + "nspList";
	}

	@GetMapping("/nspWrite")
	String nspWrite() {
		return tradePath + "nspWrite";
	}

	@Transactional
	@PostMapping("/nspWrite")
	void nspWrite(Trade nspWriteItem, HttpServletRequest request, Model model, HttpSession session,
			@RequestParam(value = "Image", required = false) List<MultipartFile> Image) {
		
		String user_ID = nspWriteItem.getUser_ID();

		String root = request.getSession().getServletContext().getRealPath("/");
		String folderPath = "resources\\uploadThumbnail";
		String savePath = root + folderPath;
		File folder = new File(savePath);

		if (folder.exists() == false)
			folder.mkdir();

		List<Image> files = new ArrayList<Image>();
		Image uv = null;

		try {
			for (MultipartFile mf : Image) {
				if (!mf.getOriginalFilename().equals("")) {
					String changeFileName = FileRename.rename(mf.getOriginalFilename());
					String originFileName = mf.getOriginalFilename(); // uv 객체 생성
					uv = new Image(changeFileName, originFileName, savePath);

					// List<Image> files에 list 추가
					files.add(uv);
				}
			}

			uv.setUser_ID(user_ID);

			// 사진 + 게시글 업로드 Method
			int result = tradeSvc.nspWrite(nspWriteItem, files);
			if (result > 0) {
				for (Image file : files) { // 서버에 파일 저장
					for (MultipartFile mf : Image) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						System.out.println("mf.getOriginalFilename() : " + mf.getOriginalFilename());
						System.out.println("file.getIMG_ORGN_NM() : " + file.getImg_ORGN_NM());
						System.out.println("getIMG_PATH() : " + file.getImg_PATH());

						if (mf.getOriginalFilename().equals(file.getImg_ORGN_NM())) {
							mf.transferTo(new File(file.getImg_PATH() + "\\" + file.getImg_CHNG_NM()));
							break;
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	@GetMapping("/nspDetail")
	String nspDetail(int trade_NO, Model model) {
		Trade nspDetailItem = tradeSvc.nspDetailItem(trade_NO);
		List<Image> nspDetailImages = tradeSvc.nspDetailImages(trade_NO);
		
		model.addAttribute("nspDetailItem", nspDetailItem);
		model.addAttribute("nspDetailImages", nspDetailImages);
		
		return tradePath + "nspDetail";		
	}
	
	@GetMapping("/nspDelete")
	String nspDelete(int trade_NO) {
		tradeSvc.nspDelete(trade_NO);
		
		return "redirect:../trade/nspList";
	}

	@GetMapping("/nspUpdate")
	String nspUpdate(int trade_NO, Model model) {
		Trade nspDetailItem = tradeSvc.nspDetailItem(trade_NO);
		List<Image> nspDetailImages = tradeSvc.nspDetailImages(trade_NO);
		
		model.addAttribute("nspDetailItem", nspDetailItem);
		model.addAttribute("nspDetailImages", nspDetailImages);
		
		return tradePath + "nspUpdate";		
	}
	
	@ResponseBody
	@PostMapping("/originImgDelete")
	void originImgDelete(int img_NO) {
		System.out.println("컨트롤러 = " + img_NO);
		tradeSvc.originImgDelete(img_NO);
	}
	
	
	@Transactional
	@PostMapping("/nspUpdate")
	String nspUpdate(Trade nspUpdateItem, HttpServletRequest request, Model model, HttpSession session,
			@RequestParam(value = "Image", required = false) List<MultipartFile> Image) {
		
		String user_ID = nspUpdateItem.getUser_ID();

		String root = request.getSession().getServletContext().getRealPath("/");
		String folderPath = "resources\\uploadThumbnail";
		String savePath = root + folderPath;
		File folder = new File(savePath);

		if (folder.exists() == false)
			folder.mkdir();

		List<Image> files = new ArrayList<Image>();
		Image uv = null;

		try {
			for (MultipartFile mf : Image) {
				if (!mf.getOriginalFilename().equals("")) {
					String changeFileName = FileRename.rename(mf.getOriginalFilename());
					String originFileName = mf.getOriginalFilename(); // uv 객체 생성
					uv = new Image(changeFileName, originFileName, savePath);

					// List<Image> files에 list 추가
					files.add(uv);
				}
			}

			// 사진 + 게시글 업로드 Method
			int result = tradeSvc.nspUpdate(nspUpdateItem, files);
			if (result > 0) {
				for (Image file : files) { // 서버에 파일 저장
					for (MultipartFile mf : Image) {
						// 빈문자열(파일이 없는 경우)가 아니면 실제 파일 정보를 저장하기 위해
						System.out.println("mf.getOriginalFilename() : " + mf.getOriginalFilename());
						System.out.println("file.getIMG_ORGN_NM() : " + file.getImg_ORGN_NM());
						System.out.println("getIMG_PATH() : " + file.getImg_PATH());

						if (mf.getOriginalFilename().equals(file.getImg_ORGN_NM())) {
							mf.transferTo(new File(file.getImg_PATH() + "\\" + file.getImg_CHNG_NM()));
							break;
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/trade/nspList";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/*
	 *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 크라우드 펀딩 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * */
	
	
	
	
	
	
}

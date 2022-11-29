package kr.ac.cropfit.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import kr.ac.cropfit.common.FileRename;
import kr.ac.cropfit.model.Board;
import kr.ac.cropfit.model.Image;
import kr.ac.cropfit.model.Member;
import kr.ac.cropfit.service.BoardService;
import kr.ac.cropfit.service.MemberService;


@Controller
@RequestMapping(value= {"/","/cropfit"})
@JsonIgnoreProperties(ignoreUnknown = true)
public class RootController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	MemberService memberService;

	@RequestMapping(value={"/","/index"})
	String index(HttpSession session) {
		//
		String url = "http://www.kamis.co.kr/"
				+ "service/price/xml.do?action=dailySalesList"
				+ "&p_cert_key=876837cd-5ab2-45bb-8227-853fbbea6cc3"
				+ "&p_cert_id=test"
				+ "&p_returntype=json";
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet req = new HttpGet(url);		
		HttpResponse res;
		try {
			res = client.execute(req);
			String json = EntityUtils.toString(res.getEntity(), "UTF-8");
			session.setAttribute("json", json);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "index";
	}
	@RequestMapping("/price_api")
	String price_api() {
		return "price_api";
	}
	
	
	@RequestMapping("/signUp")
	String signUp() {
		return "signUp";
	}

	
	/**
	 * SignUp - 아이디 중복체크 Ajax Method 
	 * 사용자가 입력한 아이디를 실시간으로 DB와 비교하여 중복여부 검사
	 * 처음 회원가입 시 입력한 아이디는 DB에 MEMBER_ID와 MEMBER_NAME 컬럼에 사용 
	 * 
	 * @param USER_ID
	 * @return String "dupY" || String "dupN"
	 */
	@ResponseBody
	@PostMapping("/idDupCheck")
	String idDupCheck(String user_ID) {
		System.out.println("``````````````user_ID:"+user_ID+"`````````````");
		int result = memberService.idDupCheck(user_ID);

		if (result > 0) {
			return "dupY";
		} else {
			return "dupN";
		}
		

	}

	
	/** signUp 
	 * @param signUpMember
	 * @param request
	 * @return 
	 */
	@PostMapping("/signUp")
	String signUp(Member signUpMember, HttpServletRequest request) {
		
		int signUpResult = memberService.signUp(signUpMember);
		
		if(signUpResult == 1)
			memberService.mailSendWithUserKey(signUpMember.getUser_EMAIL(), signUpMember.getUser_NAME(), request);
		else
			System.out.println("회원가입 실패");

		return "redirect:/";
	}
	
	
	
	/** signUp -- 이메일 인증(인증키 확인)
	 * @param user_ID
	 * @param key
	 * @return
	 */
	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("user_ID") String user_ID, @RequestParam("key") String key) {

		Member alterConfirmInfo = new Member();
		alterConfirmInfo.setUser_ID(user_ID);
		alterConfirmInfo.setKey(key);
		
		int alterConfirmResult = memberService.alter_userKey_service(alterConfirmInfo);
		
		if (alterConfirmResult == 0)
			System.out.println("이메일 인증 실패");
		
		return "redirect:/";
	}

	

	

	/** login
	 * @param loginRequest
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping("/login")
	String login(Member loginRequest, HttpSession session, Model model) {
		
		System.out.println(loginRequest.getUser_ID());
		System.out.println(loginRequest.getUser_PW());
		
		Member loginMember = memberService.login(loginRequest);
		
		if (loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			return "OK";			
		}
		return "FAIL";
		
	}
	
	/** logout
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	// 마이페이지
	
	@GetMapping("/myPage")
	String myPage(HttpSession session, Model model) {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		String user_ID = loginMember.getUser_ID();
		
		List<Board> myAskList = boardService.myAskList(user_ID);
		model.addAttribute("myAskList", myAskList);
		
		return "myPage";
	}
	
	
	  /** myPage -- 개인정보 변경
	 * @param request
	 * @param InfoChangeRequest
	 * @param image
	 * @param Thumbnail
	 * @param model
	 * @param session
	 * @return
	 */
	@Transactional
	  @PostMapping("/myInfoChange") 
	  String myInfoChange(HttpServletRequest request, Member InfoChangeRequest, Image image, 
			  @RequestParam(value = "Thumbnail", required = false) List<MultipartFile> Thumbnail, Model model, HttpSession session) {
	  
	  /* 기본 정보 변경 */
	  memberService.InfoChangeRequest(InfoChangeRequest);
	  
	  Member infoChangedMember = new Member();
	  
	  /* 프로필 사진 변경 */
	 
	  String userId = InfoChangeRequest.getUser_ID();
	  
	  String root = request.getSession().getServletContext().getRealPath("/");
	  String folderPath = "resources\\profileImg"; 
	  String savePath = root + folderPath;
	  
	  
	  File folder = new File(savePath);
	  
	  if (folder.exists() == false) folder.mkdir();
	 
	  Image uv = null;
	  
	  try {
		  for (MultipartFile mf : Thumbnail) {
			  if (!mf.getOriginalFilename().equals("")) {
	 
				 List<Image> files = new ArrayList<Image>(); // 파일명 rename 
				 String changeFileName = FileRename.rename(mf.getOriginalFilename()); 
				 String  originFileName = mf.getOriginalFilename(); // uv 객체 생성 
				 uv = new Image(changeFileName, originFileName, savePath);
	 
				  // List<Image> files에 list 추가
				 files.add(uv); } } 
				  
				  List<Image> files = new ArrayList<Image>();
				  uv.setUser_ID(userId); 
				  files.add(uv);
				
	 // 사진 업로드 Method 
	  memberService.userProfileChange(files);
	  
	  for (Image file : files) { // 서버에 파일 저장 
		  for (MultipartFile mf : Thumbnail) {
			   if (mf.getOriginalFilename().equals(file.getImg_ORGN_NM())) {
				   mf.transferTo(new File(file.getImg_PATH() + "\\" + file.getImg_CHNG_NM()));
				   break; 
				   } 
			   } 
		  }
	  
	 } catch (Exception e) { 
		 e.printStackTrace(); 
	 }
	
	 
	infoChangedMember = memberService.InfoChangedMember(InfoChangeRequest);
	 
	
	 if (infoChangedMember != null) { 
		 session.setAttribute("loginMember", infoChangedMember); 
	 } else {
		 model.addAttribute("msg", "로딩 중 오류가 발생했습니다. 로그아웃 후 다시 로그인 해주세요.");
	 }
	 
	 return "redirect:myPage";
  }
	  
	
	
	 /** myPage -- 비밀번호 변경
	 * @param user_ID
	 * @param user_CURR_PW
	 * @param user_PW
	 * @param model
	 * @param session
	 * @return
	 */
	@PostMapping("/myPasswordChng")
	  String myPasswordChng(String user_ID, String user_CURR_PW, String user_PW, Model model, HttpSession session) {
		  
		  System.out.println("아이디 : " + user_ID);
		  System.out.println("현재 비밀번호 : " + user_CURR_PW);
		  System.out.println("새 비밀번호 : " + user_PW);
		  
		  int pwChangeRq = memberService.myPasswordChng(user_ID, user_CURR_PW, user_PW);
		  
		  if(pwChangeRq > 0) {
			  model.addAttribute("msg", "비밀번호 변경 성공 - 변경 된 비밀번호로 다시 로그인 해주세요.");
			  return "redirect:logout";
		  } else {
		  	model.addAttribute("msg", "비밀번호 변경에 실패하였습니다. 재시도 해주세요.");
		  }
		  	return "redirect:myPage";
	  }
	  
	  
	  
	  
	  
	  
	  
	  
}
	
	
	
	
	
	
	/*
	 * // 카카오 로그인 https://kauth.kakao.com/oauth
	 * 
	 * @GetMapping("auth/kakao/callback") // jsp에서 카카오 서버로 요청한 값을 code로 응답받음
	 * public @ResponseBody String kakaoCallback(String code) {
	 * 
	 * // http 통신에 유용하게 쓸 수 있는 템플릿 RestTemplate rt = new RestTemplate();
	 * 
	 * // HttpHeader 오브젝트 생성 HttpHeaders headers = new HttpHeaders();
	 * headers.add("Content-type",
	 * "application/x-www-form-urlencoded;charset=utf-8");
	 * 
	 * // HttpBody 오브젝트 생성 // rest api키, uri 변수에 담아 사용할 것 MultiValueMap<String,
	 * String> params = new LinkedMultiValueMap<>(); params.add("grant_type",
	 * "authorization_code"); params.add("client_id",
	 * "fddfd3eadeb843d0f94d394904116b67"); //발급받은 restapi key 넣으세요.
	 * params.add("redirect_uri", "http://localhost:8010/cropfit/index"); //사이트에
	 * 기입해놓은 콜백 주소 // code는 일정하지 않음 params.add("code", code);
	 * 
	 * // 생성한 header, body를 하나의 오브젝트에 담음 HttpEntity<MultiValueMap<String, String>>
	 * kakaoTokenRequest = new HttpEntity<>(params, headers);
	 * 
	 * // Http 요청하기 = Post방식 - response 변수에 응답받음 ResponseEntity<String> response =
	 * rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
	 * kakaoTokenRequest, String.class);
	 * 
	 * ObjectMapper objectMapper = new ObjectMapper(); OAuthToken oauthToken = null;
	 * 
	 * try { oauthToken = objectMapper.readValue(response.getBody(),
	 * OAuthToken.class); } catch (JsonMappingException e) { e.printStackTrace(); }
	 * catch (JsonProcessingException e) { e.printStackTrace(); }
	 * 
	 * System.out.println("카카오 엑세스 토큰 : " + oauthToken.getAccess_token());
	 * 
	 * RestTemplate rt2 = new RestTemplate();
	 * 
	 * // HttpHeader 오브젝트 생성 HttpHeaders headers2 = new HttpHeaders();
	 * headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
	 * headers2.add("Content-type",
	 * "application/x-www-form-urlencoded;charset=utf-8");
	 * 
	 * // 생성한 header, body를 하나의 오브젝트로 HttpEntity<MultiValueMap<String, String>>
	 * kakaoProfileRequest2 = new HttpEntity<>(headers2);
	 * 
	 * // Http 요청하기 = Post방식 - response2 변수에 응답받음 ResponseEntity<String> response2 =
	 * rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
	 * kakaoProfileRequest2, String.class);
	 * 
	 * ObjectMapper objectMapper2 = new ObjectMapper(); KakaoProfile kakaoProfile =
	 * null;
	 * 
	 * try { kakaoProfile = objectMapper2.readValue(response2.getBody(),
	 * KakaoProfile.class); } catch (JsonMappingException e) {
	 * 
	 * e.printStackTrace();
	 * 
	 * } catch (JsonProcessingException e) {
	 * 
	 * e.printStackTrace();
	 * 
	 * }
	 * 
	 * System.out.println("카카오메일 : "+kakaoProfile.getKakao_account().getEmail());
	 * 
	 * //1. add 할 유저 오브젝트 만들기 //2. 기본키로 사용하는 이메일로 가입자 비가입자 체크 (서비스 생성) //3. 가입자면
	 * 로그인처리 //4. 소셜 가입자들은 암호변경 못하게 막아놔야함.(여러가지 방법으로 암호를 임의 설정)
	 * 
	 * 
	 * 
	 * return response.getBody(); // 작업 끝나고 어디로? }
	 */
	


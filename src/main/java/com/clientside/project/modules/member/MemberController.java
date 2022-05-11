package com.clientside.project.modules.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.clientside.project.modules.member.MemberServiceImpl;
import com.clientside.project.modules.member.Member;
import com.clientside.project.modules.member.MemberVo;



@Controller
public class MemberController {

	@Autowired
	MemberServiceImpl service; // 프로세스를 관리하는 애

	@RequestMapping(value = "/member/memberList")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

		int count = service.selectOneCount(vo);

		/*
		 * vo.setShOptionDate(vo.getShOptionDate() == null ? 1 : vo.getShOptionDate());
		 */

		/*
		 * vo.setShDateStart(vo.getShDateStart() == null ?
		 * UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(),
		 * Constants.DATE_INTERVAL) : vo.getShDateStart());
		 */

		/* UtilDateTime.addStringTime(vo.getShDateStart())); */
		/*
		 * vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() :
		 * vo.getShDateEnd());
		 */

		vo.setParamsPaging(count);

		/* vo.setParamsPaging(service.selectOneCount); */

		if (count != 0) {
			List<Member> list = service.selectList(vo);
			model.addAttribute("list", list);
		} else {

		}
		return "member/memberList";
	}

	@RequestMapping(value = "/login/loginForm")
	public String loginForm() throws Exception {

		return "login/loginForm";
	}

	@RequestMapping(value = "/member/memberForm")
	public String memberForm(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		System.out.println("memberForm");
		System.out.println("dto.thisPage(): " + vo.getThisPage());

		List<Member> selectNation = service.selectListNation();
		model.addAttribute("selectNation", selectNation);

		return "member/memberForm";
	}

	@RequestMapping(value = "/member/memberInst")
	public String memberInst(Model model, Member dto, MemberVo vo, RedirectAttributes redirectAttributes)
			throws Exception {

		System.out.println("dto.getIfmmId(): " + dto.getIfmmId());
		System.out.println("dto.getIfmmName(): " + dto.getIfmmName());
		System.out.println("dto.getIfmmNameEng(): " + dto.getIfmmNameEng());
		System.out.println("dto.getIfmmDob(): " + dto.getIfmmDob());
		System.out.println("dto.getIfmpNumber(): " + dto.getIfmpNumber());
		System.out.println("dto.getIfmpTelecomCd(): " + dto.getIfmpTelecomCd());
		System.out.println("dto.getIfmmPassword(): " + dto.getIfmmPassword());
		System.out.println("dto.getIfmmPassword2(): " + dto.getIfmmPassword2());
		System.out.println("dto.getIfmmGenderCd(): " + dto.getIfmmGenderCd());
		System.out.println("dto.getRegDateTime(): " + dto.getRegDateTime());
		System.out.println("dto.getIfmeEmailFull(): " + dto.getIfmeEmailFull());
		System.out.println("dto.getIfmaAddress1(): " + dto.getIfmaAddress1());
		System.out.println("dto.getIfmaAddress2(): " + dto.getIfmaAddress2());
		System.out.println("dto.getIfmaZipcode(): " + dto.getIfmaZipcode());
		System.out.println("dto.getIfmmEmailConsentNy(): " + dto.getIfmmEmailConsentNy());
		System.out.println("dto.getIfmaLat(): " + dto.getIfmaLat());
		System.out.println("dto.getIfmaLng(): " + dto.getIfmaLng());
		System.out.println("dto.getOriginalFileName(): " + dto.getOriginalFileName());
		System.out.println("dto.getUuidFileName(): " + dto.getUuidFileName());
		/* System.out.println("dto.getIfnName():" + dto.getIfnName()); */
		System.out.println("dto.getIfnSeq():" + dto.getIfnSeq());

		MultipartFile multipartFile = dto.getFile0(); // 이거 jsp 아이디 네임, member.java에 사용할것을 가져오면됨
		/* MultipartFile multipartFile = dto.getFile1(); */

		String fileName = multipartFile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1); // 입실1.png 중 . 뒤의값 png 값을 ext 담는다.
		String uuid = UUID.randomUUID().toString(); // randomUUID() : 유일무의한 이름을 생성하는함수
		String uuidFileName = uuid + "." + ext; // 유일무의한 값 + . 타입을 붙쳐주면 완성

		/*
		 * multipartFile.transferTo(new File(
		 * "C:/factory/ws_sts_4130/clientside_project/src/main/webapp/resources/uploaded/"
		 * + uuidFileName));
		 */
//		입력 실행
		dto.setOriginalFileName(fileName); // DB에 넣어주는 코등
		dto.setUuidFileName(uuidFileName);
		// 입력을 작동시킨다.
		int result = service.insert(dto);

		System.out.println("result: " + result);

		/*
		 * redirectAttributes.addAttribute("getIfmmId" + dto.getIfmmId());
		 * redirectAttributes.addAttribute("getIfmmName" + dto.getIfmmName());
		 * redirectAttributes.addAttribute("getIfmmDob" + dto.getIfmmDob());
		 * redirectAttributes.addAttribute("getIfmpNumber" + dto.getIfmpNumber());
		 * redirectAttributes.addAttribute("getIfmmPassword" + dto.getIfmmPassword());
		 * redirectAttributes.addAttribute("getIfmmPassword2" + dto.getIfmmPassword2());
		 * redirectAttributes.addAttribute("getIfmmGenderCd" + dto.getIfmmGenderCd());
		 * redirectAttributes.addAttribute("getRegDateTime" + dto.getRegDateTime());
		 * redirectAttributes.addAttribute("getIfmeEmailFull" + dto.getIfmeEmailFull());
		 * redirectAttributes.addAttribute("getIfmaAddress1" + dto.getIfmaAddress1());
		 * redirectAttributes.addAttribute("getIfmaAddress2" + dto.getIfmaAddress2());
		 * redirectAttributes.addAttribute("getIfmaZipcode" + dto.getIfmaZipcode());
		 */

		vo.setIfmmSeq(dto.getIfmmSeq());
		/* redirectAttributes.addFlashAttribute("dto", dto); */

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/memberView";
	}

	@RequestMapping(value = "/member/memberView") // 뷰.jsp에 대한 화면나옴
	public String MemberView(@ModelAttribute("vo") MemberVo vo, Member dto, Model model) throws Exception {

		System.out.println("vo.getIfmmSeq():" + vo.getIfmmSeq());
		// 디비까지 가서 한 건의 데이터 값을 가지고 온다 , vo
		System.out.println("vo.getThisPage():" + vo.getThisPage());
		Member rt = service.selectOne(vo);

		// 가지고 온 값을 jsp로 넘겨준다
		/* Member item = service.selectGender(vo); */

		model.addAttribute("rt", rt);
		/* model.addAttribute("item", item); */

		return "member/memberView";
	}

	/*
	 * @RequestMapping(value = "/member/memberEdit") // edit.jsp에 대한 화면나옴 public
	 * String MemberEdit(MemberVo vo, Model model) throws Exception {
	 * 
	 * //디비까지 가서 한 건의 데이터 값을 가지고 온다 , vo Member rt = service.selectOne(vo); // 가지고 온
	 * 값을 jsp로 넘겨준다 model.addAttribute("rt", rt);
	 * 
	 * return "member/memberEdit";
	 * 
	 * }
	 */

	@RequestMapping(value = "/member/memberEdit")
	public String memberEdit(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

		System.out.println("dto.getIfmmSeq():" + vo.getIfmmSeq());
		System.out.println("dto.getIfmmId():" + vo.getIfmmId());
		System.out.println("dto.getIfmmName():" + vo.getIfmmName());
		System.out.println("dto.getIfmpNumber():" + vo.getIfmpNumber());
		System.out.println("dto.getIfmeEmailFull():" + vo.getIfmeEmailFull());
		System.out.println("vo.getThisPage():" + vo.getThisPage());

		List<Member> selectNation = service.selectListNation();

		model.addAttribute("selectNation", selectNation);

		Member rt = service.selectOne(vo); // vo 에서 데이터 가져오기

		model.addAttribute("rt", rt); // jsp 들어가보면 list, item, rt 등등있는데 거기에 이름과 동일한 곳에 데이터를 넣겠다.
		return "member/memberEdit";
	}

	/*
	 * @RequestMapping(value = "/member/memberForm2") public String
	 * MemberForm2(MemberVo vo, Model model) throws Exception {
	 * 
	 * Member rt = service.selectOne(vo); // vo 에서 데이터 가져오기
	 * 
	 * 
	 * model.addAttribute("rt", rt); // jsp 들어가보면 list, item, rt 등등있는데 거기에 이름과 동일한
	 * 곳에 데이터를 넣겠다.
	 * 
	 * return "member/memberForm2"; }
	 */

	@RequestMapping(value = "/member/memberUpdt")
	public String MemberUpdt(Member dto, @ModelAttribute("vo") MemberVo vo, Model model,
			RedirectAttributes redirectAttributes) throws Exception {

		System.out.println("dto.getIfmmId(): " + dto.getIfmmId());
		System.out.println("dto.getIfmmName(): " + dto.getIfmmName());
		System.out.println("dto.getIfmmNameEng(): " + dto.getIfmmNameEng());
		System.out.println("dto.getIfmmDob(): " + dto.getIfmmDob());
		System.out.println("dto.getIfmpNumber(): " + dto.getIfmpNumber());
		System.out.println("dto.getIfmpTelecomCd(): " + dto.getIfmpTelecomCd());
		System.out.println("dto.getIfmmPassword(): " + dto.getIfmmPassword());
		System.out.println("dto.getIfmmPassword2(): " + dto.getIfmmPassword2());
		System.out.println("dto.getIfmmGenderCd(): " + dto.getIfmmGenderCd());
		System.out.println("dto.getRegDateTime(): " + dto.getRegDateTime());
		System.out.println("dto.getIfmeEmailFull(): " + dto.getIfmeEmailFull());
		System.out.println("dto.getIfmaAddress1(): " + dto.getIfmaAddress1());
		System.out.println("dto.getIfmaAddress2(): " + dto.getIfmaAddress2());
		System.out.println("dto.getIfmaZipcode(): " + dto.getIfmaZipcode());
		System.out.println("dto.getIfmmEmailConsentNy(): " + dto.getIfmmEmailConsentNy());
		System.out.println("dto.getIfmaLat(): " + dto.getIfmaLat());
		System.out.println("dto.getIfmaLng(): " + dto.getIfmaLng());
		System.out.println("dto.getIfnSeq():" + dto.getIfnSeq());
		System.out.println("vo.getThisPage():" + vo.getThisPage());
		/* System.out.println("vo.getThisPage():" + vo.getThisPage()); */

		/*
		 * int result = service.insert(dto);
		 * 
		 * System.out.println("result: " + result);
		 */
		service.update(dto); // 데이터를 받아오고 얘가 redirect보다 위에있어야 순서가 맞음.

		vo.setIfmmSeq(dto.getIfmmSeq());

		redirectAttributes.addFlashAttribute("vo", vo);
		/* redirectAttributes.addAttribute("thisPage" + vo.getThisPage()); */
		return "redirect:/member/memberView"; // 업데이트 해주는 영역

	}

	@RequestMapping(value = "/member/memberListDele")
	public String memberListDele(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {

		System.out.println("vo.getIfmmSeq():" + vo.getIfmmSeq());
		System.out.println("vo.getIfmmId():" + vo.getIfmmId());
		System.out.println("vo.getIfmmName():" + vo.getIfmmName());
		System.out.println("vo.getIfmpNumber():" + vo.getIfmpNumber());
		System.out.println("-----dto-----");
		System.out.println("dto.getIfmaAddress1():" + dto.getIfmaAddress1());
		System.out.println("dto.getIfnName():" + dto.getIfnName());

		service.delete(vo); // 데이터를 받아오고

		/*
		 * redirectAttributes.addAttribute("thisPage" + vo.getThisPage());
		 * redirectAttributes.addAttribute("shOption" + vo.getShOption());
		 * redirectAttributes.addAttribute("shValue" + vo.getShValue());
		 */

		return "redirect:/member/memberList?=" + vo.getIfmmSeq();
		// return "redirect:/member/memberList?shifmmSeq="+vo.getIfmmSeq(); // 업데이트 해주는
		// 영역

	}

	@RequestMapping(value = "/member/memberListNele")
	public String memberListNele(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.updateDelete(vo); // 데이터를 받아오고

		/*
		 * redirectAttributes.addAttribute("thisPage" + vo.getThisPage());
		 * redirectAttributes.addAttribute("shOption" + vo.getShOption());
		 * redirectAttributes.addAttribute("shValue" + vo.getShValue());rmsep
		 */

		return "redirect:/member/memberList?shifmmSeq=" + vo.getIfmmSeq(); // 업데이트 해주는 영역

	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/member/loginProc") public Map<String, Object>
	 * loginProc(Member dto, HttpSession httpSession) throws Exception { Map<String,
	 * Object> returnMap = new HashMap<String, Object>();
	 * 
	 * Member rtMember = service.selectOneLogin(dto);
	 * 
	 * if(rtMember != null) { // rtMember = service.selectOneLogin(dto);
	 * 
	 * if(rtMember.getIfmmSeq() != null) { //ref session.setMaxInactiveInterval(-1);
	 * // session time unlimited
	 * 
	 * httpSession.setAttribute("sessSeq", rtMember.getIfmmSeq());
	 * httpSession.setAttribute("sessId", rtMember.getIfmmId());
	 * httpSession.setAttribute("sessName", rtMember.getIfmmName());
	 * 
	 * returnMap.put("rt", "success"); } else { returnMap.put("rt", "fail"); } }
	 * else { returnMap.put("rt", "fail"); } return returnMap; }
	 */

	@ResponseBody
	@RequestMapping(value = "/member/loginProc")
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		Member rtMember = service.selectOneLogin(dto);

		if (rtMember != null) {
			Member rtMember2 = service.selectOneLogin(dto);
			if (rtMember2 != null) {

				httpSession.setAttribute("sessSeq", rtMember2.getIfmmSeq());
				httpSession.setAttribute("sessId", rtMember2.getIfmmId());
				httpSession.setAttribute("sessName", rtMember2.getIfmmName());

				// rtMember2.setIflgResultNy(1);
				// service.insertLogLogin(rtMember2);
			}
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}

	@ResponseBody
	@RequestMapping(value = "/member/logoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		httpSession.invalidate();

		returnMap.put("rt", "success");

		return returnMap;
	}


	@RequestMapping(value = "memberMultiDele")
	public String memberMultiDele(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {

		String[] checkboxSeqArray = vo.getCheckboxSeqArray();
		
		for(String checkboxSeq : checkboxSeqArray) {
			vo.setIfmmSeq(checkboxSeq);
			service.delete(vo);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
		
	}

}
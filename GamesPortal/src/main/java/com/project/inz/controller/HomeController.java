package com.project.inz.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.project.inz.dao.UserDao;
import com.project.inz.model.ScoreCard;
import com.project.inz.model.User;
import com.project.inz.model.UserRole;
import com.project.inz.service.QuizService;
import com.project.inz.service.RoleService;
import com.project.inz.service.ScoreCardService;
import com.project.inz.service.UserService;



/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private UserDao userDao;
	
	
	 @Autowired
	 UserService userService;
	 
	 @Autowired
	 ScoreCardService scoreService;
	
	 @Autowired
	 QuizService quizService;
	 
		
		
		@Autowired
		RoleService roleService;
	//@RequestMapping(value = "/", method = RequestMethod.GET)
	//public String defaultPage() {

//		ModelAndView model = new ModelAndView();
//		model.addObject("title", "Spring Security + Hibernate Example");
//		model.addObject("message", "This is default page!");
//		model.setViewName("login");
//		return model;
		
	//	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	//	String name = auth.getName();
	//	User user = userDao.findUserByUsername(name);
	//	 if(user == null) return "login"; //nie zalogowany   
		 
	//	if(user.getUserRole().equals("ROLE_ADMIN"))return "redirect:/admin"; //admin_home
	//	if(user.getUserRole().equals("ROLE_USER")) return "redirect:/users"; 
				
			
	//	return "login";

	//}
	
	
	
	
	
//	@RequestMapping(value="/")
//	public ModelAndView home() {
//		List<User> listUsers = userDao.list();
//		ModelAndView model = new ModelAndView("home");
//		model.addObject("userList", listUsers);
//		return model;
//	}
	
	
//
//	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
//	public ModelAndView adminPage() {
//
//		ModelAndView model = new ModelAndView();
//		model.addObject("title", "Spring Security + Hibernate Example");
//		model.addObject("message", "This page is for ROLE_ADMIN only!");
//		model.setViewName("admin");
//
//		return model;
//
//	}
//
//	@RequestMapping(value = "/login")
//	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
//			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {
//
//		ModelAndView model = new ModelAndView();
//		if (error != null) {
//			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
////			model.addAttribute("error", "Blad logowania");
//		}
//
//		if (logout != null) {
//			model.addObject("msg", "You've been logged out successfully.");
//		}
//		model.setViewName("login");
//
//		return model;
//
//	}
//	
//
//	// customize the error message
//	private String getErrorMessage(HttpServletRequest request, String key) {
//
//		Exception exception = (Exception) request.getSession().getAttribute(key);
//
//		String error = "";
//		if (exception instanceof BadCredentialsException) {
//			error = "Invalid username and password!";
//		} else if (exception instanceof LockedException) {
//			error = exception.getMessage();
//		} else {
//			error = "Invalid username and password!";
//		}
//
//		return error;
//	}
//
//	@RequestMapping(value = "/403", method = RequestMethod.GET)
//	public ModelAndView accesssDenied() {
//
//		ModelAndView model = new ModelAndView();
//
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		if (!(auth instanceof AnonymousAuthenticationToken)) {
//			UserDetails userDetail = (UserDetails) auth.getPrincipal();
//			System.out.println(userDetail);
			
//String username = auth.getName()
//			model.addObject("username", userDetail.getUsername());
//
//		}
//
//		model.setViewName("403");
//		return model;
//
//	}
	
	 

		@RequestMapping(value ="/registration", method = RequestMethod.GET)
		public String addUser(Map<String, Object> map) {
			User nowy = new User();
			nowy.setEnabled(true);
			UserRole role = roleService.getRole(2);
			nowy.setRoles(new HashSet<UserRole>(Arrays.asList(role)));
			map.put("user", nowy);
			map.put("roleList", roleService.listRoles());
			map.put("edit",false);
			
			return "/user/register";
		}
		
		
		@RequestMapping(value = "/registration", method = RequestMethod.POST)
		public String saveUser(@Valid User user, BindingResult result, Map<String, Object> map) {
			if (result.hasErrors()) {
				
				map.put("user", user);
				//map.put("roleList", roleService.listRoles());
				
				return "/user/registration";
			 
			} else {
			 
			    // form input is ok
				
			userService.saveUser(user);
			
			return "redirect:/";
			}
		}
		
		

		
	 
	 
	
	
	
	 @RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	    public String listUsers(ModelMap model) {
	 
	        List<User> users = userService.findAllUsers();
	        System.out.println("rola: "+ users.get(2).getRoles().toString());
	        model.addAttribute("users", users);
	        return "allUsers";
	    }
	 
	 @RequestMapping(value = { "/angular" }, method = RequestMethod.GET)
	    public String angular(ModelMap model) {
	        return "home";
	    }
	 
	 
	 @RequestMapping(value = { "/", "/home" })
		public String getUserDefault(ModelMap model) {
		 List<ScoreCard> topScorers = scoreService.getTopScores();
			HashMap<String, Integer> categoryDistribution = quizService.getCategoryDistribution();
		 	model.addAttribute("topScores", topScorers);
			model.addAttribute("categoryDistribution", categoryDistribution);
			return "login";
		}

		@RequestMapping("/login")
		public ModelAndView getLoginForm(@ModelAttribute User user,
				@RequestParam(value = "error", required = false) String error,
				@RequestParam(value = "logout", required = false) String logout) {

			String message = "";
			if (error != null) {
				message = "Incorrect username or password !";
			} else if (logout != null) {
				message = "Logout successful !";
			}
			return new ModelAndView("login", "message", message);
		}

		
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession(false);
			session.invalidate();
			List<ScoreCard> topScorers = scoreService.getTopScores();
			HashMap<String, Integer> categoryDistribution = quizService.getCategoryDistribution();
		 	model.addAttribute("topScores", topScorers);
			model.addAttribute("categoryDistribution", categoryDistribution);
			return "redirect:/";
		}
//		@RequestMapping("/admin**")
//		public String getAdminProfile() {
//			return "admin";
//		}

//		@RequestMapping("/user**")
//		public String getUserProfile() {
//			return "user";
//		}

		@RequestMapping("/403")
		public ModelAndView getAccessDenied() {
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			String username = "";
			if (!(auth instanceof AnonymousAuthenticationToken)) {
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				username = userDetail.getUsername();
			}

			return new ModelAndView("403", "username", username);
		}

		
	
	
	
}

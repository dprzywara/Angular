package com.project.inz.controller;


import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.project.inz.model.Category;
import com.project.inz.model.Comment;
import com.project.inz.model.Invitation;
import com.project.inz.model.MyForm;
import com.project.inz.model.Question;
import com.project.inz.model.Quiz;
import com.project.inz.model.ScoreCard;
import com.project.inz.model.User;
import com.project.inz.model.UserRole;
import com.project.inz.service.CategoryService;
import com.project.inz.service.CommentService;
import com.project.inz.service.InvitationService;
import com.project.inz.service.QuestionService;
import com.project.inz.service.QuizService;
import com.project.inz.service.RoleService;
import com.project.inz.service.ScoreCardService;
import com.project.inz.service.UserService;



@Controller
@RequestMapping("/user")
public class UserController {
	

	@Autowired
	 QuestionService questionService;
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	CommentService commentService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	ScoreCardService scoreService;
	
	@Autowired
	QuizService quizService;
	
	@Autowired
    InvitationService invitationService;
	
	@Autowired
	@Qualifier("sessionRegistry")
	private SessionRegistry sessionRegistry;
	
	
	
	
	
	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/updateUser" }, method = RequestMethod.GET)
	public String editUser( ModelMap model) {
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		
		model.addAttribute("user", user);
		model.addAttribute("username", username);
		model.addAttribute("roleList", roleService.listRoles());
		model.addAttribute("edit", true);
		return "/user/userFormEdit";
	}
	
	@RequestMapping(value = { "/changePassword" }, method = RequestMethod.GET)
	public String editUserpsss( ModelMap model) {
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		
		model.addAttribute("user", user);
		model.addAttribute("username", username);
		model.addAttribute("roleList", roleService.listRoles());
		model.addAttribute("edit", true);
		return "/user/userFormPassword";
	}
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/updateUser" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			return "/user/userFormEdit";
		}
User oldUser = userService.findById(user.getId());
oldUser.setEmail(user.getEmail());
oldUser.setFirstName(user.getFirstName());
oldUser.setLastName(user.getLastName());

		userService.updateUser(oldUser);

		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
		return "redirect:/user/home";
	}
	
	@RequestMapping(value = { "/changePassword" }, method = RequestMethod.POST)
	public String updateUserpassword(@Valid User user, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			return "/user/userFormPassword";
		}
User oldUser = userService.findById(user.getId());
oldUser.setEmail(user.getEmail());
oldUser.setFirstName(user.getFirstName());
oldUser.setLastName(user.getLastName());

		userService.updateUser(oldUser);

		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
		return "redirect:/user/home";
	}
	
	
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String  teest(Map<String, Object> parameters) {
		List<User> listaKierowcow = userService.findAllUsers();
		parameters.put("taxiList", listaKierowcow);
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		//if (auth != null) {
			//String login = auth.getName();
			parameters.put("userLogin", "user");
			System.out.println("wchodzi@@@@@@@@@@@@@@@@@@@@@@@");
			//model.addAttribute("userRole", auth.getAuthorities());
		//}
		return "/user/test";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String Home( Model model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		
		if (auth != null) {
			String username = auth.getName();
			User user = userService.findUserByLogin(username);
		
				//map.put("username", username);
				//map.put("userRole", auth.getAuthorities());
			
			
		List<ScoreCard> attemptedQuizzes = scoreService.updateHighestScore(user.getCards());
		HashMap<String, Integer> categoryDistribution = scoreService.getCategoryCountForPlayedQuizzes(user.getCards());

		List<User> listaKierowcow = userService.findAllUsers();
		model.addAttribute("taxiList", listaKierowcow);
		
		
		List<Quiz> popularQuizzes = quizService.getMostPopularQuizes();
		model.addAttribute("username", username);
		model.addAttribute("scoreCards", user.getCards());
		model.addAttribute("popularQuizList", popularQuizzes);
		model.addAttribute("attemptedQuizzes", attemptedQuizzes);
		model.addAttribute("categoryWiseDistribution", categoryDistribution);
		return "/user/userDashboard";
		}
		else{
			List<ScoreCard> topScorers = scoreService.getTopScores();
			HashMap<String, Integer> categoryDistribution = quizService.getCategoryDistribution();
		 	model.addAttribute("topScores", topScorers);
			model.addAttribute("categoryDistribution", categoryDistribution);
			return "/";
		}

	}
	
	
	
	@RequestMapping(value = "/chooseQuiz", method = RequestMethod.GET)
	public String searchQuiz(Locale locale, Model model,HttpServletRequest request) {
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		List<Quiz> quizList = quizService.getAllQuizzes();
		List<Quiz> quizList4User = new ArrayList<Quiz>();
		for (Quiz quiz : quizList) {
			if(!(scoreService.checkIfUserHasPlayedQuiz(user, quiz.getId()))){
				quizList4User.add(quiz);
			}
		}
		model.addAttribute("username", username);
		model.addAttribute("quizList", quizList4User);
		return "listQuizzes";
	}
	@RequestMapping(value = "/chooseQuizComment", method = RequestMethod.GET)
	public String searchQuizComment(Locale locale, Model model,HttpServletRequest request) {
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		List<Quiz> quizList = quizService.getAllQuizzes();
		List<Quiz> quizList4User = new ArrayList<Quiz>();
		for (Quiz quiz : quizList) {
			if(!(scoreService.checkIfUserHasPlayedQuiz(user, quiz.getId()))){
				quizList4User.add(quiz);
			}
		}
		model.addAttribute("username", username);
		model.addAttribute("quizList", quizList4User);
		return "listQuizzesComment";
	}
	
	
	@RequestMapping(value = "/quiz/play/{roomId}/{quizId}", method = RequestMethod.GET)
	public String attempQuiz(@PathVariable("quizId") int quizId,@PathVariable("roomId") int room,
			HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		Quiz attemptingQuiz = quizService.getQuiz(quizId);
		
		//System.out.println("quiz wyslany do attempt "+attemptingQuiz.getName());
		model.addAttribute("username", username);
		model.addAttribute("quiz", attemptingQuiz);
		model.addAttribute("email", user.getEmail());
		model.addAttribute("room", room);
		return "/user/quizAttempt";
	}
	
	
	@RequestMapping(value = "/quiz/play/{quizId}", method = RequestMethod.GET)
	public String attemptQuiz(@PathVariable("quizId") int quizId,
			HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		Quiz attemptingQuiz = quizService.getQuiz(quizId);
		
		//System.out.println("quiz wyslany do attempt "+attemptingQuiz.getName());
		model.addAttribute("username", username);
		model.addAttribute("quiz", attemptingQuiz);
		model.addAttribute("email", user.getEmail());
		return "/user/quizAttemptsingle";
	}
	
	
	
	@RequestMapping(value = "/quiz/play", method = RequestMethod.POST)
	public String attempQuiz(@RequestParam("room") int room,@RequestParam("count") Integer currentCount,
			@RequestParam("quizId") Integer quizId, HttpServletRequest request,
			Model model) {
		
		System.out.println("przychodzi quizId "+quizId + " i count "+ currentCount);
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		
//		if (scoreService.checkIfUserHasPlayedQuiz(user, quizId)) {
//			return "duplicateAttempt";
//		}
		// get the quiz and store it in the session
		Quiz quizToPlay = quizService.getQuiz(quizId);
		request.getSession().setAttribute("quizBeingAnswered", quizToPlay);
		Set<Question> questions = quizToPlay.getQuestions();
		
		
		
		List<Question> questionsToAnswer = new ArrayList<Question>(questions);
		
//		!!!!!!!!!!!!!!!!!!!!!!!!tutaj zmianyt
		
		Collections.sort(questionsToAnswer, new Comparator<Question>() {

	        public int compare(Question o1, Question o2) {
	            return o2.getId().compareTo(o1.getId());
	        }
	    });
		///////////////////////////////////////////////////////
		
//		for (Iterator<Question> it = questions.iterator(); it.hasNext();) {
//			Question currentQuestion = it.next();
//			questionsToAnswer.add(currentQuestion);
//		}
		
		
		request.getSession().setAttribute("questionsBeingAnswered",
				questionsToAnswer);
		// get the current question object and send it to the jsp
		model.addAttribute("username", username);
		Question currentQuestion = questionsToAnswer.get(currentCount);
		model.addAttribute("question", currentQuestion);
		model.addAttribute("quiz", quizToPlay);
		model.addAttribute("currentCount", currentCount + 1);
		if (currentCount == quizToPlay.getQuestions().size()) {
			model.addAttribute("isLastQuestion", 1);
		} else {
			model.addAttribute("isLastQuestion", 0);
		}
		model.addAttribute("room", room);
		model.addAttribute("email", user.getEmail());
		return "/user/question";

	}
	@RequestMapping(value = "/quiz/play/single", method = RequestMethod.POST)
	public String attempQuizsingle(@RequestParam("count") Integer currentCount,
			@RequestParam("quizId") Integer quizId, HttpServletRequest request,
			Model model) {
		
		System.out.println("przychodzi quizId "+quizId + " i count "+ currentCount);
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		
//		if (scoreService.checkIfUserHasPlayedQuiz(user, quizId)) {
//			return "duplicateAttempt";
//		}
		// get the quiz and store it in the session
		Quiz quizToPlay = quizService.getQuiz(quizId);
		request.getSession().setAttribute("quizBeingAnswered", quizToPlay);
		Set<Question> questions = quizToPlay.getQuestions();
		
		
		
		List<Question> questionsToAnswer = new ArrayList<Question>(questions);
		
//		!!!!!!!!!!!!!!!!!!!!!!!!tutaj zmianyt
		
		Collections.sort(questionsToAnswer, new Comparator<Question>() {
			
			public int compare(Question o1, Question o2) {
				return o2.getId().compareTo(o1.getId());
			}
		});
		///////////////////////////////////////////////////////
		
//		for (Iterator<Question> it = questions.iterator(); it.hasNext();) {
//			Question currentQuestion = it.next();
//			questionsToAnswer.add(currentQuestion);
//		}
		
		
		request.getSession().setAttribute("questionsBeingAnswered",
				questionsToAnswer);
		// get the current question object and send it to the jsp
		model.addAttribute("username", username);
		Question currentQuestion = questionsToAnswer.get(currentCount);
		model.addAttribute("question", currentQuestion);
		model.addAttribute("quiz", quizToPlay);
		model.addAttribute("currentCount", currentCount + 1);
		if (currentCount == quizToPlay.getQuestions().size()) {
			model.addAttribute("isLastQuestion", 1);
		} else {
			model.addAttribute("isLastQuestion", 0);
		}
//		model.addAttribute("room", room);
		model.addAttribute("email", user.getEmail());
		return "/user/questionSingle";
		
	}
	
	
	
	
	
	
	@RequestMapping(value = "/quiz/postAnswer", method = RequestMethod.POST)
	public String postQuestion(@ModelAttribute("question") Question question,
			@RequestParam("isLastQuestion") Integer isLastQuestion,
			@RequestParam("count") Integer currentCount,@RequestParam("room") Integer room,
			HttpServletRequest request, Model model) {
		// add to session and redirect to next question view
		@SuppressWarnings("unchecked")
		List<Question> answeredQuestions = (List<Question>) request
				.getSession().getAttribute("answeredQuestions");
		
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		if (isLastQuestion == 0) {
//jesli nie ma listy odpowiedzi to utworz i dodaj aktualne pytanie
			if (answeredQuestions == null) {
				answeredQuestions = new ArrayList<Question>();
				answeredQuestions.add(question);
				request.getSession().setAttribute("answeredQuestions",
						answeredQuestions);
			} else {
				
				//aktualizuj liste odpowiedzi
				answeredQuestions.add(question);
				request.getSession().setAttribute("answeredQuestions",
						answeredQuestions);
			}
			@SuppressWarnings("unchecked")
			List<Question> questionsToAnswer = (List<Question>) request
					.getSession().getAttribute("questionsBeingAnswered");
			Quiz quizToAttempt = (Quiz) request.getSession().getAttribute(
					"quizBeingAnswered");
			// get the current question object and send it to the jsp
			Question currentQuestion = questionsToAnswer.get(currentCount);
			model.addAttribute("username", username);
			model.addAttribute("question", currentQuestion);
			model.addAttribute("quiz", quizToAttempt);
			model.addAttribute("currentCount", currentCount + 1);
			if (currentCount + 1 == questionsToAnswer.size()) {
				model.addAttribute("isLastQuestion", 1);
			} else {
				model.addAttribute("isLastQuestion", 0);
			}
			
			model.addAttribute("email", user.getEmail());
			model.addAttribute("room", room);
			return "/user/question";

		} else {
			
			@SuppressWarnings("unchecked")
			List<Question> questionsToAnswer = (List<Question>) request
					.getSession().getAttribute("questionsBeingAnswered");
			// get the list of answered questions from session and pass it to
			// service layer
			answeredQuestions.add(question);
			Quiz quizToAttempt = (Quiz) request.getSession().getAttribute(
					"quizBeingAnswered");
			ScoreCard newScore = scoreService.attemptQuiz(
					quizToAttempt, user, answeredQuestions);
			//ScoreCard currentScoreCard = newScore.getEntity();
			if (newScore!=null) {
				model.addAttribute("username", username);
				model.addAttribute("myScore", newScore.getScore());
				model.addAttribute("quiz", quizToAttempt);
				model.addAttribute("room", room);
				model.addAttribute("maxPoints",questionsToAnswer.size());
				model.addAttribute("email", user.getEmail());
				model.addAttribute("highestScore", scoreService.findHighestScore(quizToAttempt.getScores()));
				//if(invitationService.findById(room)!=null)invitationService.deleteInvitation(room); //tu jest problem
				return "/user/scoreForAttemptedQuiz";
			} else 
				return "defaultError";
			}
			// return score card view
			//return "/user/scoreForAttemptedQuiz";

	}
	@RequestMapping(value = "/quiz/postAnswer/single", method = RequestMethod.POST)
	public String postQuestionSingle(@ModelAttribute("question") Question question,
			@RequestParam("isLastQuestion") Integer isLastQuestion,
			@RequestParam("count") Integer currentCount,
			HttpServletRequest request, Model model) {
		// add to session and redirect to next question view
		@SuppressWarnings("unchecked")
		List<Question> answeredQuestions = (List<Question>) request
		.getSession().getAttribute("answeredQuestions");
		
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		if (isLastQuestion == 0) {
//jesli nie ma listy odpowiedzi to utworz i dodaj aktualne pytanie
			if (answeredQuestions == null) {
				answeredQuestions = new ArrayList<Question>();
				answeredQuestions.add(question);
				request.getSession().setAttribute("answeredQuestions",
						answeredQuestions);
			} else {
				
				//aktualizuj liste odpowiedzi
				answeredQuestions.add(question);
				request.getSession().setAttribute("answeredQuestions",
						answeredQuestions);
			}
			@SuppressWarnings("unchecked")
			List<Question> questionsToAnswer = (List<Question>) request
			.getSession().getAttribute("questionsBeingAnswered");
			Quiz quizToAttempt = (Quiz) request.getSession().getAttribute(
					"quizBeingAnswered");
			// get the current question object and send it to the jsp
			Question currentQuestion = questionsToAnswer.get(currentCount);
			model.addAttribute("username", username);
			model.addAttribute("question", currentQuestion);
			model.addAttribute("quiz", quizToAttempt);
			model.addAttribute("currentCount", currentCount + 1);
			if (currentCount + 1 == questionsToAnswer.size()) {
				model.addAttribute("isLastQuestion", 1);
			} else {
				model.addAttribute("isLastQuestion", 0);
			}
			
			model.addAttribute("email", user.getEmail());
			return "/user/questionSingle";
			
		} else {
			
			@SuppressWarnings("unchecked")
			List<Question> questionsToAnswer = (List<Question>) request
			.getSession().getAttribute("questionsBeingAnswered");
			// get the list of answered questions from session and pass it to
			// service layer
			answeredQuestions.add(question);
			Quiz quizToAttempt = (Quiz) request.getSession().getAttribute(
					"quizBeingAnswered");
			ScoreCard newScore = scoreService.attemptQuiz(
					quizToAttempt, user, answeredQuestions);
			//ScoreCard currentScoreCard = newScore.getEntity();
			if (newScore!=null) {
				model.addAttribute("username", username);
				model.addAttribute("myScore", newScore.getScore());
				model.addAttribute("quiz", quizToAttempt);
				model.addAttribute("maxPoints",questionsToAnswer.size());
				model.addAttribute("email", user.getEmail());
				model.addAttribute("highestScore", scoreService.findHighestScore(quizToAttempt.getScores()));
				//if(invitationService.findById(room)!=null)invitationService.deleteInvitation(room); //tu jest problem
				return "/user/scoreForAttemptedQuizSingle";
			} else 
				return "defaultError";
		}
		// return score card view
		//return "/user/scoreForAttemptedQuiz";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

	@RequestMapping(value = "/selectUser/{quiz}", method = RequestMethod.GET)
	public String selectUser(@PathVariable("quiz")  String quiz, Map<String, Object> map) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth == null) {
			return "redirect:/";
		}
			String currentuser = auth.getName();
		
		List<Object> principals = sessionRegistry.getAllPrincipals();
		List<String> usersNamesList = new ArrayList<String>();
		List<User> userList	= new ArrayList<User>();
		
		for (Object principal: principals) {
		    if (principal instanceof org.springframework.security.core.userdetails.User) {
		        usersNamesList.add(((org.springframework.security.core.userdetails.User) principal)
		        		.getUsername());
		    }
		}
		for (String username : usersNamesList) {
				userList.add(userService.findUserByLogin(username));
		}
		map.put("users", userList);
		map.put("quizName", quiz);
		map.put("username", currentuser);
		map.put("User", new User());  
		
        return "/user/selectUser";
		
	}
	
	
	
	
	
	@RequestMapping(value="/selectCategory", method = RequestMethod.GET)  
    private String optionsTag(Map<String, Object> map) {   
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth == null) {
			return "redirect:/";
		}
			String currentuser = auth.getName();
		
		map.put("categoryList", categoryService.findAllCategories());
		List<Object> principals = sessionRegistry.getAllPrincipals();
		List<String> usersNamesList = new ArrayList<String>();
		List<User> userList	= new ArrayList<User>();
		
		for (Object principal: principals) {
		    if (principal instanceof org.springframework.security.core.userdetails.User) {
		        usersNamesList.add(((org.springframework.security.core.userdetails.User) principal).getUsername());
		    }
		}
		for (String username : usersNamesList) {
			//if(!(username.equals(currentUser)))
				userList.add(userService.findUserByLogin(username));
		}
		map.put("users", userList);
		map.put("category", new Category());
		map.put("username", currentuser);
		return "/user/selectCategory";
    }  
	
	@RequestMapping(value = { "/selectCategory" }, method = RequestMethod.POST)
	public String selectCategory(@Valid Category category, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			return "/user/selectCategory";
		}
		String name = category.getName();
		int id =category.getId();

		return "redirect:/user/selectQuiz/"+id;
	}
	
	
	@RequestMapping(value="/selectQuiz/{category}", method = RequestMethod.GET)  
    private String selectQuiz(@PathVariable("category")  Integer id,Map<String, Object> map) {   
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth == null) {
			return "redirect:/";
		}
			String currentuser = auth.getName();
//		map.put("quizList", categoryService.findAllCategories());
			String category = categoryService.findById(id).getName();
		map.put("quizList", quizService.getQuizzesFromCategory(category));
	
		map.put("quiz", new Quiz());
		map.put("myform", new MyForm());
//		map.put("category", new Category());
		map.put("username", currentuser);
		return "/user/selectQuiz";
    } 
	
	@RequestMapping(value = { "/selectQuiz/" }, method = RequestMethod.POST)
//	@RequestMapping(value = { "/selectQuiz/{category}" }, method = RequestMethod.POST)
	public String selectQuiz(@ModelAttribute("myform") MyForm myform,BindingResult result,Model model ) {	
	//			public String selectQuiz(@Valid Quiz quiz, ,
			

		Integer quizId= myform.getQuizId();
		
		if (result.hasErrors()) {
			System.out.println("blad post ");
			
			
//			for (Object object : result.getAllErrors()) {
//				
//				System.out.println("error ; ");
//			    if(object instanceof FieldError) {
//			        FieldError fieldError = (FieldError) object;
//
//			        System.out.println(fieldError.getCode() +" "+fieldError.getField());
//			    }
//
//			    if(object instanceof ObjectError) {
//			        ObjectError objectError = (ObjectError) object;
//
//			        System.out.println(objectError.getCode());
//			    }
//			}
//			
//			
			return "/user/selectQuiz";
		}
		//String name = quiz.getName();
//System.out.println("post z nazwa quizu "+name);
		return "redirect:/user/selectUser/"+quizId;
	}
	
	@RequestMapping(value="/question", method = RequestMethod.GET)  
    private String quiz(Map<String, Object> map) {  
       
		
		return "/test/question";
    }  
	@RequestMapping(value="/messages/{id}", method = RequestMethod.GET)  
	private String chat(@PathVariable("id")  Integer id,Map<String, Object> map) {  
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String login=null;
		if (auth != null) {
			 login = auth.getName();
			map.put("username", login);
		}
		
		User current= userService.findUserByLogin(login);
		
		
		map.put("email", current.getEmail());
		
		return "/user/privateChat";
	}  
	
	
	@RequestMapping(value="/messages", method = RequestMethod.GET)  
	private String selectuser(Map<String, Object> map) {  
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String login=null;
		if (auth != null) {
			 login = auth.getName();
			map.put("username", login);
		}
		
		User current= userService.findUserByLogin(login);
		
		List<Object> principals = sessionRegistry.getAllPrincipals();
		List<String> usersNamesList = new ArrayList<String>();
		List<User> userList	= new ArrayList<User>();
		
		for (Object principal: principals) {
		    if (principal instanceof org.springframework.security.core.userdetails.User) {
		        usersNamesList.add(((org.springframework.security.core.userdetails.User) principal).getUsername());
		    }
		}
		for (String username : usersNamesList) {
			//if(!(username.equals(currentUser)))
				userList.add(userService.findUserByLogin(username));
		}
		map.put("users", userList);
		map.put("email", current.getEmail());
		
		return "/user/privateChatSelect";
	}  
//	@RequestMapping(value="/test", method = RequestMethod.GET)  
//	private String test(Map<String, Object> map) {  
//		
//		
//		return "/user/test";
//	}  
	        
	

	 @RequestMapping(value = "/game/{category}", method = RequestMethod.GET)
	    public String game(@PathVariable("category")  String category, Map<String, Object> parameters) {
//		 public String game(@RequestParam(value = "category", required = false) String category, Map<String, Object> parameters) {
	     
		 List<Question> list = questionService.randQuestion4Game(category);
		 
		 parameters.put("questions", list);
	        return "/user/game";
	    }
	 
	 
		@RequestMapping(value = { "/edit-question-{questionId}" }, method = RequestMethod.POST)
		public String updateQuestion(@Valid Question question, BindingResult result,
				ModelMap model, @PathVariable String questionId) {

			if (result.hasErrors()) {
				return "/admin/questionForm";
			}

			questionService.updateQuestion(question);

			model.addAttribute("success", "Question " + question.getId() +  " updated successfully");
			return "redirect:/admin/questions";
		}
		
//		@RequestMapping(value = { "/select/{invitingUser}/{invitedId}" }, method = RequestMethod.POST)
		@RequestMapping(value = { "/select/{invitedId}/{quizId}" }, method = RequestMethod.POST)
		public String sendInvite(@PathVariable Integer quizId, @PathVariable Integer invitedId) {
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			String login =null;
			if (auth != null) {
				 login= auth.getName();
			}
			Invitation inv = new Invitation();
			inv.setStatus("invited");
			inv.setInvited(userService.findById(invitedId));
			inv.setInviting(userService.findUserByLogin(login)); // trzeba dodac quiz jeszcze do invitation
			inv.setQuizId(quizService.findById(quizId));
			invitationService.saveInvitation(inv);
			
			
			return "redirect:/user/quiz/play/"+inv.getId()+"/"+quizId;
		}
		@RequestMapping(value = { "/selectChat/{invitedId}" }, method = RequestMethod.POST)
		public String sendChatInvite(@PathVariable Integer invitedId) {
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			String login =null;
			if (auth != null) {
				login= auth.getName();
			}
			Invitation inv = new Invitation();
			inv.setStatus("chat");
			inv.setInvited(userService.findById(invitedId));
			inv.setInviting(userService.findUserByLogin(login)); // trzeba dodac quiz jeszcze do invitation
			inv.setQuizId(null);
			invitationService.saveInvitation(inv);
			
			
			return "redirect:/user/messages/"+inv.getId();
		}
		
		@RequestMapping(value = "/invitations", method = RequestMethod.GET)
		public String invitations(Model model) {
			List<User> listaKierowcow = userService.findAllUsers();
			model.addAttribute("taxiList", listaKierowcow);
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			
			String login = new String();
			if (auth != null) {
				login = auth.getName();
				model.addAttribute("userLogin", login);
				model.addAttribute("userRole", auth.getAuthorities());
			}

			User usr = userService.findUserByLogin(login);
			Set<Invitation> listaZlecen = usr.getUserInvited();
			model.addAttribute("invitations", listaZlecen);
			model.addAttribute("username", login);
			
			return "/user/invitations";
		}
		@RequestMapping(value = "/chat/invitations", method = RequestMethod.GET)
		public String chatinvitations(Model model) {
			List<User> listaKierowcow = userService.findAllUsers();
			model.addAttribute("taxiList", listaKierowcow);
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			
			String login = new String();
			if (auth != null) {
				login = auth.getName();
				model.addAttribute("userLogin", login);
				model.addAttribute("userRole", auth.getAuthorities());
			}
			
			User usr = userService.findUserByLogin(login);
			Set<Invitation> listaZlecen = new HashSet<Invitation>();
					for (Invitation inv : usr.getUserInvited()) {
						if(inv.getStatus().equals("chat")){
							listaZlecen.add(inv);
						}
					}
			model.addAttribute("invitations", listaZlecen);
			model.addAttribute("username", login);
			
			return "/user/chatInvitations";
		}
		
		
		 @RequestMapping(value = "/invitation/reject/{id}", method = RequestMethod.GET)
		    public String game(@PathVariable("id")  Integer id, Map<String, Object> parameters) {
		     
			 //wyslij powiadomienie 
			 invitationService.deleteInvitation(id);
			 return "redirect:/user/invitations";
		    }
		 @RequestMapping(value = "/invitation/accept/{room}/{id}", method = RequestMethod.GET)
		 public String gameAccept(@PathVariable("id")  Integer id,@PathVariable("room")  Integer room, Map<String, Object> parameters) {
			 
			 //wyslij powiadomienie 
			// invitationService.deleteInvitation(id);
			 //if(invitationService.findById(room)!=null) invitationService.deleteInvitation(room);
			 return "redirect:/user/quiz/play/"+room+"/"+id;
		 }
		
		 @RequestMapping(value = "/chatInvitation/accept/{room}", method = RequestMethod.GET)
		 public String chatAccept(@PathVariable("room")  Integer room, Map<String, Object> parameters) {
			 
			 //wyslij powiadomienie 
			 if(invitationService.findById(room)!=null) invitationService.deleteInvitation(room);
			 return "redirect:/user/messages/"+room;
		 }
		 
		 
		 
		 
			@RequestMapping(value = "/quiz/comment/{quizId}", method = RequestMethod.GET)
			public String writeComments(@PathVariable(value = "quizId") Integer quizID,
					Model model, HttpServletRequest request) {
				Authentication auth = SecurityContextHolder.getContext()
						.getAuthentication();
				String login = new String();
				if (auth == null) {
					return "redirect:/";
				}
				login = auth.getName();
				Quiz quizToCommentOn = quizService.getQuiz(quizID);
				Comment newComment = new Comment();
				model.addAttribute("quiz", quizToCommentOn);
				model.addAttribute("comment", newComment);
				model.addAttribute("username", login);
				return "/user/commentOnQuiz";
			}

			@RequestMapping(value = "/quiz/comment", method = RequestMethod.POST)
			public String writeComments(@ModelAttribute("comment") Comment newComment,
					@RequestParam(value = "quizId", required = true) Integer quizId,
					HttpServletRequest request) {

//				User currentUser = (User) request.getSession().getAttribute(
//						"loggedInUser");
//				if (currentUser == null) {
//					
//					return "redirect:/";
//				}
				Authentication auth = SecurityContextHolder.getContext()
						.getAuthentication();
				String login = auth.getName();
				if (newComment == null) {
					return "defaultError";
				}
				User usr = userService.findUserByLogin(login);
//				int userId = currentUser.getId();
				commentService.createComments(usr.getId(), quizId, newComment.getComment());
				return "redirect:/user/chooseQuizComment";
			}
		 
		
}

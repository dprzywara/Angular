package com.project.inz.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.inz.model.Question;
import com.project.inz.model.Quiz;
import com.project.inz.model.ScoreCard;
import com.project.inz.model.User;
import com.project.inz.service.CategoryService;
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
	CategoryService categoryservice;
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	ScoreCardService scoreService;
	
	@Autowired
	QuizService quizService;
	
//	@RequestMapping("/home")
//	public void home(Model model) {
//		Authentication auth = SecurityContextHolder.getContext()
//				.getAuthentication();
//		if (auth != null) {
//			String login = auth.getName();
//			model.addAttribute("username", login);
//			model.addAttribute("userRole", auth.getAuthorities());
//		}
//	}
	
	
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
		model.addAttribute("username", username);
		model.addAttribute("quizList", quizList);
		return "listQuizzes";
	}
	
	
	@RequestMapping(value = "/quiz/play/{quizId}", method = RequestMethod.GET)
	public String attempQuiz(@PathVariable("quizId") int quizId,
			HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		Quiz attemptingQuiz = quizService.getQuiz(quizId);
		model.addAttribute("username", username);
		model.addAttribute("quiz", attemptingQuiz);
		return "/user/quizAttempt";
	}
	
	
	
	@RequestMapping(value = "/quiz/play", method = RequestMethod.POST)
	public String attempQuiz(@RequestParam("count") Integer currentCount,
			@RequestParam("quizId") Integer quizId, HttpServletRequest request,
			Model model) {
		
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.findUserByLogin(username);
		if (user == null) {
			return "redirect:/";
		}
		if (scoreService.checkIfUserHasPlayedQuiz(user, quizId)) {
			return "duplicateAttempt";
		}
		// get the quiz and store it in the session
		Quiz quizToPlay = quizService.getQuiz(quizId);
		request.getSession().setAttribute("quizBeingAnswered", quizToPlay);
		Set<Question> questions = quizToPlay.getQuestions();
		List<Question> questionsToAnswer = new ArrayList<Question>(questions);
//		for (Iterator<Questions> it = questions.iterator(); it.hasNext();) {
//			Question currentQuestion = it.next();
//			questionsToAttempt.add(currentQuestion);
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
		return "/user/question";

	}
	
	
	
	
	
	
	@RequestMapping(value = "/quiz/postAnswer", method = RequestMethod.POST)
	public String postQuestion(@ModelAttribute("question") Question question,
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
			return "/user/question";

		} else {
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
				model.addAttribute("highestScore", scoreService.findHighestScore(quizToAttempt.getScores()));
				return "/user/scoreForAttemptedQuiz";
			} else 
				return "defaultError";
			}
			// return score card view
			//return "/user/scoreForAttemptedQuiz";

	}
	
	
	
	
	
	
	
	
	
	
	
	

	@RequestMapping(value = "/selectUser/{way}", method = RequestMethod.GET)
	public String selectUser(@PathVariable("way")  String way, Map<String, Object> parameters) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		
		if (auth != null) {
			String username = auth.getName();
			User user = userService.findUserByLogin(username);
			if(way.equals("friends")){
				//parameters.put("users", user.getFriends());
				
			}
			else{
				parameters.put("users", userService.findAllUsers());
			}
		}
		parameters.put("User", new User());  
		
        return "/user/selectUser";
		
	}
	
	
	
	
	
	@RequestMapping(value="/select", method = RequestMethod.GET)  
    private String optionsTag(Map<String, Object> map) {  
          
        Map< String, String > phones = new HashMap<String, String>();  
        phones.put("samsung", "SAMSUNG");  
        phones.put("nokia", "NOKIA");  
        phones.put("iphone", "IPHONE");  
        phones.put("bberry", "BLACKBERRY");  
        phones.put("htc", "HTC");  
          
		map.put("phoneList", userService.getAllUsernames());
		map.put("user", new User());
		
		return "/user/selectUser";
    }  
	
	
	@RequestMapping(value="/question", method = RequestMethod.GET)  
    private String quiz(Map<String, Object> map) {  
       
		
		return "/test/question";
    }  
	        
	

	 @RequestMapping(value = "/game/{category}", method = RequestMethod.GET)
	    public String game(@PathVariable("category")  String category, Map<String, Object> parameters) {
//		 public String game(@RequestParam(value = "category", required = false) String category, Map<String, Object> parameters) {
	     
		 List<Question> list = questionService.randQuestion4Game(category);
		 
		 parameters.put("questions", list);
	        return "/user/game";
	    }
	
}

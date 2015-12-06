package com.project.inz.controller;

import java.beans.PropertyEditorSupport;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.session.SessionRegistry;
import org.hibernate.id.uuid.CustomVersionOneStrategy;
import org.hibernate.type.CustomType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.CustomEditorConfigurer;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.convert.ConversionService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.inz.configuration.RoleToUserRoleConverter;
import com.project.inz.model.Category;
import com.project.inz.model.Question;
import com.project.inz.model.Quiz;
import com.project.inz.model.User;
import com.project.inz.model.UserRole;
import com.project.inz.service.CategoryService;
import com.project.inz.service.QuestionService;
import com.project.inz.service.QuizService;
import com.project.inz.service.RoleService;
import com.project.inz.service.UserService;

import antlr.debug.GuessingEvent;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
//@SessionAttributes("roleList")
public class AdminController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	

	@Autowired
	QuestionService questionService;

	
	@Autowired
	QuizService quizService;
	
	
	@Autowired
	RoleToUserRoleConverter converter;
	
	@Autowired
	@Qualifier("sessionRegistry")
	private SessionRegistry sessionRegistry;

	
	@InitBinder
    protected void initBinder(ServletRequestDataBinder binder) throws Exception {

        binder.registerCustomEditor(Set.class, "roles",new CustomCollectionEditor(Set.class){

            @Override
            protected Object convertElement(Object element) {
                
                if (element != null) {
                    Integer id = Integer.valueOf(element.toString());
                    UserRole role = roleService.getRole(id);
                    return role;
                }
                return null;
            } 
        });
        
        binder.registerCustomEditor(Category.class, "category", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
            	Integer id = Integer.parseInt(text);
        		Category cat= categoryService.findById(id);
                setValue(cat);
            }
        });
        binder.registerCustomEditor(Quiz.class, "quiz", new PropertyEditorSupport() {
        	@Override
        	public void setAsText(String text) {
        		Integer id = Integer.parseInt(text);
        		Quiz quiz= quizService.findById(id);
        		setValue(quiz);
        	}
        });
    }
	
	

		@RequestMapping("/home")
		public String editCategories(Map<String, Object> map){
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			if (auth != null) {
				String login = auth.getName();
				map.put("username", login);
				map.put("userRole", auth.getAuthorities());
			}
			map.put("categoryList", categoryService.findAllCategories());
			
			return "/admin/admin_home";
		}
		
		
		
		
		
///////////////////////	users//////////////////////////////////////////////
		@RequestMapping(value ="/users")
		public String userList(Map<String, Object> map, Principal principal) {

			map.put("users", userService.findAllUsers());
			
			if(principal != null){
				String name = principal.getName(); //get logged in username
				map.put("username", name);
				
			}
			
			return "/user/editUsers";
		}
		
		
		
		
		@RequestMapping(value ="/addUser", method = RequestMethod.GET)
		public String addUser(Map<String, Object> map) {

			map.put("user", new User());
			map.put("roleList", roleService.listRoles());
			map.put("edit",false);
			
			return "/user/userForm";
		}
		
		
		@RequestMapping(value = "/addUser", method = RequestMethod.POST)
		public String saveUser(@Valid User user, BindingResult result, Map<String, Object> map) {
			if (result.hasErrors()) {
				
				map.put("user", user);
				//map.put("roleList", roleService.listRoles());
				
				return "/user/userForm";
			 
			} else {
			 
			    // form input is ok
				
			userService.saveUser(user);
			
			return "redirect:/admin/users";
			}
		}
		
		

		/**
		 * This method will provide the medium to update an existing user.
		 */
		@RequestMapping(value = { "/edit-user-{id}" }, method = RequestMethod.GET)
		public String editUser(@PathVariable Integer id, ModelMap model) {
			
			
			
			User user = userService.findById(id);
			model.addAttribute("user", user);
			model.addAttribute("roleList", roleService.listRoles());
			model.addAttribute("edit", true);
			return "/user/userForm";
		}
		
		/**
		 * This method will be called on form submission, handling POST request for
		 * updating user in database. It also validates the user input
		 */
		@RequestMapping(value = { "/edit-user-{userId}" }, method = RequestMethod.POST)
		public String updateUser(@Valid User user, BindingResult result,
				ModelMap model, @PathVariable String userId) {

			if (result.hasErrors()) {
				return "/user/userForm";
			}

			userService.updateUser(user);

			model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
			return "redirect:/admin/users";
		}

		
		
		
		
		@RequestMapping("/deleteUser/{userId}")
		public String deleteUser(@PathVariable("userId") int id) {

			userService.deleteUser(id);

			return "redirect:/admin/users";
		}
		
		// Get logged in users in json format for display using angularjs
		@RequestMapping(value="/activeUsers", method=RequestMethod.GET,produces={"application/xml", "application/json"})
	    @ResponseStatus(HttpStatus.OK)
		public @ResponseBody List<Object> getPrincipals() {		
			
			List<Object> principals = sessionRegistry.getAllPrincipals();		
			
			return principals;		
		}
///////////////////////	categories//////////////////////////////////////////////
		
		
		@RequestMapping(value ="/categories")
		public String categoriesList(Map<String, Object> map) {

			//map.put("categories", categoryService.findAllCategories());
			
			
//			return "/admin/UserManagement";
			return "/admin/categories";
		}
		
		@RequestMapping(value ="/addCategory", method = RequestMethod.GET)
		public String addCategory(Map<String, Object> map) {

			map.put("category", new Category());
			map.put("edit",false);
			
			return "/admin/categoryForm";
		}
		
		@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
		public String saveCategory(@Valid Category category, BindingResult result, Map<String, Object> map) {
			if (result.hasErrors()) {
				
				map.put("category", category);
				//map.put("roleList", roleService.listRoles());
				
				return "/admin/categoryForm";
			 
			} else {
			 
			    // form input is ok
				
			categoryService.saveCategory(category);
			
			return "redirect:/admin/categories";
			}
		}
		
		@RequestMapping("/deleteCategory/{id}")
		public String deleteCategory(@PathVariable("id") int id) {

			categoryService.deleteCategory(id);

			return "redirect:/admin/categories";
		}
		
		
		@RequestMapping(value = { "/edit-category-{id}" }, method = RequestMethod.GET)
		public String editCategory(@PathVariable Integer id, ModelMap model) {
			Category category = categoryService.findById(id);
			model.addAttribute("category", category);
			model.addAttribute("edit", true);
			return "/admin/categoryForm";
		}
		
		
		@RequestMapping(value = { "/edit-category-{id}" }, method = RequestMethod.POST)
		public String updateQuestion(@Valid Category category, BindingResult result,
				ModelMap model, @PathVariable String id) {

			if (result.hasErrors()) {
				return "/admin/categoryForm";
			}

			categoryService.updateCategory(category);

			model.addAttribute("success", "Category " + category.getName() +  " updated successfully");
			return "redirect:/admin/categories";
		}
		
		
		
		
		
		
		
		
		
		
		///////////////////////	questions//////////////////////////////////////////////
		
		@RequestMapping(value ="/questions")
		public String questionsList(Map<String, Object> map) {

			map.put("questions", questionService.findAllQuestions());
			
			
			return "/admin/questions";
		}
		
		@RequestMapping(value ="/addQuestion", method = RequestMethod.GET)
		public String addQusetion(Map<String, Object> map) {

			map.put("question", new Question());
			map.put("category", new Category());
			map.put("categoryList", categoryService.findAllCategories());
			map.put("edit",false);
			
			return "/admin/questionForm";
		}
		
		
		@RequestMapping(value = "/addQuestion", method = RequestMethod.POST)
		public String saveQuestion(@Valid Question question, BindingResult result, Map<String, Object> map) {
			if (result.hasErrors()) {
				
				map.put("question", question);
				//map.put("roleList", roleService.listRoles());
				
				return "/admin/questionForm";
			 
			} else {
			 
			    // form input is ok
				
			questionService.saveQuestion(question);
			
			return "redirect:/admin/questions";
			}
		}
		
		
		@RequestMapping("/deleteQuestion/{questionId}")
		public String deleteQuestion(@PathVariable("questionId") int id) {

			questionService.deleteQuestion(id);

			return "redirect:/admin/questions";
		}
		
		
		@RequestMapping(value = { "/edit-question-{id}" }, method = RequestMethod.GET)
		public String editQuestion(@PathVariable Integer id, ModelMap model) {
			
			
			
			Question question = questionService.findById(id);
			model.addAttribute("question", question);
			model.addAttribute("categoryList", categoryService.findAllCategories());
			model.addAttribute("quizzesList", quizService.getAllQuizzes());
			model.addAttribute("edit", true);
			return "/admin/questionForm";
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
		
			

	}

package com.project.inz.controller;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.converter.ContentTypeResolver;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.web.bind.annotation.RestController;

import com.project.inz.model.BookEntity;
import com.project.inz.model.Category;
import com.project.inz.model.Question;
import com.project.inz.model.Quiz;
import com.project.inz.model.User;
import com.project.inz.service.CategoryService;
import com.project.inz.service.QuestionService;
import com.project.inz.service.QuizService;
import com.project.inz.service.UserService;

 
@RestController
@RequestMapping("/rest")
public class MainRestController {
 
    @Autowired
    UserService userService;  //Service which will do all data retrieval/manipulation work
    
    @Autowired
    CategoryService categoryService;
    

    @Autowired
    QuizService quizService;

	@Autowired
	QuestionService questionService;
 
    
    //-------------------Retrieve All Users--------------------------------------------------------
     
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public ResponseEntity<List<User>> listAllUsers() {
        List<User> users = userService.findAllUsers();
        if(users.isEmpty()){
            return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<User>>(users, HttpStatus.OK);
    }
 
 
    
 
    
    //-------------------Retrieve Single User--------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUser(@PathVariable("id") Integer id) {
        System.out.println("Fetching User with id " + id);
        User user = userService.findById(id);
        if (user == null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }
 
     
     
    //-------------------Create a User--------------------------------------------------------
     
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody User user,    UriComponentsBuilder ucBuilder) {
        System.out.println("Creating User " + user.getUsername());
 
        if (userService.isUserExist(user)) {
            System.out.println("A User with name " + user.getUsername() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
 
        userService.saveUser(user);
 
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(user.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
 
    
     
    //------------------- Update a User --------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
    public ResponseEntity<User> updateUser(@PathVariable("id") Integer id, @RequestBody User user) {
        System.out.println("Updating User " + id);
         
        User currentUser = userService.findById(id);
         
        if (currentUser==null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
 
        currentUser.setUsername(user.getUsername());	
        currentUser.setFirstName(user.getFirstName());
        currentUser.setLastName(user.getLastName());
        currentUser.setPassword(user.getPassword());
        currentUser.setEnabled(user.isEnabled());
        currentUser.setEmail(user.getEmail());
        userService.updateUser(currentUser);
        return new ResponseEntity<User>(currentUser, HttpStatus.OK);
    }
 
    
    
    //------------------- Delete a User --------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteUser(@PathVariable("id") Integer id) {
        System.out.println("Fetching & Deleting User with id " + id);
 
        User user = userService.findById(id);
        if (user == null) {
            System.out.println("Unable to delete. User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
 
        userService.deleteUser(id);
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }
 
     
    
    //------------------- Delete All Users --------------------------------------------------------
     
//    @RequestMapping(value = "/user/", method = RequestMethod.DELETE)
//    public ResponseEntity<User> deleteAllUsers() {
//        System.out.println("Deleting All Users");
// 
//        userService.deleteAllUsers();
//        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
//    }
 

////////////////////////CATEGORIES///////////////////////////////////////////

@RequestMapping(value = "/category", method = RequestMethod.GET)
public List<Category> getAllCategories() {
	return categoryService.findAllCategories();
}


@RequestMapping(value = "/category", method = RequestMethod.POST)
public void saveCategory(@RequestBody Category category) {
	System.out.println("wchodzi tutaj!!!!!!!!!!!!!!!!!!!!!!!!!");
	categoryService.saveCategory(category);
}


//-------------------Retrieve Single Category--------------------------------------------------------

	@RequestMapping(value = "/category/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Category> getCategory(@PathVariable("id") Integer id) {
		System.out.println("Fetching Category with id " + id);
		Category category = categoryService.findById(id);
		if (category == null) {
			System.out.println("Category with id " + id + " not found");
			return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Category>(category, HttpStatus.OK);
	}

//------------------- Update Category--------------------------------------------------------

@RequestMapping(value = "/category/{id}", method = RequestMethod.PUT)
public ResponseEntity<Category> updateCategory(@PathVariable("id") Integer id, @RequestBody Category category) {
	System.out.println("Updating Category " + id);
	
	Category curCategory = categoryService.findById(id);
	if (curCategory == null) {
		System.out.println("Category with id " + id + " not found");
		return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);
	}

	//currentUser.setName(user.getName());
	//currentUser.setAge(user.getAge());
	//currentUser.setSalary(user.getSalary());
	
	categoryService.updateCategory(category);
	return new ResponseEntity<Category>(curCategory, HttpStatus.OK);
}

//------------------- Delete Category --------------------------------------------------------

@RequestMapping(value = "/category/{id}", method = RequestMethod.DELETE)
public ResponseEntity<Category> deleteCategory(@PathVariable("id") Integer id) {
	System.out.println("Fetching & Deleting Category with id " + id);

	Category category = categoryService.findById(id);
	if (category == null) {
		System.out.println("Unable to delete. Category with id " + id + " not found");
		return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);
	}

	categoryService.deleteCategory(id);
	return new ResponseEntity<Category>(HttpStatus.NO_CONTENT);
}


///////////////////////QUESTIONS////////////////////////
//-------------------Retrieve All Questions--------------------------------------------------------

@RequestMapping(value = "/question", method = RequestMethod.GET)
public ResponseEntity<List<Question>> listAllQuestions() {
    List<Question> questions = questionService.findAllQuestions();
    if(questions.isEmpty()){
        return new ResponseEntity<List<Question>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    }
    return new ResponseEntity<List<Question>>(questions, HttpStatus.OK);
}



//-------------------Retrieve Single Category--------------------------------------------------------

	@RequestMapping(value = "/question/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Question> getQuestion(@PathVariable("id") Integer id) {
		System.out.println("Fetching Question with id " + id);
		Question question = questionService.findById(id);
		if (question == null) {
			System.out.println("Question with id " + id + " not found");
			return new ResponseEntity<Question>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Question>(question, HttpStatus.OK);
	}
	
	
	

    //-------------------Create a Question--------------------------------------------------------
    
    @RequestMapping(value = "/question", method = RequestMethod.POST)
    public ResponseEntity<Void> createQuestion(@RequestBody Question question,    UriComponentsBuilder ucBuilder) {
//        System.out.println("Creating Question " + question.getId());
//        Question q = questionService.findById(question.getId());
//        if (!(q==null)) {
//            System.out.println("A Question " + question.getId() + " already exist");
//            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
//        }
 
        questionService.saveQuestion(question);
 
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/question/{id}").buildAndExpand(question.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

//------------------- Update Question--------------------------------------------------------

@RequestMapping(value = "/question/{id}", method = RequestMethod.PUT)
public ResponseEntity<Question> updateQuestion(@PathVariable("id") Integer id, @RequestBody Question question) {
	System.out.println("Updating Question " + id);
	
	Question curQuestion = questionService.findById(id);
	if (curQuestion == null) {
		System.out.println("Question with id " + id + " not found");
		return new ResponseEntity<Question>(HttpStatus.NOT_FOUND);
	}

	//currentUser.setName(user.getName());
	//currentUser.setAge(user.getAge());
	//currentUser.setSalary(user.getSalary());
	
	questionService.updateQuestion(question);
	return new ResponseEntity<Question>(curQuestion, HttpStatus.OK);
}



//------------------- Delete Question --------------------------------------------------------

@RequestMapping(value = "/question/{id}", method = RequestMethod.DELETE)
public ResponseEntity<Question> deleteQuestion(@PathVariable("id") Integer id) {
	System.out.println("Fetching & Deleting Question with id " + id);

	Question question = questionService.findById(id);
	if (question == null) {
		System.out.println("Unable to delete. Question with id " + id + " not found");
		return new ResponseEntity<Question>(HttpStatus.NOT_FOUND);
	}

	questionService.deleteQuestion(id);
	return new ResponseEntity<Question>(HttpStatus.NO_CONTENT);
}



////////////////////////Quizzes///////////////////////////////////////////

@RequestMapping(value = "/quiz", method = RequestMethod.GET)
public ResponseEntity<List<Quiz>> getAllQuizzes() {
	List<Quiz> quizzes = quizService.getAllQuizzes();
    if(quizzes.isEmpty()){
        return new ResponseEntity<List<Quiz>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    }
    return new ResponseEntity<List<Quiz>>(quizzes, HttpStatus.OK);
}

//-------------------Save Quiz--------------------------------------------------------
@RequestMapping(value = "/quiz", method = RequestMethod.POST)
public void saveCategory(@RequestBody Quiz quiz) {
	quizService.saveQuiz(quiz);
}


//-------------------Retrieve Single Quiz--------------------------------------------------------

@RequestMapping(value = "/quiz/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
public ResponseEntity<Quiz> getQuiz(@PathVariable("id") Integer id) {
System.out.println("Fetching Quiz with id " + id);
Quiz quiz = quizService.findById(id);
if (quiz == null) {
System.out.println("Quiz with id " + id + " not found");
return new ResponseEntity<Quiz>(HttpStatus.NOT_FOUND);
}
return new ResponseEntity<Quiz>(quiz, HttpStatus.OK);
}

//------------------- Update Quiz--------------------------------------------------------

@RequestMapping(value = "/quiz/{id}", method = RequestMethod.PUT)
public ResponseEntity<Quiz> updateQuiz(@PathVariable("id") Integer id, @RequestBody Quiz quiz) {
System.out.println("Updating quiz " + id);

Quiz cquiz = quizService.findById(id);
if (cquiz == null) {
System.out.println("Quiz with id " + id + " not found");
return new ResponseEntity<Quiz>(HttpStatus.NOT_FOUND);
}

//currentUser.setName(user.getName());
//currentUser.setAge(user.getAge());
//currentUser.setSalary(user.getSalary());

quizService.updateQuiz(quiz);
return new ResponseEntity<Quiz>(quiz, HttpStatus.OK);
}

//------------------- Delete Quiz --------------------------------------------------------

@RequestMapping(value = "/quiz/{id}", method = RequestMethod.DELETE)
public ResponseEntity<Quiz> deleteQuiz(@PathVariable("id") Integer id) {
System.out.println("Fetching & Deleting Quiz with id " + id);

Quiz quiz = quizService.findById(id);
if (quiz == null) {
System.out.println("Unable to delete. Quiz with id " + id + " not found");
return new ResponseEntity<Quiz>(HttpStatus.NOT_FOUND);
}

categoryService.deleteCategory(id);
return new ResponseEntity<Quiz>(HttpStatus.NO_CONTENT);
}

}
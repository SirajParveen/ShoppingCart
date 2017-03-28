package com.niit.fairdeal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.niit.fairdeal.dao.UserDAO;
import com.niit.fairdeal.domain.User;

@Controller
public class UserController {
	
	public static Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserDAO userDAO;
	
	/**
	 * if invalid credentials -> Home page , login , error message
	 *  if valid credentials && he is admin -> AdminHome page ,logout link if valid
	 * credentials && he is end user -> Home page, myCart, logout link
	 * 
	 * @param userID
	 * @param password
	 * @return it will return data and page name where to return
	 */
	/*@RequestMapping(value = "/validate", method = RequestMethod.POST)//used when security is not used
	public ModelAndView validate(@RequestParam(value = "username") String userID,
			@RequestParam(value = "password") String password) 
	{
		log.debug("Starting of the method validate");
		
		ModelAndView modelAndView = new ModelAndView("/Home");
		
		user = userDAO.validateUser(userID, password); 
		//you no need to do this step 
		//if you are using spring security
		// if the record exist with this userID and password it will return user
		// details else will return null

		if (user != null) {
			
			log.debug("Valid Credentials");
			
			session.setAttribute("loggedInUser", user.getName());
			session.setAttribute("loggedInUserID", user.getID());

			session.setAttribute("user", user); 
			session.setAttribute("supplier", supplier);
			session.setAttribute("supplierList", supplierDAO.getAllSuppliers());
			
			session.setAttribute("productList", productDAO.getAllProducts());
			session.setAttribute("product", product);

			session.setAttribute("category", category);
			session.setAttribute("categoryList", categoryDAO.getAllCategories());

			if (user.getRole().equals("Admin")) {
				
				log.debug("Logged in as Admin");
				modelAndView.addObject("isAdmin", "true");
				

			} 
			else 
			{
				log.debug("Logged in as User");
				modelAndView.addObject("isAdmin", "false");
				
				//Cart = cartDAO.list(userID);
				modelAndView.addObject("cart", cart);
				
				// Fetch the Cart list based on user ID
				List<Cart> cartList = cartDAO.getAllCarts(userID);
				modelAndView.addObject("cartList", cartList);
				modelAndView.addObject("cartSize", cartList.size());
			}

		}
		else 
		{
			log.debug("Invalid Credentials");
			modelAndView.addObject("invalidCredentials", "true");
			modelAndView.addObject("errorMessage", "Invalid Credentials");
		}
		log.debug("Ending of the method validate");
		return modelAndView;
	}
*/

	@RequestMapping(value = "/Registration", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute User user, Model model) 

	{
		user.setEnabled(true);
		user.setRole("ROLE_USER");
		userDAO.createUser(user);
		model.addAttribute("SuccessRegister", "Successfully Registered. Thank You !!!");
		
		return "Home";
	}
}

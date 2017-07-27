package com.hirain.web.ssm.controller;

//@CommonsLog(topic = "userController")
//@Controller
//@RequestMapping(value = "/person")
public class PersonController {

	// @Autowired
	// private UserService userService;
	//
	// @RequestMapping(value = "/getUser", method = RequestMethod.GET)
	// public @ResponseBody List<Person> getUsers() {
	// final List<Person> users = userService.selectAll();
	// log.info("getUser");
	// return users;
	// }
	//
	// @RequestMapping(value = "/create", method = RequestMethod.POST)
	// public @ResponseBody Map<String, String> createUser(Person user) {
	// final Map<String, String> map = new HashMap<>();
	// if (user.getId() == null) {
	// userService.createUser(user);
	// log.info("createUser");
	// map.put("operate", "create");
	// } else {
	// userService.updateUser(user);
	// log.info("updateUser");
	// map.put("operate", "update");
	// }
	// map.put("operateTarget", user.getName());
	// return map;
	// }
	//
	// @RequestMapping(value = "/delete", method = { RequestMethod.POST, RequestMethod.GET })
	// @Transactional
	// public @ResponseBody Map<String, String> deleteUser(int id, HttpServletRequest request) {
	// final Map<String, String> map = new HashMap<>();
	// userService.deleteUser(id);
	// log.info("deleteUser");
	// map.put("result", "success");
	// return map;
	// }

}

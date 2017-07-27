

test("test", function () {
	$.ajax({
		url: 'http://localhost:8080/ssh/test',
		async: false,
		success: function (data, s, x) {
			equal("test",data,"test data")
		}
	});
});

/*

test("getPersons", function () {
	stop();
	getPersons(function (response) {
		// persons = $.evalJSON(response.d);
		persons = response;
		equal(persons[0].name, "Mary");
		start();
	});
});

function getPersons(callback) {
	var persons = null;
	$.ajax({
		url: 'http://localhost:8080/ssm-demo/user/getUser',
		dataType: 'json',
		success: function (data) {
			callback(data);
		}
	});
}

test("length", function () {
	stop();
	getPersons(function (response) {
		// persons = $.evalJSON(response.d);
		persons = response;
		ok(persons.length>10, "length>10");
		start();
	});
});

test("synchronous test", function () {
	$.ajax({
		url: 'http://localhost:8080/ssm-demo/user/getUser',
		async: false,
		success: function (d, s, x) {
			ok(true, "Called synchronously");
		ok(d.length>10, "length>10");
		}
	});
});

module("comment");
asyncTest("comment1", function () {
	expect(4);
	$.ajax({
		url: 'http://localhost:8080/ssm-demo/user/getUser',
		dataType: "json",
		type: "GET",
		timeout: 1000
	}).done(function (data) {
		ok(true, "loaded");
		ok(data.length > 1, "array size");
		ok(data.length>20, "attr total");
		var c = data[0];
		ok(c.name, "Mary");
	}).fail(function (x, text, thrown) {
		ok(false, "ajax failed: " + text);
	}).always(function () {
		start();
	});
});


asyncTest("comment3", function () {
	expect(2);
	var params = [{name:"id",value:""},{name:"name",value:"xxx"},{name:"address",value:"xxx"},{name:"email",value:"xxx"}];
	$.ajax({
		url: 'http://localhost:8080/ssm-demo/user/create',
		type: "post",
		data:params,
		timeout: 1000
	}).done(function (data) {
		// alert(JSON.stringify(data))
		ok(true, "loaded");
		ok(data.operate, "create");
	}).fail(function (x, text, thrown) {
		ok(false, "ajax failed: " + text);
	}).always(function () {
		start();
	});
});


asyncTest("comment2", function () {
	expect(1);
	var postdata = "xxx";
	$.ajax({
		url: 'http://localhost:8080/ssm-demo/user/delete',
		type: "post",
		data:postdata,
		timeout: 1000
	}).done(function (data) {
		alert(JSON.stringify(data))
		ok(true, "loaded");
		ok(data.length > 1, "array size");
		ok(data.length<20, "attr total");
		var c = data[0];
		ok(c.name, "Mary");
	}).fail(function (x, text, thrown) {
		ok(false, "ajax failed: " + text);
	}).always(function () {
		start();
	});
});







*/


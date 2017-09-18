package com.hirain.ssmongo.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.hirain.ssmongo.dao.UserDao;
import com.hirain.ssmongo.entity.User;

@Service
public class UserDaoImpl implements UserDao {

	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public List<User> findAll() {
		return mongoTemplate.find(new Query(), User.class);
	}

	@Override
	public List<User> findList(int skip, int limit) {
		final Query query = new Query();
		query.with(new Sort(new Order(Direction.ASC, "_id")));
		query.skip(skip).limit(limit);
		return mongoTemplate.find(query, User.class);
	}

	@Override
	public void store(User user) {
		mongoTemplate.save(user);
	}

	@Override
	public User findOne(String id) {
		final Query query = new Query();
		final Criteria criteria = Criteria.where("_id").is(id);
		query.addCriteria(criteria);
		return mongoTemplate.findOne(query, User.class);
	}

	@Override
	public User findOneByUsername(String username) {
		final Query query = new Query();
		final Criteria criteria = Criteria.where("username").is(username);
		query.addCriteria(criteria);
		return mongoTemplate.findOne(query, User.class);
	}

	@Override
	public void updateFirst(User user) {
		final Update update = new Update();
		final Query query = new Query();
		update.set("username", user.getUsername());
		update.set("password", user.getPassword());
		mongoTemplate.updateFirst(query.addCriteria(Criteria.where("_id").is(user.getId())), update,
				User.class);
	}

	@Override
	public void delete(String... ids) {
		if (ids == null || ids.length == 0) {
			return;
		}
		for (final String id : ids) {
			final Query query = new Query(Criteria.where("_id").is(id));
			mongoTemplate.remove(query, User.class);
		}
	}

}

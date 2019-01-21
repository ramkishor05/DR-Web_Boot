package com.work.drdo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.work.drdo.dao.AbstractDao;
import com.work.drdo.executive.entity.Thought;

@Repository("thoughtDAO")
public class ThoughtDaoImpl extends AbstractDao<Integer, Thought>  implements com.work.drdo.dao.ThoughtDao {

	@Override
	public Thought delete(Integer id) {
		Thought thought=getByKey(id);
		delete(thought);
		return thought;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Thought> getAll() {
		Criteria crit = createEntityCriteria();
		List<Thought> thoughts = (List<Thought>) crit.list();
		return thoughts;
	}

	@Override
	public List<Thought> getAll(Integer... ids) {
		List<Thought> list=new ArrayList<>();
		for(Integer id:ids){
			list.add(getByKey(id));
		}
		return list;
	}

	@Override
	public Integer save(Thought thought) {
		return (Integer) getSession().save(thought);
	}

	@Override
	public Thought get(Integer id) {
		return (Thought) getByKey(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Thought getLastModifiedThought() {
		org.hibernate.Query query=getSession().getNamedQuery("Thought.today");
		List<Thought> list=query.list();
		if(!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}

}

package com.work.drdo.service.diary.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.drdo.dao.ThoughtDao;
import com.work.drdo.executive.entity.Thought;
import com.work.drdo.service.diary.ThoughtService;


@Service(value="thoughtService")
public class ThoughtServiceImpl implements ThoughtService {

	@Autowired
	private ThoughtDao thoughtDAO;
	
	@Override
	public String saveThought(Thought thought) {
		try {
			return String.valueOf(thoughtDAO.save(thought));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
	@Override
	public void updateThought(Thought thought) {
		try {
			 thoughtDAO.update(thought);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public void deleteThoughtById(Integer id) {
		try {
			 thoughtDAO.delete(id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}


	@Override
	public Thought find(Integer id) {
		try {
			return thoughtDAO.get(id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public Thought findById(Integer id) {
		return find(id);
	}

	@Override
	public List<Thought> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String count() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Thought getCurrentThought() {
		return thoughtDAO.getLastModifiedThought();
	}

	
}

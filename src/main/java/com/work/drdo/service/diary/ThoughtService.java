package com.work.drdo.service.diary;

import java.util.List;

import com.work.drdo.executive.entity.Thought;

public interface ThoughtService {

	public String saveThought(Thought thought);

	public Thought find(Integer id);

	public Thought findById(Integer id);

	public List<Thought> findAll();

	public String count();

	public void updateThought(Thought thought);

	public void deleteThoughtById(Integer id);

	public Thought getCurrentThought();

}

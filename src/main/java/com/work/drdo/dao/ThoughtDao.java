package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Thought;

public interface ThoughtDao {

	public Integer save(Thought thought);

	public Thought delete(Integer thought);

	public List<Thought> getAll();

	public List<Thought> getAll(Integer... ids);

	public Thought get(Integer id);

	public void update(Thought thought);

	public Thought getLastModifiedThought();
}

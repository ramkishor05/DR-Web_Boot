package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Recipent;

public interface RecipentDAO {
	public String save(Recipent recipent);

	public Recipent findById(Integer recipentId);

	public List<Recipent> findByDiaryId(Integer diaryId);

	public void deleteRecipientById(Recipent entity);
}

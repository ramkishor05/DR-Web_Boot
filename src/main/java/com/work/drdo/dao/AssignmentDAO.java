package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Assignment;

public interface AssignmentDAO {
	public void assignDiary(Assignment entity);

	public void merge(Assignment entity);

	public List<Assignment> getAssignmentByProfileId(Integer profileId);

	public Assignment getAssignmentById(Integer assignmentId);

	public Assignment getAssignmentByDiaryIdAndStatus(Integer diaryId);

	public List<Assignment> getApprovedDiaryAssignment(Integer assignFrom);
}

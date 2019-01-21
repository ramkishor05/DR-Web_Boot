package com.work.drdo.helper;

import com.work.drdo.domain.questionnaire.AssignmentVO;
import com.work.drdo.executive.entity.Assignment;

public class AssignmentMapper {
	
	public static AssignmentVO mapFromDB(Assignment assign){
		AssignmentVO assignmentVO = new AssignmentVO();
		assignmentVO.setAssignmentId(assign.getAssignmentId().toString());
		assignmentVO.setAssignedFrom(assign.getAssignFrom().getProfileId().toString());
		assignmentVO.setAssignTo(null!=assign.getAssignTo() ? assign.getAssignTo().getProfileId().toString() :"");
		assignmentVO.setAssignmentId(assign.getAssignmentId().toString());
		assignmentVO.setDiaryId(assign.getDiaryId().getDiaryId().toString());
		assignmentVO.setDiaryNo(assign.getDiaryId().getDiaryNo());
		assignmentVO.setFileNumber(assign.getDiaryId().getFileNumber().getFileNumber());
		assignmentVO.setFileSubject(assign.getDiaryId().getFileNumber().getFileName());
		assignmentVO.setSenderName(assign.getDiaryId().getCreatedBy().getFirstName()+" "+assign.getDiaryId().getCreatedBy().getLastName());
		assignmentVO.setApproverComment(assign.getApproverComment());
		assignmentVO.setApproverStatus(assign.getApprovalStatus());
		assignmentVO.setDiaryType(assign.getDiaryId().getDiaryType());
		assignmentVO.setClosureComment(assign.getDiaryId().getClouserComment());
		return assignmentVO;
	}

	public static Assignment mapToDB(AssignmentVO assignmentVO){
		Assignment assign = new Assignment();
		/*assign.setAssignFrom(assignmentVO.getAssignedFrom());
		assign.setAssignTo(assignTo);
		assign.setDiaryId(diaryId);
		assign.setTimestamp(date);*/
		return assign;
	}
}

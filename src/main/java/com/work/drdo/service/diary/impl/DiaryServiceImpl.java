package com.work.drdo.service.diary.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.drdo.dao.AssignmentDAO;
import com.work.drdo.dao.DiaryDAO;
import com.work.drdo.dao.LoginInfoDAO;
import com.work.drdo.dao.RecipentDAO;
import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.questionnaire.AssignmentVO;
import com.work.drdo.domain.questionnaire.DiaryVO;
import com.work.drdo.domain.questionnaire.RecipientVO;
import com.work.drdo.executive.entity.Assignment;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.Recipent;
import com.work.drdo.executive.entity.UserDiary;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.helper.AssignmentMapper;
import com.work.drdo.helper.DiaryMapper;
import com.work.drdo.helper.RecipentMapper;
import com.work.drdo.service.diary.DiaryService;
import com.work.drdo.service.notification.EmailNotificationService;
import com.work.drdo.utils.Constants;
import com.work.drdo.utils.SecurityUtils;

@Service(value = "diaryService")
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private UserProfileDAO profileDao;
	
	@Autowired
	private LoginInfoDAO loginDAO ;
	
	@Autowired
	private DiaryDAO diaryDAO;
	
	@Autowired
	private RecipentDAO recipentDAO;
	
	@Autowired
	private AssignmentDAO assignmentDAO;
	
	@Autowired
	private EmailNotificationService emailNotifier;

	@Override
	public String saveDiary(DiaryVO diaryVO) {
		try {
			UserDiary diary = DiaryMapper.mapToDB(diaryVO);
			diary.setDiaryStatus(SecurityUtils.getLoggedInUser().getRole().getUserRoleName());
			if (null != diaryVO.getDiaryId()) {
				diaryDAO.merge(diary);
				return String.valueOf(diary.getDiaryId());
			} else {
				return diaryDAO.saveDiary(diary);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "0";
	}

	@Override
	public void updateDiary(DiaryVO diaryVO) {
	}

	@Override
	public DiaryVO getDiaryById(Integer diaryId) {
		try {
			UserDiary diary = diaryDAO.getReference(diaryId);
			DiaryVO diaryVO = null;
			if (null != diary) {
				diaryVO = getDairyVO(diary);
			}
			return diaryVO;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public UserDiary getDiaryEntityById(Integer diaryId) {
		try {
			return diaryDAO.getReference(diaryId);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public String saveRecipient(RecipientVO recipientVO) {
		String recipientId = null;
		try {
			UserDiary diary = diaryDAO.getReference(Integer.parseInt(recipientVO.getDiaryId()));
			Recipent recipent = RecipentMapper.mapToDB(recipientVO, diary);
			if (null != recipent) {
				recipientId = recipentDAO.save(recipent);
				return recipientId;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public RecipientVO getRecipientById(Integer recipientId) {
		Recipent recipient = recipentDAO.findById(recipientId);
		RecipientVO recipentVO = null;
		if (null != recipient.getRecipentId()) {
			recipentVO = RecipentMapper.mapFromDB(recipient);
		}
		return recipentVO;
	}

	@Override
	public List<RecipientVO> getRecipientByDiaryId(String diaryId) {
		List<Recipent> recipientList = recipentDAO.findByDiaryId(Integer.parseInt(diaryId));
		List<RecipientVO> recipent = new ArrayList<>();
		if (null != recipientList) {
			for (Recipent recipentData : recipientList) {
				RecipientVO recipentVO = RecipentMapper.mapFromDB(recipentData);
				recipent.add(recipentVO);
			}
		}

		return recipent;
	}
	
	public void createAssignmentForGroupHead(String diaryId) {
		UserDiary diary = diaryDAO.getReference(Integer.parseInt(diaryId));
		Assignment assignment = new Assignment();
		Date date = new Date();
		diary.setDiaryStatus(SecurityUtils.getRole().getUserRoleName());
		assignment.setDiary(diary);
		assignment.setAssignFrom(SecurityUtils.getUserProfile());
		assignment.setTimestamp(date);
		assignment.setColumnActive("Y");
		UserProfile assignTo=profileDao.findUserProfileByGroupId(SecurityUtils.getUserProfile().getFormation().getGroup().getGroupId(),SecurityUtils.getRole().getUserRoleId() - 1);
		assignment.setAssignTo(assignTo);
		assignment.setApprovalStatus("");
		assignmentDAO.assignDiary(assignment);
	}

	@Override
	public void assignDiary(String diaryId, AssignmentVO assignmentVO) {
		if (5 != SecurityUtils.getRole().getUserRoleId()) {
			Assignment ass = assignmentDAO.getAssignmentById(Integer.parseInt(assignmentVO.getAssignmentId()));
			ass.setColumnActive("N");
			assignmentDAO.merge(ass);
		}
		Assignment assignment = new Assignment();
		Date date = new Date();
		UserDiary diary = diaryDAO.getReference(Integer.parseInt(diaryId));
		assignment.setDiary(diary);
		assignment.setAssignFrom(SecurityUtils.getUserProfile());
		assignment.setTimestamp(date);
		assignment.setColumnActive("Y");
		if (null != assignmentVO) {
			assignment.setApproverComment(assignmentVO.getApproverComment());
			assignment.setApprovalStatus(assignmentVO.getApproverStatus());
			if (assignmentVO.getApproverStatus().equalsIgnoreCase("Y")) {
				if (SecurityUtils.getRole().getUserRoleId() > 1) {
					List<UserProfile> userList = profileDao.findUserProfileByRoleId(SecurityUtils.getRole().getUserRoleId() - 1);
					UserProfile assign=getAssignTo(assignment, userList);
					LoginInfo assignInfo=loginDAO.getUserByProfileId(assign);
					assignment.setAssignTo(assign);
					diary.setDiaryStatus(assignInfo.getRole().getUserRoleName());
				} else if (SecurityUtils.getRole().getUserRoleId() == 1) {
					assignment.setAssignTo(SecurityUtils.getUserProfile());
					diary.setDiaryStatus(SecurityUtils.getRole().getUserRoleName());
					List<String> approvalChk = assignmentVO.getApprovalChk();
					emailNotifier.sendDiaryConfirmation(diary, approvalChk);
				}
			} else {
				emailNotifier.sendDiaryDisapprovalEmail(diary, assignment.getApproverComment());
			}
		} else {
			if (SecurityUtils.getRole().getUserRoleId() > 1) {
				List<UserProfile> userList = profileDao.findUserProfileByRoleId(SecurityUtils.getRole().getUserRoleId() - 1);
				UserProfile assign=getAssignTo(assignment, userList);
				LoginInfo assignInfo=loginDAO.getUserByProfileId(assign);
				diary.setDiaryStatus(assignInfo.getRole().getUserRoleName());
				assignment.setAssignTo(assign);
				assignment.setApprovalStatus("");
			} else {
				assignment.setAssignTo(SecurityUtils.getUserProfile());
				diary.setDiaryStatus(SecurityUtils.getRole().getUserRoleName());
				assignment.setApprovalStatus("Y");
			}
		}
		assignmentDAO.assignDiary(assignment);
		diaryDAO.merge(diary);
	}

	private UserProfile getAssignTo(Assignment assignment, List<UserProfile> userList) {
		for (UserProfile user : userList) {
			switch (SecurityUtils.getRole().getUserRoleId()) {
			case 5:
				if (user.getFormation().getGroup().getGroupId() == SecurityUtils.getUserProfile().getFormation()
						.getGroup().getGroupId()) {
					return user;
				}
				break;
			case 4:
				if (user.getFormation().getDivision().getDivisionId() == SecurityUtils.getUserProfile().getFormation()
						.getDivision().getDivisionId()
						&& user.getFormation().getDepartment().getDeptId() == SecurityUtils.getUserProfile().getFormation()
								.getDepartment().getDeptId()
						&& user.getFormation().getGroup().getGroupId() == null) {
					return user;
				}
				break;
			case 3:
				if (user.getFormation().getDivision().getDivisionId() == SecurityUtils.getUserProfile().getFormation()
						.getDivision().getDivisionId() && user.getFormation().getDepartment().getDeptId() == null
						&& user.getFormation().getGroup().getGroupId() == null) {
					return user;
				}
			case 2:
				if (user.getProfileId() == 1) {
					return user;
				}
				break;
			default:
			}
		}
		return null;
	}

	@Override
	public List<AssignmentVO> getDiaryAssignment(Integer profileId) {
		try {
			List<Assignment> assignment = assignmentDAO.getAssignmentByProfileId(profileId);
			List<AssignmentVO> assignVO = new ArrayList<>();
			if (null != assignment) {
				for (Assignment assign : assignment) {
					AssignmentVO assignmentVO = AssignmentMapper.mapFromDB(assign);
					assignVO.add(assignmentVO);
				}
			}

			return assignVO;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public DiaryVO getDairyVO(UserDiary diary) {
		DiaryVO diaryVO = DiaryMapper.mapFromDB(diary);
		Assignment assignment = assignmentDAO.getAssignmentByDiaryIdAndStatus(diary.getDiaryId());
		if (null != assignment) {
			diaryVO.setApproverComment(assignment.getApproverComment());
			diaryVO.setApproverStatus(assignment.getApprovalStatus());
		}
		return diaryVO;
	}

	@Override
	public List<DiaryVO> getDiaryListByProfileId(Integer profileId) {
		try {
			List<UserDiary> userDiary = diaryDAO.getDiaryListByProfileId(profileId);
			List<DiaryVO> diaryVOs = new ArrayList<>();
			if (null != userDiary) {
				for (UserDiary diary : userDiary) {
					diaryVOs.add(getDairyVO(diary));
				}
			}
			return diaryVOs;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public void deleteRecipientById(Integer recipientId) {
		Recipent entity = recipentDAO.findById(recipientId);
		recipentDAO.deleteRecipientById(entity);
	}

	@Override
	public AssignmentVO getAssignmentById(Integer assignmentId) {
		Assignment ass = assignmentDAO.getAssignmentById(assignmentId);
		AssignmentVO assignmentVO = AssignmentMapper.mapFromDB(ass);
		return assignmentVO;
	}

	@Override
	public List<AssignmentVO> getApprovedDiaryAssignment(Integer assignFrom) {
		try {
			List<Assignment> assignment = assignmentDAO.getApprovedDiaryAssignment(assignFrom);
			List<AssignmentVO> assignVO = new ArrayList<>();
			if (null != assignment) {
				for (Assignment assign : assignment) {
					AssignmentVO assignmentVO = AssignmentMapper.mapFromDB(assign);
					assignVO.add(assignmentVO);
				}
			}
			return assignVO;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public List<AssignmentVO> getClosedDiaryAssignment(Integer assignFrom) {
		try {
			List<Assignment> assignment = assignmentDAO.getApprovedDiaryAssignment(assignFrom);
			List<AssignmentVO> assignVO = new ArrayList<>();
			if (null != assignment) {
				for (Assignment assign : assignment) {
					UserDiary diary = diaryDAO.getReference(assign.getDiary().getDiaryId());
					if (diary.getStatus().equalsIgnoreCase(Constants.CLOSED_DIARY)) {
						AssignmentVO assignmentVO = AssignmentMapper.mapFromDB(assign);
						assignVO.add(assignmentVO);
					}
				}
			}
			return assignVO;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public void closeDiary(DiaryVO diaryVO) {
		try {
			UserDiary diary = diaryDAO.getReference(Integer.parseInt(diaryVO.getDiaryId()));
			diary.setClouserComment(diaryVO.getClosureComment());
			diary.setDiaryStatus(SecurityUtils.getRole().getUserRoleName());
			diary.setStatus(Constants.CLOSED_DIARY);
			diaryDAO.merge(diary);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}

package com.work.drdo.helper;

import com.work.drdo.domain.questionnaire.RecipientVO;
import com.work.drdo.executive.entity.Recipent;
import com.work.drdo.executive.entity.UserDiary;

public class RecipentMapper {
	
	public static Recipent mapToDB(RecipientVO recipientVO, UserDiary diary){
		Recipent recipent = new Recipent();
		recipent.setAddressId(recipientVO.getRecipientAddress());
		recipent.setDesignation(recipientVO.getDesignation());
		recipent.setExt(recipientVO.getExt());
		recipent.setName(recipientVO.getName());
		recipent.setOfficeNumber(recipientVO.getOfficeNumber());
		recipent.setRecipentFor(diary);
		recipent.setEmail(recipientVO.getRecipientEmail());
		return recipent;
	}
	
	public static RecipientVO mapFromDB(Recipent recipient){
		RecipientVO recipentVO = new RecipientVO();
		recipentVO.setRecipientAddress(null!=recipient.getAddressId() ? recipient.getAddressId() : null);
		recipentVO.setDesignation(recipient.getDesignation());
		recipentVO.setExt(recipient.getExt());
		recipentVO.setName(recipient.getName());
		recipentVO.setRecipentId(recipient.getRecipentId().toString());
		recipentVO.setOfficeNumber(recipient.getOfficeNumber());
		recipentVO.setDiaryId(((String.valueOf(recipient.getRecipentFor().getDiaryId()))));
		recipentVO.setRecipientEmail(recipient.getEmail());
		return recipentVO;
	}
}

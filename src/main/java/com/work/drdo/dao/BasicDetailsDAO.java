package com.work.drdo.dao;

import com.work.drdo.executive.entity.BasicDetail;

public interface BasicDetailsDAO {
	public BasicDetail getReference(Integer basicDetailId);

	public void merge(BasicDetail entity);

	public String saveProfile(BasicDetail basicDetail);

	public BasicDetail registerBasicDetail(BasicDetail basicDetail);

	public BasicDetail updateBasicDetail(BasicDetail basicDetail);
}

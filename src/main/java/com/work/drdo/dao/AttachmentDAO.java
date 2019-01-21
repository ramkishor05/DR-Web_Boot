package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Attachment;

public interface AttachmentDAO {
	public String saveAttachments(Attachment attachmentDetail);

	List<Attachment> findAll();

	Attachment findById(int id);

	public void update(Attachment attachmentDetail);

	void deleteById(int id);

	public List<Attachment> findAttachmentByFileId(Integer fileId);
}

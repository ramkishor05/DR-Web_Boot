package com.work.drdo.service.attachmentdetail.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AttachmentDAO;
import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.executive.entity.Attachment;
import com.work.drdo.service.attachmentdetail.AttachmentDetailService;
import com.work.drdo.utils.Utility;

@Service("attachmentDetailService")
@Transactional
public class AttachmentDetailServiceImpl implements AttachmentDetailService {

	@Autowired
	AttachmentDAO attachmentDAO;
	@Autowired
	UserProfileDAO profileDao;
	
	@Value("${attachment.path}")
	private String attachmentPath;

	public Attachment findById(int id) {
		return attachmentDAO.findById(id);
	}

	public List<Attachment> findAll() {
		return attachmentDAO.findAll();
	}
	
	public void saveDocument(Attachment document) {
		attachmentDAO.saveAttachments(document);
	}

	public void deleteById(int id) {
		Attachment attachment = attachmentDAO.findById(id);
		Utility.deleteFileFromLocation(attachmentPath,attachment);
		attachmentDAO.deleteById(id);
	}

	@Override
	public List<Attachment> findAttachmentByFileId(Integer fileId) {
		return attachmentDAO.findAttachmentByFileId(fileId);
	}

	
}

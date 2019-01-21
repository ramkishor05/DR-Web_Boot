package com.work.drdo.service.attachmentdetail;

import java.util.List;

import com.work.drdo.executive.entity.Attachment;

public interface AttachmentDetailService {
    public Attachment findById(int id);
    public List<Attachment> findAll();
    public void saveDocument(Attachment document);
    public void deleteById(int id);
    public List<Attachment> findAttachmentByFileId(Integer fileId);
}

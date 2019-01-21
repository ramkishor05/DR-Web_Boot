package com.work.drdo.service.db;

import java.lang.reflect.Field;

import org.brijframework.jpa.model.EntityData;
import org.brijframework.jpa.model.EntityModel;
import org.brijframework.jpa.processor.EntityProcessor;
import org.brijframework.support.enums.Access;
import org.brijframework.util.accessor.PropertyAccessorUtil;
import org.brijframework.util.formatter.PrintUtil;
import org.brijframework.util.reflect.FieldUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EntityProcessorImpl implements EntityProcessor{

	@Autowired
	private SessionFactory sessionFactory;
	private Session session;

	@Override
	public boolean constains(EntityData entityData,EntityModel entityModel, Object object) {
		if(entityData.getUnique()!=null && !entityData.getUnique().isEmpty()) {
			Criteria criteria= session.createCriteria(object.getClass());
			for(String key:entityData.getUnique().split(",")) {
				criteria.add(Restrictions.eq(key, PropertyAccessorUtil.getProperty(object, key,Access.PRIVATE)));
			}
			return !criteria.list().isEmpty();
		}
		return false;
	}
	
	@Override
	public boolean init() {
		session=sessionFactory.openSession();
		return true;
	}
	
	@Override
	public boolean process(EntityData entityData,EntityModel entityModel, Object entity) {
		System.out.println("EntityModel :"+PrintUtil.getObjectInfo(entity));
		Transaction transaction =session.getTransaction();
		transaction.begin();
		Object persist=session.merge(entity);
		if(persist!=null) {
			mergeObject(persist, entity);
		}
		transaction.commit();
		return false;
	}
	
	private void mergeObject(Object persist,Object entity) {
		for(Field field:FieldUtil.getAllField(persist.getClass(),Access.PRIVATE_NO_STATIC_FINAL)){
			if(field.toString().contains("final") || field.toString().contains("static")) {
				continue;
			}
			PropertyAccessorUtil.setProperty(entity,field, PropertyAccessorUtil.getProperty(persist, field,Access.PRIVATE));
		}
	}
	
	@Override
	public boolean finish() {
		if(session!=null)
			session.close();
		return false;
	}

}

package com.work.drdo.service.db;

import java.lang.reflect.Field;

import org.brijframework.jpa.model.EntityData;
import org.brijframework.jpa.model.EntityModel;
import org.brijframework.jpa.processor.EntityProcessor;
import org.brijframework.support.enums.Access;
import org.brijframework.util.accessor.PropertyAccessorUtil;
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
	public boolean constains(EntityData entityData,EntityModel entityModel, Object entity) {
		if(entityData.getUnique()!=null && !entityData.getUnique().isEmpty()) {
			Criteria criteria= session.createCriteria(entity.getClass());
			for(String key:entityData.getUnique().split(",")) {
				criteria.add(Restrictions.eq(key, PropertyAccessorUtil.getProperty(entity, key,Access.PRIVATE)));
			}
			return false;
		}
		return false;
	}
	
	@Override
	public boolean init() {
		session=sessionFactory.openSession();
		return true;
	}
	
	@Override
	public boolean persist(EntityData entityData,EntityModel entityModel, Object entity) {
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

	@Override
	public boolean update(EntityData entityData, EntityModel entityModel, Object entity) {
		Transaction transaction =session.getTransaction();
		transaction.begin();
		Object persist=session.merge(entity);
		if(persist!=null) {
			mergeObject(persist, entity);
		}
		transaction.commit();
		return false;
	}

	@Override
	public boolean delete(EntityData entityData, EntityModel entityModel, Object object) {
		// TODO Auto-generated method stub
		return false;
	}

}

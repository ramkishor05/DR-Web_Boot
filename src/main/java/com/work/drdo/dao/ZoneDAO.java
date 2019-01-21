package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Zone;

public interface ZoneDAO {

	public Zone getZone(Integer id);

	public String saveZone(Zone zone);

	public List<Zone> findAll();

	public void merge(Zone entity);

	public Zone getReference(int id);

	public void remove(Zone entity);

	public Zone find(Integer id);

	public List<Zone> find(Boolean flag, Integer max, Integer first);

	public String count();

	public List<Zone> findZoneByDeptId(Integer deptId);
}

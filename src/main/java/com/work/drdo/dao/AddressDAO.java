package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.Address;

public interface AddressDAO {
	public String saveAddress(Address address);

	public void merge(Address entity);

	public Address getReference(int id);

	public void remove(Address entity);

	public Address find(Integer id);

	public List<Address> find(Boolean flag, Integer max, Integer first);

	public String count();

	public Address registerAddress(Address address);

	public Address updateAddress(Address address);

}

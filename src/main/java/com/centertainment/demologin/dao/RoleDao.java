package com.centertainment.demologin.dao;

import com.centertainment.demologin.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);
	
}

package com.hirain.web.ssm.service;

import java.util.List;

public interface PermissionService {

	public List<String> findPermissionNamesByRole(Long id);
}

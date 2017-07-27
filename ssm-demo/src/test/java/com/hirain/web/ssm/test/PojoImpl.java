/**
 * 
 */
package com.hirain.web.ssm.test;

import org.springframework.stereotype.Service;

/**
 * @author hao.zheng
 *
 */
@Service("pojo")
public class PojoImpl implements Pojo {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.hirain.web.test.Pojo#get()
	 */
	@Override
	public int get() {
		return 1;
	}

}

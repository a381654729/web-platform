/**
 * 
 */
package com.hirain.web.ssm.test;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

/**
 * @author hao.zheng
 *
 */
@RunWith(Suite.class)
@SuiteClasses({ TestSpringConfig.class, TestSpringConfig2.class, TestSpringConfigController.class,
		TestSpringConfigMapper.class, TestSpringConfigService.class, TestSpringControl.class, TestSpringControl2.class,
		TestSpringDepend.class })

public class AllTests {

}

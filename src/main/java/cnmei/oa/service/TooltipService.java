package cnmei.oa.service;

import java.util.List;

import cnmei.oa.bean.TooltipVo;

public interface TooltipService {
	
	Integer SearchRegularE();

	List<TooltipVo> FindUnreadM(String page);

}

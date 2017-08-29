package cnmei.oa.service;

import java.util.List;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.bean.TooltipVo;
import cnmei.oa.pojo.Tooltip;

public interface TooltipService {
	
	Integer SearchRegularE();

	List<Tooltip> FindUnreadM(String page);
	
	List<TooltipVo> findToolTipVo(List<Tooltip> toolList);

	ResultBean updateFinStatus(Integer id, boolean b);

}

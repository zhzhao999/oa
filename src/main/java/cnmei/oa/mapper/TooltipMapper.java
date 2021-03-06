package cnmei.oa.mapper;

import java.util.List;

import cnmei.oa.pojo.Tooltip;

public interface TooltipMapper {
	Integer SearchRegularE();

	void insertEmployee(Tooltip tooltip);

	List<Tooltip> FindUnreadM();

	List<Tooltip> FindAllTool();

	void updateStatus(Integer id);

	void updateFinStatus(Tooltip tooltip);

	void deleteTipByEID(String id);
}

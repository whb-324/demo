package ts.daoImpl;

import ts.daoBase.BaseDao;
import ts.model.CustomerInfo;
import ts.model.UserInfo;


public class UserInfoDao extends BaseDao<UserInfo, Integer> {
	public UserInfoDao(){
		super(UserInfo.class);
	}
	public String getPwd(int uid) {
		UserInfo ui = super.get(uid);
		return ui.getPWD();                      //根据用户名获取用户密码
	}
	public Integer URull(int uid) {
		UserInfo ui = super.get(uid);
		return ui.getURull();                      //根据用户名获取用户密码
	}
}

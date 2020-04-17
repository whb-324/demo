package ts.daoImpl;

import ts.daoBase.BaseDao;
import ts.model.ClientInfo;

public class ClientDao extends BaseDao<ClientInfo, Integer>{

	public ClientDao() {
		super(ClientInfo.class);
	}
	
	
}

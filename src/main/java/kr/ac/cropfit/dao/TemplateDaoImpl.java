package kr.ac.cropfit.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TemplateDaoImpl implements TemplateDao {

	@Autowired
	SqlSession sql;
	
}

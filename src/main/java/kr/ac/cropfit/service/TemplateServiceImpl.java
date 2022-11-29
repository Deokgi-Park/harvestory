package kr.ac.cropfit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.cropfit.dao.TemplateDao;

@Service
public class TemplateServiceImpl implements TemplateService {

	@Autowired
	TemplateDao TDao;
	
}

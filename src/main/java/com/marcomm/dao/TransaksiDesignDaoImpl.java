package com.marcomm.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.marcomm.model.TransaksiDesign;
import com.marcomm.service.FungsiService;

 


@Repository
public class TransaksiDesignDaoImpl implements TransaksiDesignDao {
	
	@Autowired
	SessionFactory sessionFactory;

	public void save(TransaksiDesign tDesign) {
		Session session=sessionFactory.getCurrentSession();
		session.save(tDesign);
	}

	public TransaksiDesign getById(int id) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(TransaksiDesign.class, id);
	}
	
	public List<TransaksiDesign> getAll() {
		Session session=sessionFactory.getCurrentSession();
		Criteria cr = session.createCriteria(TransaksiDesign.class);
		@SuppressWarnings("unchecked")
		List<TransaksiDesign> transaksiDesign = cr.add(Restrictions.eq("isDelete", false)).list();
		return transaksiDesign;
	}

	public String getCodeById() {
		String hql = "from TransaksiDesign ORDER BY id DESC";
		SimpleDateFormat format = new SimpleDateFormat("ddMMyy");
		String currentDate = format.format(new Date());
		String kodeDepan ="TRWODS";
		Session session = sessionFactory.getCurrentSession();
		TransaksiDesign transaksiDesign = (TransaksiDesign) session.createQuery(hql).setMaxResults(1).uniqueResult();
		if(transaksiDesign==null) {
			String angka = "00001";
			String fullCode = kodeDepan+currentDate+angka;
			return fullCode;
		}else {
			String angka = transaksiDesign.getCode().substring(12);
			int increment = Integer.valueOf(angka)+1;
			String fullCode = kodeDepan+currentDate+String.format("%05d", increment);
		return fullCode;
		}
	}
	public int getId() {
		String hql = "from TransaksiDesign ORDER BY id DESC";
		Session session = sessionFactory.getCurrentSession();
		TransaksiDesign transaksiDesign = (TransaksiDesign) session.createQuery(hql).setMaxResults(1).uniqueResult();
		return transaksiDesign.getId();
	}
	public String getRequestBy() {
		String user = FungsiService.getUserLog();
		return user;
	}

}
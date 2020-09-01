package com.ch.cinephile.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.cinephile.model.Cfavorite;

@Repository
public class CfavoriteDaoImpl implements CfavoriteDao{
	@Autowired
	SqlSessionTemplate sst;
	public int selectZipnum(String id) {
		return sst.selectOne("selectZipnum", id);
	}
	@Override
	public Cfavorite ckChoice(int mv_num, int zip_num) {
		Cfavorite cf=new Cfavorite();
		cf.setMv_num(mv_num);
		cf.setZip_num(zip_num);
		return sst.selectOne("cfavoritens.ckChoice",cf);
	}
	@Override
	public int insert(int mv_num, int zip_num) {
		Cfavorite cf=new Cfavorite();
		cf.setMv_num(mv_num);
		cf.setZip_num(zip_num);
		//System.out.println(cf.getMv_num()+" "+cf.getZip_num());
		return sst.insert("cfavoritens.insert",cf);
	}
	public List<Integer> getCustomer(int zipnum) {
		return sst.selectList("cfavoritens.getCustomer", zipnum);
	}
	@Override
	public void delete(int mv_num, int zipnum) {
		Cfavorite cf=new Cfavorite();
		cf.setMv_num(mv_num);
		cf.setZip_num(zipnum);
		sst.delete("cfavoritens.delete", cf);
	}
	public List<Integer> selectZipnum(int zipnum) {
		return sst.selectList("cfavoritens.selectZipnum", zipnum);
	}
}

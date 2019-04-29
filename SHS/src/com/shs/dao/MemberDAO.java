package com.shs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shs.dto.MemberDTO;
import com.shs.mybatis.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	List<MemberDTO> list = null;
	int result = 0;
	
//	singleton패턴을 활용한 DAO객체 사용
//	:객체생성 1회만 동작하고 생성된 객체를 빌려쓰는 형태
//	:+외부에서는 객체생성이 불가능하게 잠금
	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	public int memInsert(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.insert("memInsert", mDto);
			if(result>0) {
				System.out.println("등록 성공");
			}else {
				System.out.println("등록 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}

	public List<MemberDTO> memSelect() {
		sqlSession = sqlSessionFactory.openSession();
		list = null;
		try {
			list = sqlSession.selectList("memSelect");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;	
	}
	public MemberDTO memInfo(String id) {
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = null;
		try {
			mDto = sqlSession.selectOne("memInfo",id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return mDto;
	}
	public int memUpdate(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.update("memUpdate", mDto);
			if(result>0) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
	public int memDelete(String sid) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.delete("memDelete", sid);
			if(result>0) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			sqlSession.close();
		}
		return result;
	}
	
}

package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;

public class CartDAO{
	private JDBCUtil jdbcUtil = null;
	
	public CartDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
		
	/**
	 * 장바구니 관리 테이블에 새로운 장바구니 생성.
	 */
	public int create(Cart cart) throws SQLException {
		String sql = "INSERT INTO Cart VALUES (?, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {cart.getCart_id(), cart.getName(), 
						cart.getPrice(), cart.getCnt(), cart.getMember_id()
						, cart.getProduct_id()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 에 insert문과 매개 변수 설정
						
		try {				
			int result = jdbcUtil.executeUpdate();	// insert 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;			
	}

	/**
	 * 기존의 장바구니 정보를 수정.
	 */
	public int update(Cart cart) throws SQLException {
		String sql = "UPDATE Cart "
					+ "SET name=?, price=?, cnt=?, member_id=?, product_id=? "
					+ "WHERE cart_id=?";
		Object[] param = new Object[] {cart.getName(), cart.getPrice(), 
					cart.getCnt(), cart.getMember_id(), cart.getProduct_id(),
					cart.getCart_id()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil에 update문과 매개 변수 설정
			
		try {				
			int result = jdbcUtil.executeUpdate();	// update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}

	/**
	 * 장바구니 ID에 해당하는 장바구니를 삭제.
	 */
	public int remove(int cart_id) throws SQLException {
		String sql = "DELETE FROM Cart WHERE cart_id=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {cart_id});	// JDBCUtil에 delete문과 매개 변수 설정

		try {				
			int result = jdbcUtil.executeUpdate();	// delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}

	/**
	 * 주어진 장바구니 ID에 해당하는 정보를 데이터베이스에서 찾아 Cart 도메인 클래스에 
	 * 저장하여 반환.
	 */
	public Cart findCart(int cart_id) throws SQLException {
        String sql = "SELECT name, price, cnt, member_id, product_id"
        			+ "FROM Cart"
        			+ "WHERE cart_id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {cart_id});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 정보 발견
				Cart cart = new Cart(		// Cart 객체를 생성하여 정보를 저장
					rs.getString("name"),
					rs.getInt("price"),
					rs.getInt("cnt"),
					rs.getString("member_id"),
					rs.getInt("product_id"));					
				return cart;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}

	/**
	 * 전체 장바구니 정보를 검색하여 List에 저장 및 반환
	 */
	public List<Cart> findCartList() throws SQLException {
        String sql = "SELECT cart_id, name, price, cnt, member_id, product_id" 
        		   + "FROM Cart"
        		   + "ORDER BY cart_id";
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<Cart> cartList = new ArrayList<Cart>();	// Cart들의 리스트 생성
			while (rs.next()) {
				Cart cart = new Cart(			// Cart 객체를 생성하여 현재 행의 정보를 저장
					rs.getString("name"),
					rs.getInt("price"),
					rs.getInt("cnt"),
					rs.getString("member_id"),
					rs.getInt("product_id"));
				cartList.add(cart);				// List에 Cart 객체 저장
			}		
			return cartList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	

	/**
	 * 주어진 장바구니 ID에 해당하는 장바구니가 존재하는지 검사 
	 */
	public boolean existingCart(String cart_id) throws SQLException {
		String sql = "SELECT count(*) FROM Cart WHERE cart_id=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {cart_id});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return false;
	}

}
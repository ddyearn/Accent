package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;

import model.service.Order;


public class orderDao {
	private JDBCUtil jdbcUtil = null;
	
	public orderDao() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
		
	public int create(Order order) throws SQLException {
		String sql = "INSERT INTO PURCHASEIFO VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {order.getOrder_id(), order.getName(),
				order.getPostcode(), order.getAddr(), order.getTel(),
				order.getMemo(), order.getTotalPrice(), order.getStatus(),
				order.getDateClosed(), order.getDateCancelled(), order.getMemberId()
				};				
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


	public int remove(String userId) throws SQLException {
		String sql = "DELETE FROM PURCHASEINFO WHERE userid=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil에 delete문과 매개 변수 설정
		
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

	/*
	 * 주어진 주문 ID에 해당하는 주문 정보를 데이터베이스에서 찾아 Order 도메인 클래스에 
	 * 저장하여 반환.
	 */
	public Order findOrder(String order_id) throws SQLException {
		String sql = "SELECT name, postCode, memo, addr, tel, totalPrice, status, dateClosed, dateCancelled"
    				+ "WHERE order_id=? ";              
				jdbcUtil.setSqlAndParameters(sql, new Object[] {order_id});

		try {
				ResultSet rs = jdbcUtil.executeQuery();	
				if (rs.next()) {
					Order order = new Order();
					return order;
				}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}

	/*
	 * 전체 주문 정보를 검색하여 List에 저장 및 반환
	 */
	public List<Order> findOrderList() throws SQLException {
        String sql = "SELECT order_id, name, addr"
     		   			+ "ORDER BY order_id";
					jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil에 query문 설정
			
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<Order> orderList = new ArrayList<Order>();	// User들의 리스트 생성
			while (rs.next()) {
				Order order = new Order();
				orderList.add(order);				// List에 User 객체 저장
			}		
			return orderList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}

}

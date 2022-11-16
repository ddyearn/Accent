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
		jdbcUtil = new JDBCUtil();	// JDBCUtil ��ü ����
	}

	public int create(Order order) throws SQLException {
		String sql = "INSERT INTO PURCHASEIFO VALUES (?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] {
				order.getOrder_id(), order.product_id(),
				order.getAddr(), order.getTel(),
				order.getTotalPrice(),order.getMemberId()
		};
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil �� insert���� �Ű� ���� ����

		try {
			int result = jdbcUtil.executeUpdate();	// insert �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}
		return 0;
	}


	public int remove(String userId) throws SQLException {
		String sql = "DELETE FROM PURCHASEINFO WHERE userid=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil�� delete���� �Ű� ���� ����

		try {
			int result = jdbcUtil.executeUpdate();	// delete �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}
		return 0;
	}


	public Order findOrder(String order_id) throws SQLException {
		String sql = "SELECT product_id, addr, tel, totalPrice, member_id"
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
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}

	/*
	 * ��ü �ֹ� ������ �˻��Ͽ� List�� ���� �� ��ȯ
	 */
	public List<Order> findOrderList() throws SQLException {
		String sql = "SELECT order_id, name, addr"
				+ "ORDER BY order_id";
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil�� query�� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query ����
			List<Order> orderList = new ArrayList<Order>();	// User���� ����Ʈ ����
			while (rs.next()) {
				Order order = new Order();
				orderList.add(order);				// List�� User ��ü ����
			}
			return orderList;

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}

}

package accent;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.CallableStatement;
import java.util.List;
import java.util.ArrayList;

import accent.QnaAnswer;

public class QnaAnswerDAO {
	private JDBCUtil jdbcUtil = null;
	
	public QnaAnswerDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil °´Ã¼ »ý¼º
	}
	private static QnaAnswerDAO instance = new QnaAnswerDAO();

	public static QnaAnswerDAO getInstance() {
		return instance;
	}
	
	public int insertAnswer(QnaAnswer qnaA) {
			String sql = "INSERT INTO QNA_ANSWER VALUES (?,?,?,?.NOW())";
			Object[] param = new Object[] {qnaA.getAnswer_id(), qnaA.getQuestion_id(), qnaA.getTitle(), qnaA.getContent(), qnaA.getDate_created()};
		
			jdbcUtil.setSqlAndParameters(sql, param);
			
			try {				
				int result = jdbcUtil.executeUpdate();
				return result;
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {		
				jdbcUtil.commit();
				jdbcUtil.close();
			}		
			return 0;			
	}

	public int deleteAnswer(int answer_id) { 
		String sql = "DELETE FROM QNA_ANSWER WHERE answer_id=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {answer_id});	

		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;
}
	 
}

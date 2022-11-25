package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.util.DBManager;

import model.service.Order;

public class QNADao {
    private QNADao() {
    }
    private static QnaDAO instance = new QnaDAO();

    public static QnaDAO getInstance() {
        return instance;
    }

    public ArrayList<QnaVO> listQna(String qna_sequence) {
        ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
        // String sql = "select * from qna order by qna_sequence desc";
        String sql = "{call sp_listQna_select(?)}";

        Connection conn = null;
        // PreparedStatement pstmt = null;
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            conn = DBManager.getConnection();
            cstmt = conn.prepareCall(sql);
            cstmt.registerOutParameter(1, OracleTypes.CURSOR);
            rs = cstmt.executeQuery();
            rs = (ResultSet) cstmt.getObject(1);

            while (rs.next()) {
                QnaVO qnaVO = new QnaVO();
                qnaVO.setQna_sequence(rs.getInt("qna_sequence"));
                qnaVO.setQna_subject(rs.getString("qna_subject"));
                qnaVO.setQna_content(rs.getString("qna_content"));
                qnaVO.setQna_answer(rs.getString("qna_answer"));
                qnaVO.setQna_register(rs.getTimestamp("qna_register"));
                qnaVO.setQna_classification(rs.getString("qna_classification"));
                qnaVO.setMember_member_id(rs.getString("member_member_id"));
                qnaList.add(qnaVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return qnaList;
    }

    public QnaVO getQna(int qna_sequence) {
        QnaVO qnaVO = null;
        // String sql = "select * from qna where qna_sequence=?";
        String sql = "{call sp_getQna_select(?, ?)}";
        Connection conn = null;
        // PreparedStatement pstmt = null;
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            conn = DBManager.getConnection();
            cstmt = conn.prepareCall(sql);
            cstmt.setInt(1, qna_sequence);
            rs = cstmt.executeQuery();
            if (rs.next()) {
                qnaVO = new QnaVO();
                qnaVO.setQna_sequence(rs.getInt("qna_sequence"));
                qnaVO.setQna_subject(rs.getString("qna_subject"));
                qnaVO.setQna_content(rs.getString("qna_content"));
                qnaVO.setQna_answer(rs.getString("qna_answer"));
                qnaVO.setQna_register(rs.getTimestamp("qna_register"));
                qnaVO.setQna_classification(rs.getString("qna_classification"));
                qnaVO.setMember_member_id(rs.getString("member_member_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt);
        }
        return qnaVO;
    }

    public void insertqna(QnaVO qnaVO, String session_id) {
        String sql = "insert into qna values (qna_seq.nextval, ?, ?, 'no', sysdate, ?, ?)";
        // qna_answer -> default 'no'

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            System.out.println(qnaVO.getQna_subject() + "!!!" + qnaVO.getQna_content() + "!!!"
                    + qnaVO.getQna_classification() + "!!!" + session_id);
            pstmt.setString(1, qnaVO.getQna_subject());
            pstmt.setString(2, qnaVO.getQna_content());
            pstmt.setString(3, qnaVO.getQna_classification());
            pstmt.setString(4, session_id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }

    /*
     * * 관리자 모드에서 필요한 메소드
     */
    public ArrayList<QnaVO> listAllQna() {
        ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
        // 게시판의 데이터를 가지고 오는 쿼리 rep:1:게시물 2: 답변
        String sql = "select * from qna order by qna_register desc";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                QnaVO qnaVO = new QnaVO();
                qnaVO.setQna_sequence(rs.getInt("qna_sequence"));
                qnaVO.setQna_subject(rs.getString("qna_subject"));
                qnaVO.setQna_content(rs.getString("qna_content"));
                qnaVO.setQna_answer(rs.getString("qna_answer"));
                qnaVO.setQna_register(rs.getTimestamp("qna_register"));
                qnaVO.setQna_classification(rs.getString("qna_classification"));
                qnaVO.setMember_member_id(rs.getString("member_member_id"));
                qnaList.add(qnaVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return qnaList;
    }

    public void updateQna(QnaVO qnaVO) {
        String sql = "update qna set qna_answer=? where qna_sequence=?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, qnaVO.getQna_answer());
            pstmt.setInt(2, qnaVO.getQna_sequence());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }
    }

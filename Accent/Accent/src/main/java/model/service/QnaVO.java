package model.service;

import java.sql.Timestamp;

public class QnaVO {
    private int qna_sequence;
    private String qna_subject;
    private String qna_content;
    private String qna_answer;
    private String qna_classification;
    private String member_member_id;
    private Timestamp qna_register;

    public int getQna_sequence() {
        return qna_sequence;
    }

    public void setQna_sequence(int qna_sequence) {
        this.qna_sequence = qna_sequence;
    }

    public String getQna_subject() {
        return qna_subject;
    }

    public void setQna_subject(String qna_subject) {
        this.qna_subject = qna_subject;
    }

    public String getQna_content() {
        return qna_content;
    }

    public void setQna_content(String qna_content) {
        this.qna_content = qna_content;
    }

    public String getQna_answer() {
        return qna_answer;
    }

    public void setQna_answer(String qna_answer) {
        this.qna_answer = qna_answer;
    }

    public String getQna_classification() {
        return qna_classification;
    }

    public void setQna_classification(String qna_classification) {
        this.qna_classification = qna_classification;
    }

    public String getMember_member_id() {
        return member_member_id;
    }

    public void setMember_member_id(String member_member_id) {
        this.member_member_id = member_member_id;
    }

    public Timestamp getQna_register() {
        return qna_register;
    }

    public void setQna_register(Timestamp qna_register) {
        this.qna_register = qna_register;
    }

}
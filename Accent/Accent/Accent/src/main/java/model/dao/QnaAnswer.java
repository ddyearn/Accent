package accent;

public class QnaAnswer {
   int answer_id;
   int question_id;
   String title;
   String content;
   String date_created;
   
	
	public QnaAnswer() {
		super();
	}
	
	public QnaAnswer(int answer_id, int question_id, String title, String content, String date_created) {
		super();
		this.answer_id = answer_id;
		this.title = title;
		this.content = content;
		this.date_created = date_created;
	}
	
	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate_created() {
		return date_created;
	}
	public void setDate_created(String date_created) {
		this.date_created = date_created;
	}

}

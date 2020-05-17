package vo;

public class BoardVO {

   private int bno;
   private String title;
   private String writer;
   private String contents;
   private String regdate;
   private String ip;
   private int status;
   private int hits;
   
   // 기본 생성자
   public BoardVO() {
      // super();
   }

   // 생성자 오버로딩
   public BoardVO(int bno, String title, String writer, String contents, String regdate, String ip, int status, int hits) {
      super();
      this.bno = bno;
      this.title = title;
      this.writer = writer;
      this.contents = contents;
      this.regdate = regdate;
      this.ip = ip;
      this.status = status;
      this.hits = hits;
   }
   
   // get/set
   public int getBno() {
      return bno;
   }

   public void setBno(int bno) {
      this.bno = bno;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public String getContents() {
      return contents;
   }

   public void setContents(String contents) {
      this.contents = contents;
   }

   public String getRegdate() {
      return regdate;
   }

   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }

   public String getIp() {
      return ip;
   }

   public void setIp(String ip) {
      this.ip = ip;
   }

   public int getStatus() {
      return status;
   }

   public void setStatus(int status) {
      this.status = status;
   }

   public int getHits() {
      return hits;
   }

   public void setHits(int hits) {
      this.hits = hits;
   }
   
   // VO를 출력하기 위한 메소드 오버라이딩
   @Override
   public String toString() {
      return "BoardVO [" + "title=" + title + ", writer=" + writer + ", contents=" + contents
            +  ", ip=" + ip + ", status=" + status + ", hits=" + hits + "]";
   }
   
   
   
}
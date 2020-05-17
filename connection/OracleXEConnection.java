package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// DAO를 간단하게 하기 위한 싱글턴 패턴
public class OracleXEConnection {

   private static OracleXEConnection oc = null;
   private static Connection conn;

   final String DRIVER = "oracle.jdbc.driver.OracleDriver";
   final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
   final String USER = "scott";
   final String PASSWORD = "tiger";

   // 생성자 초기화
   private OracleXEConnection() {
   }

   // 메소드
   
   public static OracleXEConnection getInstance() {
      if (oc == null)
         oc = new OracleXEConnection();
      return oc;
   }   // if 종료

   public Connection getConnection() {
      if (conn == null) {

         try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("conn : " + conn);

         } catch (ClassNotFoundException e) {
            e.getStackTrace();
            System.out.println("드라이버 로딩 실패");

         } catch (SQLException e) {
            e.getStackTrace();
            System.out.println("DB 연결 실패");
         }
         
      }   // if 종료

      return conn;

   }

}
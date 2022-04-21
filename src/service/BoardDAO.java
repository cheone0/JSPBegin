package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.swing.text.html.parser.DTD;

import model.BoardDTO;

public class BoardDAO {
   
   private DataSource dataFactory;
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public BoardDAO() {
      try {
         Context ctx = new InitialContext();
         dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/jspProject");
         conn = dataFactory.getConnection();
      } catch (NamingException | SQLException e) {
         e.printStackTrace();
      }
   }
   
   public void dbClose() {
      if(rs != null) {
         try {
            rs.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      
      if(pstmt != null) {
         try {
            pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      
      if(conn != null) {
         try {
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   }
   
   
   public void boardInsert(String bTitle, String bContent, String bWriter) {
	   
	   String sql = "INSERT INTO boardTBL (bTitle, bContent, bWriter) VALUES(?, ?, ?)";
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bTitle);
		pstmt.setString(2, bContent);
		pstmt.setString(3, bWriter);
		pstmt.executeUpdate();
		
		System.out.println("boardInsert() 작동완료");
		dbClose();
	} catch (SQLException e) {
	
		e.printStackTrace();
	}
	   
   }
   
   // 게시판 리스트 
   public List<BoardDTO> boardList(){
	   List<BoardDTO> list = new ArrayList<BoardDTO>();
	   
	   String sql = "select * from boardTBL";
	   try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setbNo(rs.getInt("bNo"));
			dto.setbTitle(rs.getString("bTitle"));
			dto.setbContent(rs.getString("bContent"));
			dto.setbWriter(rs.getString("bWriter"));
			dto.setbRegDate(rs.getTimestamp("bRegDate"));
			
			list.add(dto);
			
		}
		
		System.out.println();
		dbClose();
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	   
	   
	   return list;
	   
	   
   }
   
   
   //게시판 글읽기
   public BoardDTO boardSelectOne(String bNo) {
	   BoardDTO dto = new BoardDTO();
	   
	   String sql = "select * from boardTBL where bNo = ?";
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(bNo));
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setbNo(rs.getInt("bNo"));
			dto.setbTitle(rs.getString("bTitle"));
			dto.setbContent(rs.getString("bContent"));
			dto.setbWriter(rs.getString("bWriter"));
			dto.setbRegDate(rs.getTimestamp("bRegDate"));
			return dto;
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	   
	   
	   return dto;
	  
   } 

   //게시판 삭제하기
   public BoardDTO boardDeleted(String bNo) {
	   BoardDTO dto = new BoardDTO();
	   
	   String sql = "DELETE FROM boardTBL WHERE bNo= ?";
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(bNo));
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setbNo(rs.getInt("bNo"));
			dto.setbTitle(rs.getString("bTitle"));
			dto.setbContent(rs.getString("bContent"));
			dto.setbWriter(rs.getString("bWriter"));
			dto.setbRegDate(rs.getTimestamp("bRegDate"));
			return dto;
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	   
	   
	   return dto;
	  
   } 
   
   //게시판 수정하기
   public void modiBoard(String bTitle, String bContent, String bNo){
	   
	   String sql = "UPDATE boardTBL SET bTitle = ?, bContent = ? WHERE bNo = ? ;";
	   	try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setInt(3, Integer.parseInt(bNo));
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	 
   
   

}
   
}

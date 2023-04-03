package com.onore.project.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class QnaDTO {

	private Integer qna_num;
	private Integer product_num;
	private String mem_id;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private String qna_category;
	private String qna_img_path; // �뙆�씪 寃쎈줈
	private String qna_img_1; // �뙆�씪 �씠由�
	private String qna_img_2;
	private String qna_img_3;
	private Integer qna_status;

	public String getmaskingName() {

		String firstName = mem_id.substring(0,1);
		String midName = mem_id.substring(1, mem_id.length() - 1);

		String masking = "";
		for(int i = 0; i < midName.length(); ++i) {
			masking += "*";
		}

		String lastName = mem_id.substring(mem_id.length() - 1, mem_id.length());

		String maskingName = firstName + masking + lastName;

		return maskingName;
	}
	
	private static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy.MM.dd");
	private static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

    public String getCreationQnaDate() {		
    	LocalDate creationDate = LocalDate.ofInstant(qna_date.toInstant(), ZoneId.systemDefault());
	    LocalDate today = LocalDate.ofInstant(new Date().toInstant(), ZoneId.systemDefault());
	    return creationDate.isEqual(today) ? 
		 	   timeFormat.format(qna_date) : dayFormat.format(qna_date);		
    }
    
    // 愿�由ъ옄
    private static SimpleDateFormat adminPageFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
    public String getAdminPageQnaDate() {
    	return adminPageFormat.format(qna_date);
    }

}
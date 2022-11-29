package kr.ac.cropfit.common;

import lombok.Data;

@Data
public class KakaoProfile {

	public Integer id;
	public String connected_at;
	public Properties properties;
	public KakaoAccount kakao_account;
	// 잡다한 정보 많은데 저는 이메일 하나만 필요합니다. 
	
	@Data
	public class Properties {
		public String nickname;
	}

	@Data
	public class KakaoAccount {

		public Boolean has_email;
		public Boolean email_needs_agreement;
		public Boolean is_email_valid;
		public Boolean is_email_verified;
		public String email;
		
		
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}

		
	}
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getConnected_at() {
		return connected_at;
	}

	public void setConnected_at(String connected_at) {
		this.connected_at = connected_at;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public KakaoAccount getKakao_account() {
		return kakao_account;
	}

	public void setKakao_account(KakaoAccount kakao_account) {
		this.kakao_account = kakao_account;
	}
	
	
	
	
	
}

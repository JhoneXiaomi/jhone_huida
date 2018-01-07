package com.rbw.www.util;

public class SystemConfig {
	
	/*tab1:系统安全选项配置*/
	private int account_case; //用户帐户区分大小写
	private String default_password;//用户默认密码
	private int default_password_validity_time;//默认密码有效期
	private int login_captcha;//登录随机验证码
	private int password_min_length;//用户密码长度控制
	private int new_password_repeat;//用户密码修改控制 新密码不能与当前密码相同
	private int new_password_uppercase;//用户密码复杂度控制 大写字符个数
	private int new_password_lowercase;//用户密码复杂度控制 小写字符个数
	private int new_password_number;//用户密码复杂度控制 数字个数
	private int new_password_email;//密码重置邮件通知
	private int session_timeout;//会话失效时间
	private int session_update_time;//用户在线状态更新间隔
	
	/*tab2:系统其他选项配置*/
	private String login_bg;//登录背景图片
	private String server_upload_file_path;//图片上传保存路径
	private String scinter_website_name;//三创网站名称
	private String scinter_logo_url;//三创后台logo
	private String scinter_login_bg;//三创后台logo登录背景图
	private String smtp_server;//邮件SMTP服务器
	private String email_address;//自动发送邮件的邮箱地址
	private String email_password;//邮箱密码
	private String database_password;//数据库密码
	private int database_back_datetime;//数据库备份时间间隔 单位：天
	
	
	public int getAccount_case() {
		return account_case;
	}
	public void setAccount_case(int account_case) {
		this.account_case = account_case;
	}
	public String getDefault_password() {
		return default_password;
	}
	public void setDefault_password(String default_password) {
		this.default_password = default_password;
	}
	public int getDefault_password_validity_time() {
		return default_password_validity_time;
	}
	public void setDefault_password_validity_time(int default_password_validity_time) {
		this.default_password_validity_time = default_password_validity_time;
	}
	public int getLogin_captcha() {
		return login_captcha;
	}
	public void setLogin_captcha(int login_captcha) {
		this.login_captcha = login_captcha;
	}
	public int getPassword_min_length() {
		return password_min_length;
	}
	public void setPassword_min_length(int password_min_length) {
		this.password_min_length = password_min_length;
	}
	public int getNew_password_repeat() {
		return new_password_repeat;
	}
	public void setNew_password_repeat(int new_password_repeat) {
		this.new_password_repeat = new_password_repeat;
	}
	public int getNew_password_uppercase() {
		return new_password_uppercase;
	}
	public void setNew_password_uppercase(int new_password_uppercase) {
		this.new_password_uppercase = new_password_uppercase;
	}
	public int getNew_password_lowercase() {
		return new_password_lowercase;
	}
	public void setNew_password_lowercase(int new_password_lowercase) {
		this.new_password_lowercase = new_password_lowercase;
	}
	public int getNew_password_number() {
		return new_password_number;
	}
	public void setNew_password_number(int new_password_number) {
		this.new_password_number = new_password_number;
	}
	public int getNew_password_email() {
		return new_password_email;
	}
	public void setNew_password_email(int new_password_email) {
		this.new_password_email = new_password_email;
	}
	public int getSession_timeout() {
		return session_timeout;
	}
	public void setSession_timeout(int session_timeout) {
		this.session_timeout = session_timeout;
	}
	public int getSession_update_time() {
		return session_update_time;
	}
	public void setSession_update_time(int session_update_time) {
		this.session_update_time = session_update_time;
	}
	public String getLogin_bg() {
		return login_bg;
	}
	public void setLogin_bg(String login_bg) {
		this.login_bg = login_bg;
	}
	public String getServer_upload_file_path() {
		return server_upload_file_path;
	}
	public void setServer_upload_file_path(String server_upload_file_path) {
		this.server_upload_file_path = server_upload_file_path;
	}
	public String getScinter_website_name() {
		return scinter_website_name;
	}
	public void setScinter_website_name(String scinter_website_name) {
		this.scinter_website_name = scinter_website_name;
	}
	public String getScinter_logo_url() {
		return scinter_logo_url;
	}
	public void setScinter_logo_url(String scinter_logo_url) {
		this.scinter_logo_url = scinter_logo_url;
	}
	public String getScinter_login_bg() {
		return scinter_login_bg;
	}
	public void setScinter_login_bg(String scinter_login_bg) {
		this.scinter_login_bg = scinter_login_bg;
	}
	public String getSmtp_server() {
		return smtp_server;
	}
	public void setSmtp_server(String smtp_server) {
		this.smtp_server = smtp_server;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	public String getEmail_password() {
		return email_password;
	}
	public void setEmail_password(String email_password) {
		this.email_password = email_password;
	}
	public String getDatabase_password() {
		return database_password;
	}
	public void setDatabase_password(String database_password) {
		this.database_password = database_password;
	}
	public int getDatabase_back_datetime() {
		return database_back_datetime;
	}
	public void setDatabase_back_datetime(int database_back_datetime) {
		this.database_back_datetime = database_back_datetime;
	}
}

package kr.or.ddit.member.vo;

public class checkMm {
private String mem_id     ;
private String mem_addr1  ;
private String mem_pass   ;
private String mem_nickname;
private String mem_gender ;
private String mem_birth  ;
private String mem_addr2  ;
private String mem_addr3  ;
private int mem_tel    ;
public String getMem_id() {
	return mem_id;
}
public void setMem_id(String mem_id) {
	this.mem_id = mem_id;
}
public String getMem_addr1() {
	return mem_addr1;
}
public void setMem_addr1(String mem_addr1) {
	this.mem_addr1 = mem_addr1;
}
public String getMem_pass() {
	return mem_pass;
}
public void setMem_pass(String mem_pass) {
	this.mem_pass = mem_pass;
}
public String getMem_nickname() {
	return mem_nickname;
}
public void setMem_nickname(String mem_nicknam) {
	this.mem_nickname = mem_nicknam;
}
public String getMem_gender() {
	return mem_gender;
}
public void setMem_gender(String mem_gender) {
	this.mem_gender = mem_gender;
}
@Override
public String toString() {
	return "checkMm [mem_id=" + mem_id + ", mem_addr1=" + mem_addr1 + ", mem_pass=" + mem_pass + ", mem_nicknam="
			+ mem_nickname + ", mem_gender=" + mem_gender + ", mem_birth=" + mem_birth + ", mem_addr2=" + mem_addr2
			+ ", mem_addr3=" + mem_addr3 + ", mem_tel=" + mem_tel + "]";
}
public String getMem_birth() {
	return mem_birth;
}
public void setMem_birth(String mem_birth) {
	this.mem_birth = mem_birth;
}
public String getMem_addr2() {
	return mem_addr2;
}
public void setMem_addr2(String mem_addr2) {
	this.mem_addr2 = mem_addr2;
}
public String getMem_addr3() {
	return mem_addr3;
}
public void setMem_addr3(String mem_addr3) {
	this.mem_addr3 = mem_addr3;
}
public int getMem_tel() {
	return mem_tel;
}
public void setMem_tel(int mem_tel) {
	this.mem_tel = mem_tel;
}
}                         

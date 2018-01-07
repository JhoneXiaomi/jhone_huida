package test;


/**
 * 
 * 重构，以函数对象取代函数
 * 
 * @author jhone
 *
 */
public class Gamma {

	private Account _account;
	private int imp_one;
	private int imp_two;
	private int imp_three;
	private int one;
	private int two;
	private int three;

	
	// 添加构造函数
	public Gamma(Account _account, int imp_one, int imp_two, int imp_three) {
		this._account = _account;
		this.imp_one = imp_one;
		this.imp_two = imp_two;
		this.imp_three = imp_three;
	}
	
	public int compute(){
		imp_one = (one+two) + _account.delta();
		imp_two = (one + three) + 100;
		
		if ((three - imp_one) > 100) {
			imp_two -=20;
		} 
		imp_three = imp_two + 7 ;
		return imp_three - 2 + imp_one;
	}

}

#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
/**
 * 
 */
package mx.com.its.sol.sist.fsw.orm.benchmark.services;

/**
 * @author lentiummmx
 *
 */
public interface UserService<T, ID> {

	T save(T user);
	
	T findById(ID userId);
	
}

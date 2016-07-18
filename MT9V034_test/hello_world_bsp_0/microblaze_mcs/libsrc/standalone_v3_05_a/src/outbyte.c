#include "xparameters.h"
#include "xiomodule_l.h"

#ifdef __cplusplus
extern "C" {
#endif
void outbyte(char c); 

#ifdef __cplusplus
}
#endif 

void outbyte(char c) {
	 XIOModule_SendByte(STDOUT_BASEADDRESS, c);
}

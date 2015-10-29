
/*
 * =====================================================================================
 *
 *       Filename:  util.c
 *
 *    Description:  Definition of general functions
 *
 *        Version:  1.0
 *        Created:  08/31/2015 08:40:20 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  David Nilosek
 *   Organization:  CaseWallet 
 *
 * =====================================================================================
 */

#ifndef util_h
#define util_h

#ifdef __cplusplus
extern "C" {
#endif

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  allocate_image_array
 *  Description:  Allocates data for a 2D image array
 *
 *	Params:
 *		int col: Number of Columns
 *		int row: Number of Rows
 * =====================================================================================
 */
unsigned char** allocate_image_array(int col, int row);


/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  free_image_array
 *  Description:  Deallocates 2D image data
 *
 *	Params:
 *		uchar** image: Image data to be deallocated
 *		int row: Number of rows to be deallocated
 * =====================================================================================
 */
void free_image_array(unsigned char** image, int row);	

#ifdef __cplusplus
}
#endif

#endif

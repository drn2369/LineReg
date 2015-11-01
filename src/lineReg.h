/*
 * =====================================================================================
 *
 *       Filename:  lineReg.h
 *
 *    Description:  Header for Line Registration
 *
 *        Version:  1.0
 *        Created:  08/13/2015 10:43:19 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  David Nilosek 
 *   Organization:  CaseWallet
 *
 * =====================================================================================
 */
#ifndef LINEREG_H
#define LINEREG_H

#include "util.h"

#ifdef __cplusplus
extern "C" {
#endif

/* 
* ===  FUNCTION  ======================================================================
*         Name:  subsetImage
*  Description:  Subsets a 2d image array
*
*  Parameters:
*		Image *img[in]: Image to subset
*		Image *imgSubset[out]: Subsetted image
*		int startRow: Starting row of subset
*		int startCol: Staring column of subset
*		int rowRange: Number of rows to subset
*		int colRange: Number of columns to subset
* =====================================================================================
*/
void subsetImage(Image *img, Image *imgSubset, int startRow, int startCol, int rowRange, int colRange);

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  registerLines
 *  Description: Function to register multiple line scans contained in a single 2D array
 *			in which the scans are stacked in a column
 *
 *  Parameters:
 *		Image *unregImage [in/out]: Image structure that contains the unregistered 
 *						linescans. Image is replaced by registered
 *						linescans.
 *		int lengthOfScan: The number of rows in each individual scan
 *					NOTE: lengthOfScan % unregImage->row == 0 
 *
 *  Return:
 *	 	int : 0 if lines regestered without error
		      >0 if lines regestered with error
 * =====================================================================================
 */
int registerLines(Image *unregImg, int lengthOfScan);


#ifdef __cplusplus
}
#endif

#endif


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


#ifdef __cplusplus
extern "C" {
#endif

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  registerLines
 *  Description: Function to register multiple line scans contained in a single 2D array
 *			in which the scans are stacked in a column
 *
 *  Parameters:
 *		uchar** lineScans: 2D array which contains the image data for each scan
 *		int[2] dims: Dimensions of the 2D array [col, row]
 *		int lengthOfScan: The number of rows in each individual scan
 *					NOTE: lengthOfScan % dims[1] == 0 
 *
 *  Return:
 *		uchar** : A 2D array containing the registered lines 
 * =====================================================================================
 */
unsigned char** registerLines(unsigned char** lineScans, int[2] dims, int lengthOfScan);


#ifdef __cplusplus
}
#endif

#endif


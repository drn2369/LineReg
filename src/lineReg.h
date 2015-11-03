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
#include "thirdParty/kissfft/kiss_fft.h"

#ifdef __cplusplus
extern "C" {
#endif

/* 
* ===  FUNCTION  ======================================================================
*         Name:  maxLocation
*  Description:  Function to computer the max location in a 1D kiss_fft_scalar array
*
*	Param:
*		kiss_fft_scalar arr: Array to process
*		int len: Length of array
*
*	Return:
*		int: 1D index of max location
* =====================================================================================
*/
int maxLocation(kiss_fft_scalar *arr, int len);
/* 
* ===  FUNCTION  ======================================================================
*         Name:  phaseCorrelation
*  Description:  Computes the phase correlation of two kiss_fft_cpx structures
*
*	Params:
*		int fLen: Length of frequency timescale
*		kiss_fft_cpx **ar1: The first complex array
*		kiss_fft_cpx **ar2: The second complex array
*		kiss_fft_cpx **out: The output complex array
* =====================================================================================
*/
void phaseCorrelation(int fLen, kiss_fft_cpx **ar1, kiss_fft_cpx **ar2, kiss_fft_cpx **out);

/* 
* ===  FUNCTION  ======================================================================
*         Name:  calcFreqLen
*  Description:  Calculates the length of the freqeunecy domain array for a real fft
*
*	Params:
*		int *dims: Dimensions of array
*		int ndims: Number of dimensions
*
*	Return:
*		int: length of 1D freq array
* =====================================================================================
*/
int calcFreqLen(const int *dims, int ndims);

/* 
* ===  FUNCTION  ======================================================================
*         Name:  subsetImageCpx
*  Description:  Subsets a 2d image array into 1D kiss_fft_scalar array
*
*  Parameters:
*		Image *img[in]: Image to subset
*		kiss_fft_scalar *imgSubset[out]: Reference to subsetted image scalar
*		int startRow: Starting row of subset
*		int startCol: Staring column of subset
*		int rowRange: Number of rows to subset
*		int colRange: Number of columns to subset
* =====================================================================================
*/
void subsetImageScl(Image *img, kiss_fft_scalar **imgSubset, int startRow, int startCol, int rowRange, int colRange);

/* 
* ===  FUNCTION  ======================================================================
*         Name:  subsetImageCpx
*  Description:  Subsets a 2d image array into 1D kiss_fft_cpx structure
*
*  Parameters:
*		Image *img[in]: Image to subset
*		kiss_fft_cpx *imgSubset[out]: Reference to subsetted image cpx struct
*		int startRow: Starting row of subset
*		int startCol: Staring column of subset
*		int rowRange: Number of rows to subset
*		int colRange: Number of columns to subset
* =====================================================================================
*/
void subsetImageCpx(Image *img, kiss_fft_cpx **imgSubset, int startRow, int startCol, int rowRange, int colRange);

/* 
* ===  FUNCTION  ======================================================================
*         Name:  subsetImage
*  Description:  Subsets a 2d image array
*
*  Parameters:
*		Image *img[in]: Image to subset
*		Image *imgSubset[out]: Reference to subsetted image pointer
*		int startRow: Starting row of subset
*		int startCol: Staring column of subset
*		int rowRange: Number of rows to subset
*		int colRange: Number of columns to subset
* =====================================================================================
*/
void subsetImage(Image *img, Image **imgSubset, int startRow, int startCol, int rowRange, int colRange);

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


/* Debug functions */
void writeSubset(const char* fN, kiss_fft_scalar *subset, int nRow, int nCol);

#ifdef __cplusplus
}
#endif

#endif



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
#include <stdio.h>

#ifndef UTIL_H
#define UTIL_H

#ifdef __cplusplus
extern "C" {
#endif

/* 
 * ===  STRUCTURE  ======================================================================
 *         Name:  PGMData
 *  Description:  Container for holding PGM data 
 * =====================================================================================
 */
typedef struct _PGMData{
	int row;
	int col;
	int max;
	int **image;
} PGMData;


/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  freePGMData
 *  Description:  Function to free PGM data pointer
 * =====================================================================================
 */
void freePGMData(PGMData* dataPtr);
/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  skipComment
 *  Description:  Skip comments while reading PGM file
 * =====================================================================================
 */
void skipComments(FILE *fP);

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  readPGM
 *  Description:  Reads a PGM image
 *	
 *	Params:
 *		const char* fN: File path [in]
 *		PGMData * data: PGM data structure to store image [out]
 * =====================================================================================
 */
void readPGM(const char *fN, PGMData *data);

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  writePGM
 *  Description:  Writes a PGM image
 *
 *	Params:
 *		const char* fN: File path for image writing
 *		PGMData *data: PGM data structure for output image
 * =====================================================================================
 */
void writePGM(const char* fN, PGMData *data); 

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
int** allocate_image_array(int col, int row);

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
void free_image_array(int** image, int row);	

#ifdef __cplusplus
}
#endif

#endif


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

#define idx21(rowIdx,colIdx,nCol) ( (rowIdx*nCol) + colIdx)
#define row12(idx, nCol) ( idx / nCol )
#define col12(idx, nCol) ( idx % nCol )

/* 
 * ===  STRUCTURE  ======================================================================
 *         Name:  Image
 *  Description:  Container for holding Image data 
 * =====================================================================================
 */
typedef struct _Image{
	int row;
	int col;
	int **data;
}Image;

/* 
 * ===  STRUCTURE  ======================================================================
 *         Name:  PGMImage
 *  Description:  Container for holding PGM image data 
 * =====================================================================================
 */
typedef struct _PGMImage{
	Image *img;
	int max;
} PGMImage;


/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  prod
 *  Description:  Calculates the product of an int array
 *
 *	Params:
 *		int *dims: int array
 *		int ndims: number of dimensions
 *
 *	Return:
 *		int: The product
 * =====================================================================================
 */
int prod(const int *dims, int ndims);

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  freePGMData
 *  Description:  Function to free Image pointer
 * =====================================================================================
 */
void freeImage(Image* dataPtr);

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  freePGMData
 *  Description:  Function to free PGM image pointer
 * =====================================================================================
 */
void freePGMImage(PGMImage* dataPtr);
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
 *		PGMImage * image: PGM data structure to store image [out]
 * =====================================================================================
 */
void readPGM(const char *fN, PGMImage *image);

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  writePGM
 *  Description:  Writes a PGM image
 *
 *	Params:
 *		const char* fN: File path for image writing
 *		PGMImage *image: PGM data structure for output image
 * =====================================================================================
 */
void writePGM(const char* fN, PGMImage *image); 

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

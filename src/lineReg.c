/*
 * =====================================================================================
 *
 *       Filename:  lineReg.c
 *
 *    Description:  Implimentation of Line Registration
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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "lineReg.h"

/* Function to subset images */
void subsetImage(Image *img, Image *imgSubset, int startRow, int startCol, int rowRange, int colRange){

	/* Def */
	int i,j;

	/* Allocate subset */
	if( imgSubset == NULL ){
		/* Create new data */
		imgSubset = malloc(sizeof(Image));

		/* Allocate image data */
		imgSubset->col = colRange;
		imgSubset->row = rowRange;
		imgSubset->data = allocate_image_array(colRange, rowRange);	
	}else{
		/* If the subset is not the same size, delete and reallocate */
		if( (imgSubset->row != rowRange) || (imgSubset->col != colRange) ){

			/* Free data */
			freeImage(imgSubset);

			/* Create new data */
			imgSubset = malloc(sizeof(Image));

			/* Allocate image data */
			imgSubset->col = colRange;
			imgSubset->row = rowRange;
			imgSubset->data = allocate_image_array(colRange, rowRange);	
		}
	}

	/* Check boundry condition */
	if( startRow < 0 || startCol < 0 || 
	    ( (startRow + rowRange) > img->row ) ||
	    ( (startCol + colRange) > img->col ) ) return;

	/* Fill Data */
	for(i = 0; i < rowRange-1; i++){
		for(j = 0; j < colRange-1; j++){
			imgSubset->data[i][j] = img->data[startCol + i][startRow + j];	
		}
	}		
}

/* Function to register line scans */
int registerLines(Image *unregImg, int lengthOfScan){

	/* Def */
	int regOk = 0;
	int i, scanLines;
	Image *currentLine = NULL;
	Image *nextLine = NULL;

	/* Check bounds */
	if( lengthOfScan % unregImg->row != 0 ){
		fprintf(stderr,"LineReg: Scan length incorrect");
		regOk = 1;
		return regOk;
	}

	/* Calculate number of scan lines */
	scanLines = unregImg->row/lengthOfScan;

	/* Subset first line */
	subsetImage(unregImg, currentLine, 0, 0, lengthOfScan, unregImg->col);

	/* FFT of first line */

	/* Iterate over scan lines */
	for( i = 1; i < scanLines; i++){

		/* Subset next line */
		subsetImage(unregImg, nextLine, i*lengthOfScan, 0, lengthOfScan, unregImg->col);
	
		/* FFT of current line */

		/* Phase correlation */

		/* Free current and swap next  */
		freeImage(currentLine);
		currentLine = nextLine;
		nextLine = NULL; 
	}	
	
	/* Free line */
	freeImage(currentLine);

	return regOk;
}

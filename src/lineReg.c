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

/* Third party */
#include "thirdParty/kissfft/_kiss_fft_guts.h"
#include "thirdParty/kissfft/kiss_fftndr.h"

#include "lineReg.h"

int maxLocation(kiss_fft_scalar *arr, int len){

	/* Define */
	int i;
	int maxLoc = 0;
	kiss_fft_scalar max = 0;

	/* Find mac loc */
	for(i = 0; i < len; i++){

		if( max < arr[i] ){
		   max = arr[i];
		   maxLoc = i;
		}

	}

	return maxLoc;
}

/* Function to compute phase correlation */
void phaseCorrelation(int fLen, kiss_fft_cpx **ar1, kiss_fft_cpx **ar2, kiss_fft_cpx **out){

	/* Def */
	int k;
	
	/* Multiply by complex conj */
	for(k = 0; k < fLen; k++){

		/* Conj */
		(*ar2)[k].i = -1*(*ar2)[k].i;

		/* Multiply using kiss fft function */
		C_MUL((*ar1)[k],(*ar2)[k],(*out)[k]);

		/* Deconj */
		(*ar2)[k].i = -1*(*ar2)[k].i;

		/* Normalize (maybe) */
		/*(*out)[k] = (*out)[k] / ( sqrt ( ((*out)[k].r * (*out)[k].r) +
						 ((*out)[k].i * (*out)[k].i)) );
		*/
	}

}

/* Function to calculate frequency array length */
int calcFreqLen(const int *dims, int ndims){

	int realDims = dims[ndims-1];
	int otherDim = prod(dims,ndims -1);

	/* Real fft is conjugate symmetic, so only half 
	   the dimension is needed */
	int freqLen = (realDims / 2 + 1) * otherDim;

	return freqLen;
}

/* Function to subset image */
void subsetImageScl(Image *img, kiss_fft_scalar **imgSubset, int startRow, int startCol, int rowRange, int colRange){

	/* Def */
	int i,j;

	/* Allocate subset */
	if( *imgSubset == NULL){
		/* Create new data */
		*imgSubset = malloc(rowRange*colRange*sizeof(kiss_fft_scalar));
	}else{

		/* Free data and reallocate */
		free(imgSubset);
		
		/* Create new data */
		*imgSubset = malloc(rowRange*colRange*sizeof(kiss_fft_scalar));

	}
	
	/* Check boundry condition */
	if( startRow < 0 || startCol < 0 || 
	    ( (startRow + rowRange) > img->row ) ||
	    ( (startCol + colRange) > img->col ) ) return;

	/* Fill Data */
	for(i = 0; i < rowRange-1; i++){
		for(j = 0; j < colRange-1; j++){
			(*imgSubset)[idx21(i,j,colRange)] = (kiss_fft_scalar)img->data[startCol + i][startRow + j];	
		}
	}
}

/* Function to subset image */
void subsetImageCpx(Image *img, kiss_fft_cpx **imgSubset, int startRow, int startCol, int rowRange, int colRange){

	/* Def */
	int i,j;

	/* Allocate subset */
	if( imgSubset == NULL){
		/* Create new data */
		*imgSubset = malloc(rowRange*colRange*sizeof(kiss_fft_cpx));
	}else{

		/* Free data and reallocate */
		free(imgSubset);
		
		/* Create new data */
		*imgSubset = malloc(rowRange*colRange*sizeof(kiss_fft_cpx));

	}
	
	/* Check boundry condition */
	if( startRow < 0 || startCol < 0 || 
	    ( (startRow + rowRange) > img->row ) ||
	    ( (startCol + colRange) > img->col ) ) return;

	/* Fill Data */
	for(i = 0; i < rowRange-1; i++){
		for(j = 0; j < colRange-1; j++){
			(*imgSubset)[idx21(i,j,colRange)].r = img->data[startCol + i][startRow + j];	
			(*imgSubset)[idx21(i,j,colRange)].i = 0;	
		}
	}
}

/* Function to subset images */
void subsetImage(Image *img, Image **imgSubset, int startRow, int startCol, int rowRange, int colRange){

	/* Def */
	int i,j;

	/* Allocate subset */
	if( imgSubset == NULL ){
		/* Create new data */
		*imgSubset = malloc(sizeof(Image));

		/* Allocate image data */
		(*imgSubset)->col = colRange;
		(*imgSubset)->row = rowRange;
		(*imgSubset)->data = allocate_image_array(colRange, rowRange);	
	}else{
		/* If the subset is not the same size, delete and reallocate */
		if( ((*imgSubset)->row != rowRange) || ((*imgSubset)->col != colRange) ){

			/* Free data */
			freeImage(imgSubset);

			/* Create new data */
			*imgSubset = malloc(sizeof(Image));

			/* Allocate image data */
			(*imgSubset)->col = colRange;
			(*imgSubset)->row = rowRange;
			(*imgSubset)->data = allocate_image_array(colRange, rowRange);	
		}
	}

	/* Check boundry condition */
	if( startRow < 0 || startCol < 0 || 
	    ( (startRow + rowRange) > img->row ) ||
	    ( (startCol + colRange) > img->col ) ) return;

	/* Fill Data */
	for(i = 0; i < rowRange-1; i++){
		for(j = 0; j < colRange-1; j++){
			(*imgSubset)->data[i][j] = img->data[startCol + i][startRow + j];	
		}
	}		
}

/* Function to register line scans */
int registerLines(Image *unregImg, int lengthOfScan){

	/* Def */
	int regOk = 0;
	int i, scanLines;
	int maxLocI, maxLocR, maxLocC;
	Image *currentLine = NULL;
	Image *nextLine = NULL;
	/* DEBUG */
	const char fN[] = { "subset.pgm" };
	
	/* Check bounds */
	if( unregImg->row % lengthOfScan != 0 ){
		fprintf(stderr,"LineReg: Scan length incorrect\n");
		regOk = 1;
		return regOk;
	}

	/* TODO: Check scanline size to be power of 2 */

	/* Init 2D FFT */
	const int dims[2] = { lengthOfScan, unregImg->col};
	const int ndims = 2;
	kiss_fft_scalar *cLine = NULL;
	kiss_fft_scalar *nLine = NULL;

	/* Calc freq length and allocate */
	int fLen = calcFreqLen(dims,ndims);
	kiss_fft_cpx *cLineCpx = malloc(fLen*(sizeof(kiss_fft_cpx)));
	kiss_fft_cpx *nLineCpx = malloc(fLen*(sizeof(kiss_fft_cpx)));

	kiss_fftndr_cfg fft = kiss_fftndr_alloc(dims,ndims,0,0,0); /* Foward 2D FFT */
	kiss_fftndr_cfg ifft = kiss_fftndr_alloc(dims,ndims,1,0,0); /* Inverse 2D FFT */

	/* Calculate number of scan lines */
	scanLines = unregImg->row/lengthOfScan;

	/* Subset first line */
	subsetImageScl(unregImg, &cLine, 0, 0, lengthOfScan, unregImg->col);

	writeSubset(fN, cLine, lengthOfScan, unregImg->col);
	/* FFT of first line */
	kiss_fftndr(fft, cLine, cLineCpx);

	/* Iterate over scan lines */
	for( i = 1; i < scanLines; i++){

		/* Subset next line */
		subsetImageScl(unregImg, &nLine, i*lengthOfScan, 0, lengthOfScan, unregImg->col);
	
		/* FFT of line */
		kiss_fftndr(fft, nLine, nLineCpx);

		/* Phase correlation */
		phaseCorrelation(fLen,&cLineCpx,&nLineCpx,&cLineCpx);

		/* IFFT of combination */
		kiss_fftndri(ifft, cLineCpx, cLine);
	
		/* Find max of cLine */
		maxLocI = maxLocation(cLine, dims[0]*dims[1]);

		/* Compute 2D location */
		maxLocR = row12(maxLocI, dims[1]);	
		maxLocC = col12(maxLocI, dims[1]);	

		printf("%d , %d\n", maxLocR, maxLocC); 

		/* Swap (with freeing current to overwrite)  */
		/*Image*/
		//free(cLine);
		//cLine = malloc(sizeof(nLine));
		memcpy(cLine, nLine, sizeof(nLine));
		free(nLine);
		nLine = NULL;
		/*FFT*/
		//free(cLineCpx);
		//cLineCpx = malloc(sizeof(nLineCpx));
		memcpy(cLineCpx,nLineCpx, sizeof(nLineCpx));
		 /* Not deleting nLineCpx as it will just get overwritten */ 
		
	}	
	
	/* Free everything */
	free(cLineCpx);
	free(nLineCpx);
	kiss_fft_free(fft);
	kiss_fft_free(ifft);
	return regOk;
}


/* DEBUG FUNCTIONS */
void writeSubset(const char* fN, kiss_fft_scalar *subset, int nRow, int nCol){

	/* Def */
	int i,j;

	/* Allocate new PGM image */
	PGMImage *image = malloc(sizeof(PGMImage));
	image->img = malloc(sizeof(Image));
	image->img->data = allocate_image_array(nCol, nRow);
	image->img->col = nCol;
	image->img->row = nRow;
	image->max = 255;


	/* Fill data */
	for(i = 0; i < nRow; i++){
		for(j = 0; j < nCol; j++){
			image->img->data[i][j] = (int)subset[idx21(i,j,nCol)];
		}
	}	

	/* Write data */
	writePGM(fN,image);

	/* Free data */
	freePGMImage(image);
	
}

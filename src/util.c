/*
 * =====================================================================================
 *
 *       Filename:  util.c
 *
 *    Description:  Implimnetation of general functions
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
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

#include "util.h"

void skipComments(FILE *fP){

	while(getc(fP) == '#'){
		while(getc(fP) != '\n');
	}

	fseek(fP, -1, SEEK_CUR);
}

void freeImage(Image* dataPtr){

	/* Free image */
	free_image_array(dataPtr->data,dataPtr->row);

	/* Free ptr */
	free(dataPtr);
}

void freePGMImage(PGMImage* dataPtr){

	/* Free image */
	freeImage(dataPtr->img);

	/* Free ptr */
	free(dataPtr);
}

void readPGM(const char *fN, PGMImage *image){
	
	/*Def */
	FILE *fileVar;
	char version[3];
	int i, j;
	int h, l;

	/* malloc image */
	image->img = malloc(sizeof(Image));

	/* Open and start reading */
	fileVar = fopen(fN, "rb");
	if (fileVar == NULL){
		fprintf(stderr,"Unable to open file");
		return;
	}

	/*Get Version*/
	fgets(version, sizeof(version), fileVar);
	if( strcmp(version, "P5") ){
		fprintf(stderr,"Unknown file type");
		return;
	}

	fgetc(fileVar); /*burn off \n */
	/*Skip through comments*/
	skipComments(fileVar);
	/*Get row, col and max grey value*/
	fscanf(fileVar, "%d", &image->img->col);
	fscanf(fileVar, "%d", &image->img->row);
	fscanf(fileVar, "%d", &image->max);
	fgetc(fileVar); /*burn off \n */

	/* Create image array */
	image->img->data = allocate_image_array(image->img->col, image->img->row);

	/* Read image array */
	
	/* If max is above 255, then calculate value above 8 bits */ 
	if( image->max > 255 ){
		for(i = 0; i < image->img->row; i++){
			for(j = 0; j < image->img->col; j++){
				/* Get both values */
				h = fgetc(fileVar);
				l = fgetc(fileVar);
			
				/* Store image */
				image->img->data[i][j] = (h << 8) + l;
			}
		}
	/* If max is below 255, read as normal */
	}else{
		for(i = 0; i < image->img->row; i++){
			for(j = 0; j < image->img->col; j++){
				l = fgetc(fileVar);
				image->img->data[i][j] = l;
			}
		}
	}

	fclose(fileVar);
}

void writePGM(const char* fN, PGMImage *image){

	/* Define */
	FILE *fileVar;
	int i, j;
	int h, l;

	/* Open file for writing */
	fileVar = fopen(fN, "wb");
	if(fileVar == NULL){
		fprintf(stderr,"Cannot open file to write");
		return;
	}	

	/*Write header*/
	fprintf(fileVar, "P5 ");
	fprintf(fileVar, "%d %d ", image->img->col, image->img->row);
	fprintf(fileVar, "%d ", image->max);
	
	/*Write data*/

	/*Write data if max is over 255*/
	if(image->max > 255){
		for( i = 0; i < image->img->row; i++){
			for( j = 0; j < image->img->col; j++){
				/*Shift bits 5,6*/
				h = ( image->img->data[i][j] & 0x0000FF00 ) >> 8;
				l = ( image->img->data[i][j] & 0x000000FF );

				/*Write values*/
				fputc(h, fileVar);
				fputc(l, fileVar);	
			}
		}
	/*Write data as normal*/
	}else{
		for( i = 0; i < image->img->row; i++){
			for( j = 0; j < image->img->col; j++){
				l = (image->img->data[i][j]  & 0x000000FF );
				fputc(l, fileVar);
			}
		}
	}
	
	/* Close */
	fclose(fileVar);
}

int** allocate_image_array(int cols, int rows){
	
	/* Def */
	int** image = NULL;
	int r,rr;

	/* Make first allocation of rows */
	if( (image = malloc(rows*sizeof(int*))) == NULL ){
		fprintf(stderr, "Error allocating rows.\n");
		return ((int **)NULL);
	}

	/* Allocate array for each row */
	for(r = 0; r < rows; r++){
		if( (image[r] =  malloc(cols*sizeof(int))) == NULL){
			fprintf(stderr,"Error allocating columns.\n");
			/* Cleanup if error*/
			for(rr=0; rr < r; rr++) free(image[rr]);
			free(image);
			return((int **)NULL);
		}
	}

	return image;
}

void free_image_array(int** image, int row){
	
	/* Def */
	int r;

	/* Free each row */
	for(r = 0; r < row; r++) free(image[r]);

	/* Free the rest */
	free(image);
}




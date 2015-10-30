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

	/* Def */
	int  ltr;
	char line[100];

	while( ( ltr = fgetc(fP) ) != EOF && isspace(ltr) ) {
		if(ltr == '#'){
			fgets(line, sizeof(line),fP);
			skipComments(fP);
		}else{
			fseek(fP, -1, SEEK_CUR);
		}
	}
}

void freePGMData(PGMData* dataPtr){

	free_image_array(dataPtr->image,dataPtr->row);

}

void readPGM(const char *fN, PGMData *data){
	
	/*Def */
	FILE *fileVar;
	char version[3];
	int i, j;
	int h, l;

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

	/*Skip through comments*/
	skipComments(fileVar);
	/*Get row, col and max grey value*/
	fscanf(fileVar, "%d", &data->col);
	skipComments(fileVar);
	fscanf(fileVar, "%d", &data->row);
	skipComments(fileVar);
	fscanf(fileVar, "%d", &data->max);
	fgetc(fileVar);

	/* Create image array */
	data->image = allocate_image_array(data->col, data->row);

	/* Read image array */
	
	/* If max is above 255, then calculate value above 8 bits */ 
	if( data->max > 255 ){
		for(i = 0; i < data->row; i++){
			for(j = 0; j < data->col; j++){
				/* Get both values */
				h = fgetc(fileVar);
				l = fgetc(fileVar);
			
				/* Store image */
				data->image[i][j] = (h << 8) + l;
			}
		}
	/* If max is below 255, read as normal */
	}else{
		for(i = 0; i < data->row; i++){
			for(j = 0; j < data->col; j++){
				l = fgetc(fileVar);
				data->image[i][j] = l;
			}
		}
	}

	fclose(fileVar);
}

void writePGM(const char* fN, PGMData *data){

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
	fprintf(fileVar, "%d %d ", data->col, data->row);
	fprintf(fileVar, "%d ", data->max);
	
	/*Write data*/

	/*Write data if max is over 255*/
	if(data->max > 255){
		for( i = 0; i < data->row; i++){
			for( j = 0; j < data->col; j++){
				/*Shift bits 5,6*/
				h = ( data->image[i][j] & 0x0000FF00 ) >> 8;
				l = ( data->image[i][j] & 0x000000FF );

				/*Write values*/
				fputc(h, fileVar);
				fputc(l, fileVar);	
			}
		}
	/*Write data as normal*/
	}else{
		for( i = 0; i < data->row; i++){
			for( j = 0; j < data->col; j++){
				l = (data->image[i][j]  & 0x000000FF );
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




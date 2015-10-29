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

unsigned char** allocate_image_array(int col, int row){
	
	//Def
	unsigned char** image = NULL;
	int r,rr;

	//Make first allocation of rows
	if( (image = (unsigned char**)malloc(rows, sizeof(unsigned char*))) == NULL ){
		fprintf(stderr, "Error allocating rows.\n");
		return ((unsigned char **)NULL);
	}

	//Allocate array for each row
	for(r = 0; r < row; r++){
		if( (image[r] = (unsigned char*) malloc(cols, sizeof(unsigned char))) == NULL){
			fprintf(stderr,"Error allocating columns.\n");
			for(rr=0; rr < r; rr++) free(image[rr]);
			free(image);
			return((unsigned char **)NULL);
		}
	}

	return image;
}

void free_image_array(unsigned char** image, int row){
	
	//Def
	int r;

	//Free each row
	for(r = 0; r < row; r++) free(image[r]);

	//Free the rest
	free(image);
}




/*
 * =====================================================================================
 *
 *       Filename:  main.c
 *
 *    Description:  main test function
 *
 *        Version:  1.0
 *        Created:  08/13/2015 10:34:48 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <stdlib.h>
#include "../src/lineReg.h"
#include "../src/util.h"

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 *  Description:  Demo line registration 
 * =====================================================================================
 */
	int
main ( int argc, char *argv[] )
{
	/* Def */
	int dims[2];
	PGMImage *testImage = malloc(sizeof(PGMImage));
		
	/* Read test image */	
	readPGM(argv[1], testImage);

	/* Define dimensions of single scanline */
	dims[0] = testImage->img->col;
	dims[1] = 8; /* Defined by scanner hardware */

	/* register lines */	
	registerLines(testImage->img->data, dims, testImage->img->row);

	/* Cleanup */	
	freePGMImage(testImage);
	return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

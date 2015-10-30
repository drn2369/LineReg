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

#include "util.h"

/* Function to register line scans */
int** registerLines(int** lineScans, int dims[2], int lengthOfScan){

	/* Def */
	int i, scanLines;
	/* Set regLines */
	int** regLines = NULL; 

	/* Check bounds */
	if( lengthOfScan % dims[1] != 0 ){
		fprintf(stderr,"LineReg: Scan length incorrect");
		return regLines;
	}

	/* Calculate number of scan lines */
	scanLines = dims[1]/lengthOfScan;

	/* Iterate over scan lines */
	for( i = 1; i < scanLines; i++){



	}	

	return regLines;
}

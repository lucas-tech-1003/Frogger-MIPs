#####################################################################
#
# CSC258H5S Fall 2021 Assembly Final Project
# University of Toronto, St. George
#
# Student: Lucas Lei, Student Number: 1005908154
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8
# - Unit height in pixels: 8
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestone is reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4/5 (choose the one the applies)
# Milestone 1-5
#
# Which approved additional features have been implemented?
# (See the assignment handout for the list of additional features)
# 1. Display the number of lives remaining.	(easy)
# 2. After final player death, display game over/retry screen. Restart the game if the¡°retry¡± option is chosen.	(easy)
# 3. Dynamic increase in difficulty (speed,obstacles, etc.) as game progresses		(easy)
# 4. Have objects in different rows move at different speeds.			(easy)
# 5. Display the player¡¯s score at the top of the screen.		(hard)
# 6. Add powerups to scene (slowing down time, score booster, extra lives, etc)		(hard)
# Any additional information that the TA needs to know:
# - When 'game over', you can press any key to restart the game
# - The goldyellow place is the powerup station for slowing the speed
# - There's a counter counting how many powerups you have used. You only have 5 powerups each round
#####################################################################

.data
	displayAddress: 	.word	0x10008000
	game_over_screen:	.word	0x00ff00:4096
	
	red:			.word	0xff0000
	blue:			.word	0x0000ff
	green:			.word	0x00ff00
	olive:			.word	0x808000
	black:			.word	0xffffff
	
	speed:			.word	1000		# speed of the logs and cars
	lives:			.word	3
	score:			.word	0
	
	slow_time_counter:	.word	0
	
	frogX: 			.word	60	# The top-right corner
	frogY: 			.word	3584	# the top right corner
	waterRow1:	 	.space	512  # 32 pixels wide x 4 pixels high x 4 bytes/pixel
	waterRow2:	 	.space	512
	roadRow1:		.space	512
	roadRow2:		.space	512
	
	# Becareful rows' start coordinate
	road1:			.word	2560
	road2:			.word	3072
	water1:			.word	1024
	water2:			.word	1536
	
.text

set_game_over_screen:
	li $t1, 0x0000ff
	# wordrow1
	addi $t2, $zero, 1028
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1032
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1048
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1064
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1076
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1088
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1092
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1096
	sw $t1, game_over_screen($t2)
	
	# wordrow2
	addi $t2, $zero, 1152
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1172
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1180
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1188
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1196
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1200
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1208
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1216
	sw $t1, game_over_screen($t2)
	
	# wordrow3
	addi $t2, $zero, 1280
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1288
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1292
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1300
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1308
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1316
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1324
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1328
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1336
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1344
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1348
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1352
	sw $t1, game_over_screen($t2)
	
	# wordrow4
	addi $t2, $zero, 1408
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1420
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1428
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1432
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1436
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1444
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1464
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1472
	sw $t1, game_over_screen($t2)
	
	# wordrow5
	addi $t2, $zero, 1540
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1544
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1548
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1556
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1564
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1572
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1592
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1600
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1604
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1608
	sw $t1, game_over_screen($t2)
	
	# wordrow6
	addi $t2, $zero, 1932
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1936
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1948
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1956
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1964
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1968
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1972
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1980
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 1984
	sw $t1, game_over_screen($t2)
	
	# wordrow7
	addi $t2, $zero, 2056
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2068
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2076
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2084
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2092
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2108
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2116
	sw $t1, game_over_screen($t2)
	
	# wordrow8
	addi $t2, $zero, 2184
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2196
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2204
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2212
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2220
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2224
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2228
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2236
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2240
	sw $t1, game_over_screen($t2)
	
	# wordrow9
	addi $t2, $zero, 2312
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2324
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2332
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2340
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2348
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2364
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2372
	sw $t1, game_over_screen($t2)
	
	# wordrow10
	addi $t2, $zero, 2444
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2448
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2464
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2476
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2480
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2484
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2492
	sw $t1, game_over_screen($t2)
	addi $t2, $zero, 2500
	sw $t1, game_over_screen($t2)


	# Store colours in array waterRow1
	li $t1, 0x8b4513
	li $t3, 0x0000ff
	add $s0, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
	
store_log_row1:
	beq $s0, 8, store_row1_end	# loop eight times
	addi $t4, $t4, 4		# draw a 4pixel vertical line for each iter.	
	sw $t1, waterRow1($t4)
	addi $t4, $t4, 128
	sw $t1, waterRow1($t4)
	addi $t4, $t4, 128
	sw $t1, waterRow1($t4)
	addi $t4, $t4, 128
	sw $t1, waterRow1($t4)
	
	# second log
	addi $t5, $t5, 64
	sw $t1, waterRow1($t5)
	addi $t5, $t5, 128
	sw $t1, waterRow1($t5)
	addi $t5, $t5, 128
	sw $t1, waterRow1($t5)
	addi $t5, $t5, 128
	sw $t1, waterRow1($t5)
	
	addi $t6, $t6, 4
	addi $s0, $s0, 1
	addi $t4, $t6, 0
	addi $t5, $t6, 0

	j store_log_row1

store_row1_end:
	
	add $s0, $zero, $zero
store_row1_blue:
	beq $s0, 512, store_blue1_end
	lw $t9, waterRow1($s0)
	beq $t9, 0x000000, switch_to_blue
	addi $s0, $s0, 4
	
	j store_row1_blue
	
switch_to_blue:
	sw $t3, waterRow1($s0)
	addi $s0, $s0, 4
	j store_row1_blue
	
store_blue1_end:

	# Store colours in array waterRow2
	li $t1, 0x8b4513
	li $t3, 0x0000ff
	add $s0, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
	
store_log_row2:
	beq $s0, 8, store_row2_end	# loop eight times
	addi $t4, $t4, 8	# draw a 4pixel vertical line for each iter.
	sw $t1, waterRow2($t4)
	addi $t4, $t4, 128
	sw $t1, waterRow2($t4)
	addi $t4, $t4, 128
	sw $t1, waterRow2($t4)
	addi $t4, $t4, 128
	sw $t1, waterRow2($t4)
	
	#second log
	addi $t5, $t5, 68
	sw $t1, waterRow2($t5)
	addi $t5, $t5, 128
	sw $t1, waterRow2($t5)
	addi $t5, $t5, 128
	sw $t1, waterRow2($t5)
	addi $t5, $t5, 128
	sw $t1, waterRow2($t5)
	
	addi $t6, $t6, 4
	addi $s0, $s0, 1
	addi $t4, $t6, 0
	addi $t5, $t6, 0
	j store_log_row2

store_row2_end:

	add $s0, $zero, $zero
store_row2_blue:
	beq $s0, 512, store_blue2_end
	lw $t9, waterRow2($s0)
	beq $t9, 0x000000, switch_to_blue1
	addi $s0, $s0, 4
	
	j store_row2_blue
	
switch_to_blue1:
	sw $t3, waterRow2($s0)
	addi $s0, $s0, 4
	j store_row2_blue
	
store_blue2_end:

# Store colours in array roadRow1
	li $t1, 0xff0000
	add $s0, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
store_car_row1:
	beq $s0, 4, store_car_row1_end	# loop eight times
	addi $t4, $t4, 8		# draw a 4pixel vertical line for each iter.
	sw $t1, roadRow1($t4)
	addi $t4, $t4, 128
	sw $t1, roadRow1($t4)
	addi $t4, $t4, 128
	sw $t1, roadRow1($t4)
	addi $t4, $t4, 128
	sw $t1, roadRow1($t4)
	
	#second car
	addi $t5, $t5, 68
	sw $t1, roadRow1($t5)
	addi $t5, $t5, 128
	sw $t1, roadRow1($t5)
	addi $t5, $t5, 128
	sw $t1, roadRow1($t5)
	addi $t5, $t5, 128
	sw $t1, roadRow1($t5)
	
	addi $t6, $t6, 4
	addi $s0, $s0, 1
	addi $t4, $t6, 0
	addi $t5, $t6, 0
	j store_car_row1

store_car_row1_end:

	add $s0, $zero, $zero
store_car_row1_blue:
	beq $s0, 512, store_car_blue1_end
	lw $t9, roadRow1($s0)
	beq $t9, 0x000000, car_switch_to_blue
	addi $s0, $s0, 4
	
	j store_car_row1_blue
	
car_switch_to_blue:
	li $t3, 0x000000
	sw $t3, roadRow1($s0)
	addi $s0, $s0, 4
	j store_car_row1_blue
	
store_car_blue1_end:

	# Store colours in array waterRow2
	li $t1, 0xff0000
	add $s0, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
store_car_row2:
	beq $s0, 4, store_car_row2_end	# loop eight times
	addi $t4, $t4, 0	# draw a 4pixel vertical line for each iter.
	# beq $t4, 128, wrap_handler	# check if the object needs to wrap around
	sw $t1, roadRow2($t4)
	addi $t4, $t4, 128
	sw $t1, roadRow2($t4)
	addi $t4, $t4, 128
	sw $t1, roadRow2($t4)
	addi $t4, $t4, 128
	sw $t1, roadRow2($t4)
	
	addi $t5, $t5, 64
	# beq $t5, 128, wrap_handler	# check if the object needs to wrap around
	sw $t1, roadRow2($t5)
	addi $t5, $t5, 128
	sw $t1, roadRow2($t5)
	addi $t5, $t5, 128
	sw $t1, roadRow2($t5)
	addi $t5, $t5, 128
	sw $t1, roadRow2($t5)
	
	addi $t6, $t6, 4
	addi $s0, $s0, 1
	addi $t4, $t6, 0
	addi $t5, $t6, 0
	j store_car_row2

store_car_row2_end:

	add $s0, $zero, $zero
store_roadrow2_blue:
	beq $s0, 512, store_roadblue2_end
	lw $t9, roadRow2($s0)
	beq $t9, 0x000000, car_switch_to_blue1
	addi $s0, $s0, 4
	
	j store_roadrow2_blue
	
car_switch_to_blue1:
	li $t3, 0x000000
	sw $t3, roadRow2($s0)
	addi $s0, $s0, 4
	j store_roadrow2_blue
	
store_roadblue2_end:

restart:
	addi $t1, $0, 60
	sw $t1, frogX
	addi $t1, $0, 3584
	sw $t1, frogY
	addi $t1, $0, 1000
	sw $t1, speed
	addi $t1, $0, 3
	sw $t1, lives
	addi $t1, $0, 0
	sw $t1, score
	addi $t1, $t0, 0
	sw $t1, slow_time_counter

repaint:
	li $v0, 32
	li $a0, 17
	
	
	
check_input:
	lw $t0, 0xffff0000
	beq $t0, 1, keyboard_input
	j continue
	
keyboard_input:
	lw $t1, 0xffff0004
	beq $t1, 0x61, respond_to_A
	beq $t1, 0x77, respond_to_W
	beq $t1, 0x73, respond_to_S
	beq $t1, 0x64, respond_to_D
	j continue
	
respond_to_A:
	lw $t1, frogX
	addi $t1, $t1, -16
	ble $t1, 0, check_input
	sw $t1, frogX
	j continue
	
respond_to_W:
	lw $t1, frogY
	addi $t1, $t1, -512
	sw $t1, frogY
	j continue
	
respond_to_S:
	lw $t1, frogY
	addi $t1, $t1, 512
	bge $t1, 4096, check_input
	sw $t1, frogY
	j continue
	
respond_to_D:
	lw $t1, frogX
	addi $t1, $t1, 16
	bge $t1, 128, check_input
	sw $t1, frogX
	j continue
	
	
continue:	
	lw $t2, green
	addi $s0, $zero, 128 # loop for a row
	addi $t5, $zero, 128 # num needed to get to the second row
	addi $t6, $zero, 28 # The desired row
	mult $t5, $t6
	mflo $t5   # The coordinate of the starting zone
starting_zone_loop:
	beq $s0, $zero, starting_zone_end
	
	lw $t0, displayAddress
	add $t0, $t0, $t5
	sw $t2, 0($t0) # draw the pixel
	
	addi $t5, $t5, 4
	addi $s0, $s0, -1
	
	j starting_zone_loop
starting_zone_end:
	
	addi $s0, $zero, 128 # loop for a row
	addi $t5, $zero, 128 # num needed to get to the second row
	addi $t6, $zero, 16 # The desired row
	mult $t5, $t6
	mflo $t5   # The coordinate to start with
	lw $t1, olive # Olive color
safe_loop:
	beq $s0, $zero, safe_loop_end
	
	lw $t0, displayAddress
	add $t0, $t0, $t5
	sw $t1, 0($t0) # draw the pixel
	
	addi $t5, $t5, 4
	addi $s0, $s0, -1
	
	j safe_loop
	
safe_loop_end:

slow_time_zone:
	li $t0, 0xffc000
	lw $t1, displayAddress
	sw $t0, 2048($t1)
	lw $t1, displayAddress
	sw $t0, 2176($t1)
	lw $t1, displayAddress
	sw $t0, 2304($t1)
	lw $t1, displayAddress
	sw $t0, 2432($t1)
	
	lw $t1, displayAddress
	sw $t0, 2052($t1)
	lw $t1, displayAddress
	sw $t0, 2180($t1)
	lw $t1, displayAddress
	sw $t0, 2308($t1)
	lw $t1, displayAddress
	sw $t0, 2436($t1)
	
	lw $t1, displayAddress
	sw $t0, 2056($t1)
	lw $t1, displayAddress
	sw $t0, 2184($t1)
	lw $t1, displayAddress
	sw $t0, 2312($t1)
	lw $t1, displayAddress
	sw $t0, 2440($t1)
	
	lw $t1, displayAddress
	sw $t0, 2060($t1)
	lw $t1, displayAddress
	sw $t0, 2188($t1)
	lw $t1, displayAddress
	sw $t0, 2316($t1)
	lw $t1, displayAddress
	sw $t0, 2444($t1)
	
	lw $t1, displayAddress
	sw $t0, 2064($t1)
	lw $t1, displayAddress
	sw $t0, 2192($t1)
	lw $t1, displayAddress
	sw $t0, 2320($t1)
	lw $t1, displayAddress
	sw $t0, 2448($t1)


	addi $s0, $zero, 256 # num of loops
	addi $t5, $zero, 128 # num needed to get to the second row
	addi $t6, $zero, 0 # The desired row
	mult $t5, $t6
	mflo $t5   # The coordinate to start with
goal_region_loop:
	beq $s0, $zero, goal_region_end
	
	lw $t0, displayAddress
	add $t0, $t0, $t5
	sw $t2, 0($t0) # draw the pixel
	
	addi $t5, $t5, 4
	addi $s0, $s0, -1
	
	j goal_region_loop

goal_region_end:
	
	# Display the number of lives
display_lives:
	lw $t1, lives
	beq $t1, 0, draw_live0
	beq $t1, 1, draw_live1
	beq $t1, 2, draw_live2
				# Full live
	lw $t9, red		# color red
	lw $t0, displayAddress
	sw $t9, 0($t0)
	
	lw $t0, displayAddress
	sw $t9, 4($t0)
	lw $t0, displayAddress
	sw $t9, 8($t0)
	lw $t0, displayAddress
	sw $t9, 136($t0)
	lw $t0, displayAddress
	sw $t9, 260($t0)
	lw $t0, displayAddress
	sw $t9, 264($t0)
	lw $t0, displayAddress
	sw $t9, 392($t0)
	lw $t0, displayAddress
	sw $t9, 512($t0)
	lw $t0, displayAddress
	sw $t9, 516($t0)
	lw $t0, displayAddress
	sw $t9, 520($t0)
	j display_end
	
draw_live0:
	lw $t9, red		# color red
	lw $t0, displayAddress
	sw $t9, 0($t0)
	
	lw $t0, displayAddress
	sw $t9, 4($t0)
	lw $t0, displayAddress
	sw $t9, 8($t0)
	lw $t0, displayAddress
	sw $t9, 128($t0)
	lw $t0, displayAddress
	sw $t9, 136($t0)
	lw $t0, displayAddress
	sw $t9, 256($t0)
	lw $t0, displayAddress
	sw $t9, 264($t0)
	lw $t0, displayAddress
	sw $t9, 384($t0)
	lw $t0, displayAddress
	sw $t9, 392($t0)
	lw $t0, displayAddress
	sw $t9, 512($t0)
	lw $t0, displayAddress
	sw $t9, 516($t0)
	lw $t0, displayAddress
	sw $t9, 520($t0)
	j display_end
	
draw_live1:
	lw $t9, red		# color red
	lw $t0, displayAddress
	sw $t9, 8($t0)
	lw $t0, displayAddress
	sw $t9, 136($t0)
	lw $t0, displayAddress
	sw $t9, 264($t0)
	lw $t0, displayAddress
	sw $t9, 392($t0)
	lw $t0, displayAddress
	sw $t9, 520($t0)
	j display_end
draw_live2:
	lw $t9, red		# color red
	lw $t0, displayAddress
	sw $t9, 0($t0)
	
	lw $t0, displayAddress
	sw $t9, 4($t0)
	lw $t0, displayAddress
	sw $t9, 8($t0)
	lw $t0, displayAddress
	sw $t9, 136($t0)
	lw $t0, displayAddress
	sw $t9, 256($t0)
	lw $t0, displayAddress
	sw $t9, 260($t0)
	lw $t0, displayAddress
	sw $t9, 264($t0)
	lw $t0, displayAddress
	sw $t9, 384($t0)
	lw $t0, displayAddress
	sw $t9, 512($t0)
	lw $t0, displayAddress
	sw $t9, 516($t0)
	lw $t0, displayAddress
	sw $t9, 520($t0)
	j display_end
display_end:
	
score_display:
	lw $t1, score
	beq $t1, 1, draw_score1
	beq $t1, 2, draw_score2
	bge $t1, 3, draw_score3
	lw $t9, black
	lw $t0, displayAddress
	sw $t9, 116($t0)		# +116
	
	lw $t0, displayAddress
	sw $t9, 120($t0)
	lw $t0, displayAddress
	sw $t9, 124($t0)
	lw $t0, displayAddress
	sw $t9, 244($t0)
	lw $t0, displayAddress
	sw $t9, 252($t0)
	lw $t0, displayAddress
	sw $t9, 372($t0)
	lw $t0, displayAddress
	sw $t9, 380($t0)
	lw $t0, displayAddress
	sw $t9, 500($t0)
	lw $t0, displayAddress
	sw $t9, 508($t0)
	lw $t0, displayAddress
	sw $t9, 628($t0)
	lw $t0, displayAddress
	sw $t9, 632($t0)
	lw $t0, displayAddress
	sw $t9, 636($t0)
	j score_display_end
	
draw_score1:
	lw $t9, black
	lw $t0, displayAddress
	sw $t9, 120($t0)
	lw $t0, displayAddress
	sw $t9, 248($t0)
	lw $t0, displayAddress
	sw $t9, 376($t0)
	lw $t0, displayAddress
	sw $t9, 504($t0)
	lw $t0, displayAddress
	sw $t9, 632($t0)
	j score_display_end
	
draw_score2:
	lw $t9, black
	lw $t0, displayAddress
	sw $t9, 116($t0)
	
	lw $t0, displayAddress
	sw $t9, 120($t0)
	lw $t0, displayAddress
	sw $t9, 124($t0)
	lw $t0, displayAddress
	sw $t9, 252($t0)
	lw $t0, displayAddress
	sw $t9, 372($t0)
	lw $t0, displayAddress
	sw $t9, 376($t0)
	lw $t0, displayAddress
	sw $t9, 380($t0)
	lw $t0, displayAddress
	sw $t9, 500($t0)
	lw $t0, displayAddress
	sw $t9, 628($t0)
	lw $t0, displayAddress
	sw $t9, 632($t0)
	lw $t0, displayAddress
	sw $t9, 636($t0)
	j score_display_end
	
draw_score3:
	lw $t9, black
	lw $t0, displayAddress
	sw $t9, 116($t0)
	
	lw $t0, displayAddress
	sw $t9, 120($t0)
	lw $t0, displayAddress
	sw $t9, 124($t0)
	lw $t0, displayAddress
	sw $t9, 252($t0)
	lw $t0, displayAddress
	sw $t9, 376($t0)
	lw $t0, displayAddress
	sw $t9, 380($t0)
	lw $t0, displayAddress
	sw $t9, 508($t0)
	lw $t0, displayAddress
	sw $t9, 628($t0)
	lw $t0, displayAddress
	sw $t9, 632($t0)
	lw $t0, displayAddress
	sw $t9, 636($t0)
	
score_display_end:
	# Paint waterRow1
	add $s0, $zero, $zero
	addi $t5, $zero, 128 # num needed to get to the second row
	addi $t6, $zero, 8 # The desired row
	mult $t5, $t6
	mflo $t5   # The coordinate of the starting zone
	add $t4, $zero, $zero

paint_row1:
	beq $s0, 128, paint_row1_end
	lw $t9, waterRow1($t4)	# load the colour of the pixel stored in $t4 in the array
	lw $t0, displayAddress
	add $t0, $t0, $t5
	sw $t9, ($t0)
	
	addi $t5, $t5, 4
	addi $s0, $s0, 1
	addi $t4, $t4, 4
	j paint_row1
	
paint_row1_end:
	
	#Paint WaterRow2

	add $s0, $zero, $zero
	addi $t5, $zero, 128 # num needed to get to the second row
	addi $t6, $zero, 12 # The desired row
	mult $t5, $t6
	mflo $t5   # The coordinate of the starting zone
	add $t4, $zero, $zero
paint_row2:
	beq $s0, 128, paint_row2_end
	lw $t9, waterRow2($t4)	# load the colour of the pixel stored in $t4 in the array
	lw $t0, displayAddress
	add $t0, $t0, $t5
	sw $t9, ($t0)
	
	addi $t5, $t5, 4
	addi $s0, $s0, 1
	addi $t4, $t4, 4
	j paint_row2
	
paint_row2_end:
	
	#Paint RoadRow1

	add $s0, $zero, $zero
	addi $t5, $zero, 128 # num needed to get to the second row
	addi $t6, $zero, 20 # The desired row
	mult $t5, $t6
	mflo $t5   # The coordinate of the starting zone
	add $t4, $zero, $zero
paint_roadrow1:
	beq $s0, 128, paint_roadrow1_end
	lw $t9, roadRow1($t4)	# load the colour of the pixel stored in $t4 in the array
	lw $t0, displayAddress
	add $t0, $t0, $t5
	sw $t9, ($t0)
	
	addi $t5, $t5, 4
	addi $s0, $s0, 1
	addi $t4, $t4, 4
	j paint_roadrow1
	
paint_roadrow1_end:
	
	# Start painting roadrow2

	add $s0, $zero, $zero
	addi $t5, $zero, 128 # num needed to get to the second row
	addi $t6, $zero, 24 # The desired row
	mult $t5, $t6
	mflo $t5   # The coordinate of the starting zone
	add $t4, $zero, $zero
paint_roadrow2:
	beq $s0, 128, paint_roadrow2_end
	lw $t9, roadRow2($t4)	# load the colour of the pixel stored in $t4 in the array
	lw $t0, displayAddress
	add $t0, $t0, $t5
	sw $t9, ($t0)
	
	addi $t5, $t5, 4
	addi $s0, $s0, 1
	addi $t4, $t4, 4
	j paint_roadrow2
	
paint_roadrow2_end:
	
	
	
frog:
	# The top-right corner
	li $t1, 0xFF00FF  # The colour of the frog
	lw $t0, displayAddress
	lw $t4, frogX	# fetch the x-coord. of the frog
	lw $t5, frogY	# fetch the y-coord. of the frog
	addi $t7, $zero, 128  # num needed to second row
	addi $t8, $zero, 0 #  num of rows *** Change this to get the desired row
	mult $t7, $t8
	mflo $t7
	add $t5, $t5, $t7 
	addi $t4, $t4, 0 # how much of the frog moves along the x-axis *** Change
	add $t4, $t4, $t5 # add the x,y coord. and save it in $t4
	add $t0, $t0, $t4
	sw $t1, 0($t0)	

	
	# The top-left corner
	lw $t0, displayAddress
	lw $t4, frogX	# fetch the x-coord. of the frog
	lw $t5, frogY	# fetch the y-coord. of the frog
	addi $t7, $zero, 128  # num needed to second row
	addi $t8, $zero, 0 # num of rows *** Change this to get the desired row
	mult $t7, $t8
	mflo $t7
	add $t5, $t5, $t7 
	addi $t4, $t4, -12 # how much of the frog moves along the x-axis *** Change
	add $t4, $t4, $t5 # add the x,y coord. and save it in $t4 
	add $t0, $t0, $t4
	sw $t1, 0($t0)		

	# Frog body
	lw $t0, displayAddress
	lw $t4, frogX	# fetch the x-coord. of the frog
	lw $t5, frogY	# fetch the y-coord. of the frog
	addi $t7, $zero, 128  # num needed to second row
	addi $t8, $zero, 1 # num of rows *** Change this to get the desired row
	mult $t7, $t8
	mflo $t7
	add $t5, $t5, $t7 
	addi $t4, $t4, -8 # how much of the frog moves along the x-axis *** Change
	add $t4, $t4, $t5 # add the x,y coord. and save it in $t4 
	add $t0, $t0, $t4
	sw $t1, 0($t0)	
	
	lw $t0, displayAddress
	addi $t4, $t4, 4
	add $t0, $t0, $t4
	sw $t1, 0($t0)	
	
	lw $t0, displayAddress
	lw $t4, frogX	# fetch the x-coord. of the frog
	lw $t5, frogY	# fetch the y-coord. of the frog
	addi $t7, $zero, 128  # num needed to second row
	addi $t8, $zero, 2 # num of rows *** Change this to get the desired row
	mult $t7, $t8
	mflo $t7
	add $t5, $t5, $t7 
	addi $t4, $t4, -8 # how much of the frog moves along the x-axis *** Change
	add $t4, $t4, $t5 # add the x,y coord. and save it in $t4 
	add $t0, $t0, $t4
	sw $t1, 0($t0)	
	
	lw $t0, displayAddress
	addi $t4, $t4, 4
	add $t0, $t0, $t4
	sw $t1, 0($t0)	
	
	# Bottom legs of the frog
	lw $t0, displayAddress
	lw $t4, frogX	# fetch the x-coord. of the frog
	lw $t5, frogY	# fetch the y-coord. of the frog
	addi $t7, $zero, 128  # num needed to second row
	addi $t8, $zero, 3 # num of rows *** Change this to get the desired row
	mult $t7, $t8
	mflo $t7
	add $t5, $t5, $t7 
	addi $t4, $t4, -12 # how much of the frog moves along the x-axis *** Change
	add $t4, $t4, $t5 # add the x,y coord. and save it in $t4 
	add $t0, $t0, $t4
	sw $t1, 0($t0)	
	
	lw $t0, displayAddress
	addi $t4, $t4, 4
	add $t0, $t0, $t4
	sw $t1, 0($t0)	
	
	lw $t0, displayAddress
	addi $t4, $t4, 4
	add $t0, $t0, $t4
	sw $t1, 0($t0)	
	
	lw $t0, displayAddress
	addi $t4, $t4, 4
	add $t0, $t0, $t4
	sw $t1, 0($t0)	
	
	
check_goal:
	lw $t1, frogX
	lw $t2, frogY
	add $t3, $t1, $t2
	blt $t3, 1024, reach_goal
	
check_drown:		# frog is between {1024, 4096)
	bge $t3, 2560, check_collision
			# frog is between [1024, 2560)
	blt $t3, 1536, check_drown1
			# frog is between [1536, 2560)
	bge $t3, 2048, check_powerup	# frog is in safe zone
			# frog is between [1536, 2048)
	lw $t4, waterRow2($t1)
	beq $t4, 0x0000ff, reset_frog
	addi $t5, $t1, -4	# Check if the other side of the frog touches water
	lw $t4, waterRow2($t5)
	beq $t4, 0x0000ff, reset_frog
				# Frog is not touching the water, shifts left with the log
	addi $t1, $t1, -4
	ble $t1, 8, check_end
	sw $t1, frogX
	j check_end
	
check_powerup:		
	lw $t1, frogX
	lw $t2, frogY
	add $t3, $t1, $t2
	ble $t3, 2080, slow_down_speed
	j check_end
	
check_drown1: # frog is between	[1024, 1536)	Frog in waterRow1
	lw $t1, frogX
	lw $t2, frogY
	add $t3, $t1, $t2
	lw $t4, waterRow1($t1)
	beq $t4, 0x0000ff, reset_frog
	addi $t5, $t1, -4	# Check if the other side of the frog touches water
	lw $t4, waterRow1($t5)
	beq $t4, 0x0000ff, reset_frog
				# Frog is not touching the water, shifts left with the log
	addi $t1, $t1, 4
	bge $t1, 128, check_end
	sw $t1, frogX
	j check_end
	
	
check_collision:		# between 2560-3584
	lw $t1, frogX
	lw $t2, frogY	
	add $t3, $t1, $t2
	blt $t3, 2560, check_end
	bge $t3, 3584, check_end
				# We know frog is between [2560,3584)
	blt $t3, 3072, check_collision_row1
				# we know frog is between[3072,3584)
	addi $t5, $t1, -4
	lw $t4, roadRow2($t5)	# check if the frog is at vehicle's color
	beq $t4, 0xff0000, reset_frog
	
	j check_end

check_collision_row1:
	lw $t1, frogX
	lw $t2, frogY	
	add $t3, $t1, $t2
	lw $t4, roadRow1($t1)
	beq $t4, 0xff0000, reset_frog

	j check_end

check_end:


sleep:
	li $v0, 32
	lw $a0, speed
	syscall
	
	lw $t1, speed
	bgt $t1, 100, increase_speed
	

	
Update:	# To update arrays

	# Update waterRow1
		#shift right
	la $t1, waterRow1
	addi $s0, $zero, 120
	addi $t5, $zero, 124
	lw $t6, waterRow1($t5)
	addi $t5, $t5, 128
	lw $t7, waterRow1($t5)
	addi $t5, $t5, 128
	lw $t9, waterRow1($t5)
	addi $t5, $t5, 128
	lw $t9, waterRow1($t5)
update_waterRow1:				# For Arr[i+1]=Arr[i]
	beq $s0, -4, update_waterRow1End
	add $t4, $zero, $s0			# t4=120
	lw $t2, waterRow1($t4)
	addi $t4, $t4, 4
	sw $t2, waterRow1($t4)			#t4=124
	addi $t4, $t4, 124
	lw $t2, waterRow1($t4)			#load 248
	addi $t4, $t4, 4
	sw $t2, waterRow1($t4)
	addi $t4, $t4, 124
	lw $t2, waterRow1($t4)
	addi $t4, $t4, 4
	sw $t2, waterRow1($t4)
	addi $t4, $t4, 124
	lw $t2, waterRow1($t4)
	addi $t4, $t4, 4
	sw $t2, waterRow1($t4)
	

	addi $s0, $s0, -4
	addi $t4, $zero, 0
	j update_waterRow1
	
update_waterRow1End:
	addi $t5, $zero, 0
	sw $t6, waterRow1($t5)
	addi $t5, $t5, 128
	sw $t7, waterRow1($t5)
	addi $t5, $t5, 128
	sw $t9, waterRow1($t5)
	addi $t5, $t5, 128
	sw $t9, waterRow1($t5)
	
	# update waterRow2 
		# Shift left
	
	la $t1, waterRow2
	addi $s0, $zero, 4
	addi $t5, $zero, 0
	lw $t6, waterRow2($t5)
	addi $t5, $t5, 128
	lw $t7, waterRow2($t5)
	addi $t5, $t5, 128
	lw $t9, waterRow2($t5)
	addi $t5, $t5, 128
	lw $t9, waterRow2($t5)
update_waterRow2:				# For Arr[i+1]=Arr[i]
	beq $s0, 128, update_waterRow2End
	add $t4, $zero, $s0			# t4=120
	lw $t2, waterRow2($t4)
	addi $t4, $t4, -4
	sw $t2, waterRow2($t4)			#t4=124
	addi $t4, $t4, 132
	lw $t2, waterRow2($t4)			#load 248
	addi $t4, $t4, -4
	sw $t2, waterRow2($t4)
	addi $t4, $t4, 132
	lw $t2, waterRow2($t4)
	addi $t4, $t4, -4
	sw $t2, waterRow2($t4)
	addi $t4, $t4, 132
	lw $t2, waterRow2($t4)
	addi $t4, $t4, -4
	sw $t2, waterRow2($t4)
	
	addi $s0, $s0, 4
	addi $t4, $zero, 0
	j update_waterRow2
	
update_waterRow2End:
	addi $t5, $zero, 124
	sw $t6, waterRow2($t5)
	addi $t5, $t5, 128
	sw $t7, waterRow2($t5)
	addi $t5, $t5, 128
	sw $t9, waterRow2($t5)
	addi $t5, $t5, 128
	sw $t9, waterRow2($t5)
	
	
	# Update roadRow1
		#shift left
		
	la $t1, roadRow1
	addi $s0, $zero, 4
	addi $t5, $zero, 0
	lw $t6, roadRow1($t5)
	addi $t5, $t5, 128
	lw $t7, roadRow1($t5)
	addi $t5, $t5, 128
	lw $t9, roadRow1($t5)
	addi $t5, $t5, 128
	lw $t9, roadRow1($t5)
update_roadRow1:				# For Arr[i+1]=Arr[i]
	beq $s0, 128, update_roadRow1End
	add $t4, $zero, $s0			# t4=120
	lw $t2, roadRow1($t4)
	addi $t4, $t4, -4
	sw $t2, roadRow1($t4)			#t4=124
	addi $t4, $t4, 132
	lw $t2, roadRow1($t4)			#load 248
	addi $t4, $t4, -4
	sw $t2, roadRow1($t4)
	addi $t4, $t4, 132
	lw $t2, roadRow1($t4)
	addi $t4, $t4, -4
	sw $t2, roadRow1($t4)
	addi $t4, $t4, 132
	lw $t2, roadRow1($t4)
	addi $t4, $t4, -4
	sw $t2, roadRow1($t4)
	
	addi $s0, $s0, 4
	addi $t4, $zero, 0
	j update_roadRow1
	
update_roadRow1End:
	addi $t5, $zero, 124
	sw $t6, roadRow1($t5)
	addi $t5, $t5, 128
	sw $t7, roadRow1($t5)
	addi $t5, $t5, 128
	sw $t9, roadRow1($t5)
	addi $t5, $t5, 128
	sw $t9, roadRow1($t5)
	
	# Update roadRow1 again
		#shift left
		
	la $t1, roadRow1
	addi $s0, $zero, 4
	addi $t5, $zero, 0
	lw $t6, roadRow1($t5)
	addi $t5, $t5, 128
	lw $t7, roadRow1($t5)
	addi $t5, $t5, 128
	lw $t9, roadRow1($t5)
	addi $t5, $t5, 128
	lw $t9, roadRow1($t5)
update2_roadRow1:				# For Arr[i+1]=Arr[i]
	beq $s0, 128, update2_roadRow1End
	add $t4, $zero, $s0			# t4=120
	lw $t2, roadRow1($t4)
	addi $t4, $t4, -4
	sw $t2, roadRow1($t4)			#t4=124
	addi $t4, $t4, 132
	lw $t2, roadRow1($t4)			#load 248
	addi $t4, $t4, -4
	sw $t2, roadRow1($t4)
	addi $t4, $t4, 132
	lw $t2, roadRow1($t4)
	addi $t4, $t4, -4
	sw $t2, roadRow1($t4)
	addi $t4, $t4, 132
	lw $t2, roadRow1($t4)
	addi $t4, $t4, -4
	sw $t2, roadRow1($t4)
	
	addi $s0, $s0, 4
	addi $t4, $zero, 0
	j update2_roadRow1
	
update2_roadRow1End:
	addi $t5, $zero, 124
	sw $t6, roadRow1($t5)
	addi $t5, $t5, 128
	sw $t7, roadRow1($t5)
	addi $t5, $t5, 128
	sw $t9, roadRow1($t5)
	addi $t5, $t5, 128
	sw $t9, roadRow1($t5)
	
	# update roadRow2 
		# Shift right
	
	la $t1, roadRow2
	addi $s0, $zero, 120
	addi $t5, $zero, 124
	lw $t6, roadRow2($t5)
	addi $t5, $t5, 128
	lw $t7, roadRow2($t5)
	addi $t5, $t5, 128
	lw $t9, roadRow2($t5)
	addi $t5, $t5, 128
	lw $t9, roadRow2($t5)
update_roadRow2:				# For Arr[i+1]=Arr[i]
	beq $s0, -4, update_roadRow2End
	add $t4, $zero, $s0			# t4=120
	lw $t2, roadRow2($t4)
	addi $t4, $t4, 4
	sw $t2, roadRow2($t4)			#t4=124
	addi $t4, $t4, 124
	lw $t2, roadRow2($t4)			#load 248
	addi $t4, $t4, 4
	sw $t2, roadRow2($t4)
	addi $t4, $t4, 124
	lw $t2, roadRow2($t4)
	addi $t4, $t4, 4
	sw $t2, roadRow2($t4)
	addi $t4, $t4, 124
	lw $t2, roadRow2($t4)
	addi $t4, $t4, 4
	sw $t2, roadRow2($t4)
	

	addi $s0, $s0, -4
	addi $t4, $zero, 0
	j update_roadRow2
	
update_roadRow2End:
	addi $t5, $zero, 0
	sw $t6, roadRow2($t5)
	addi $t5, $t5, 128
	sw $t7, roadRow2($t5)
	addi $t5, $t5, 128
	sw $t9, roadRow2($t5)
	addi $t5, $t5, 128
	sw $t9, roadRow2($t5)

	j repaint
	
Exit:	
	li $v0, 10 # terminate the program gracefully
	syscall

increase_speed:
	lw $t1, speed
	addi $t1, $t1, -50
	sw $t1, speed
	j Update
	
slow_down_speed:
	lw $t0, slow_time_counter
	bge $t0, 4, check_end
	lw $t1, speed
	addi $t0, $t0, 1
	sw $t0, slow_time_counter		# counter +1
	addi $t1, $t1, 100		# slow speed by 100
	sw $t1, speed
	j Update
	
reset_frog:
	lw $t9, lives
	addi $t1, $zero, 60
	addi $t2, $zero, 3584
	addi $t7, $zero, 1000
	sw $t7, speed
	sw $t1, frogX
	sw $t2, frogY
	addi $t9, $t9, -1
	beq $t9, 0, game_over
	sw $t9, lives
	j repaint
	
reach_goal:
	addi $t1, $zero, 60
	addi $t2, $zero, 3584
	sw $t1, frogX
	sw $t2, frogY
	lw $t4, score
	addi $t4, $t4, 1
	sw $t4, score
	j repaint

game_over:

	add $s0, $zero, $zero
	add $t4, $zero, $zero
paint_game_over:
	beq $s0, 1024, paint_game_over_end
	lw $t9, game_over_screen($t4)	# load the colour of the pixel stored in $t4 in the array
	lw $t0, displayAddress
	add $t0, $t0, $t4
	sw $t9, ($t0)
	
	addi $s0, $s0, 1
	addi $t4, $t4, 4
	j paint_game_over
	
paint_game_over_end:
	lw $t8, 0xffff0000
	beq $t8, 1, restart
	j paint_game_over_end
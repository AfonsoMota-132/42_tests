# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    forbidden_functions.sh                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afogonca <afogonca@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/05 09:21:40 by afogonca          #+#    #+#              #
#    Updated: 2024/12/05 09:26:50 by afogonca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/bash

libft="malloc\|free\|write"

if [ "$1" = "libft.a" ]; then
	POSSIBLE="malloc\|free\|write"
elif [ "$1" = "libftprintf.a" ]; then
	POSSIBLE="$libft\|va_start\|va_arg\|va_copy\|va_end"
elif [ "$1" = "push_swap" ]; then
	POSSIBLE="exit\|free\|$libft"
fi


if [ $( nm $1 | grep "U" | grep -v "__" | \
	grep -v "ft" |awk '{print $2}' |\
	awk -F "@" '{print $1}' | grep -v $POSSIBLE | wc -l ) -ne 0 ]; then
	echo "ERROR"
	nm $1 | grep "U" | grep -v "__" | grep -v "ft" | awk '{print $2}' | \
		awk -F "@" '{print $1}' | grep -v $POSSIBLE
else
	echo "No forbidden functions"
fi


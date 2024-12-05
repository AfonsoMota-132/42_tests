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
libft="malloc"

if [ "$1" = "push_swap" ]; then
	POSSIBLE="exit\|free\|$libft"
fi

nm $1 -u | grep -v "__"\
	| awk '{print $2}' | awk -F "@" '{print $1}' | grep -v $POSSIBLE

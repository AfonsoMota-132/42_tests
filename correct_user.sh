# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    correct_user.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afogonca <afogonca@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/05 09:49:27 by afogonca          #+#    #+#              #
#    Updated: 2024/12/05 09:50:01 by afogonca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# !/bin/bash

files=$(find -name "*.c")

for file in $files; do
	sed -n -e 6p -e 8p -e 9p $file | grep -v  $USER
done

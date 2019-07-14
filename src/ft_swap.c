/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_swap.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rcoetzer <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/24 11:37:27 by rcoetzer          #+#    #+#             */
/*   Updated: 2019/06/24 11:41:05 by rcoetzer         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_swap(void *a, void *b)
{
	unsigned char	tmp;

	tmp = *(unsigned char *)a;
	*(unsigned char *)a = *(unsigned char *)b;
	*(unsigned char *)b = tmp;
}

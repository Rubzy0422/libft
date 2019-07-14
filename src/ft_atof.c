/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atof.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rcoetzer <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/20 14:20:02 by rcoetzer          #+#    #+#             */
/*   Updated: 2019/07/03 14:59:16 by rcoetzer         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static double	ft_sfrac(char *str)
{
	double		num;
	int			i;

	i = 0;
	num = 0.0;
	while (str[i] && ft_isdigit(str[i]))
		i++;
	num = ft_atoi(str);
	num /= ft_pow(10, i);
	return (num);
}

double			ft_atof(char *str)
{
	char		**sl;
	double		num;

	sl = NULL;
	num = 0.0;
	if (str)
	{
		if (ft_strchr(str, '.'))
		{
			sl = ft_strsplit(str, '.');
			num = (double)ft_atoi(sl[0]);
			num -= ft_sfrac(sl[1]);
			ft_freearr(sl);
		}
		else
			num = (double)ft_atoi(str);
	}
	return (num);
}

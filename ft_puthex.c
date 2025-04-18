/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_puthex.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/10 22:51:14 by nistanoj          #+#    #+#             */
/*   Updated: 2025/04/10 23:32:08 by nistanoj         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	ft_strlen(unsigned int n)
{
	int	len;

	len = 0;
	if (n == 0)
		return (1);
	while (n > 0)
	{
		n /= 16;
		len++;
	}
	return (len);
}

static void	ft_convert_hex(unsigned int n, char format)
{
	if (n >= 16)
	{
		ft_convert_hex(n / 16, format);
		ft_convert_hex(n % 16, format);
	}
	else
	{
		if (n < 10)
			ft_putchar(n + '0');
		else
		{
			if (format == 'x')
				ft_putchar(n - 10 + 'a');
			else
				ft_putchar(n - 10 + 'A');
		}
	}
}

int	ft_puthex(unsigned int c, char format)
{
	int	nb;

	nb = ft_strlen(c);
	if (c == 0)
	{
		ft_putchar('0');
		return (1);
	}
	ft_convert_hex(c, format);
	return (nb);
}

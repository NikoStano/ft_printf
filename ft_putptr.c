/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putptr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/10 21:53:17 by nistanoj          #+#    #+#             */
/*   Updated: 2025/04/11 01:17:56 by nistanoj         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	ft_hex_conv(unsigned long long num)
{
	int	nb;

	nb = 0;
	if (num >= 16)
		nb += ft_hex_conv(num / 16);
	if (num % 16 < 10)
		nb += ft_putchar((num % 16) + '0');
	else
		nb += ft_putchar((num % 16) - 10 + 'a');
	return (nb);
}

int	ft_putptr(unsigned long long ptr)
{
	int	nb;

	if (!ptr)
		return (ft_putstr("(nil)"));
	nb = 0;
	nb += ft_putstr("0x");
	if (ptr == 0)
		nb += ft_putchar('0');
	else
		nb += ft_hex_conv(ptr);
	return (nb);
}

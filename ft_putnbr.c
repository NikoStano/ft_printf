/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/10 20:40:54 by nistanoj          #+#    #+#             */
/*   Updated: 2025/04/11 01:21:29 by nistanoj         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_putnbr(int n)
{
	int		nb;

	nb = 0;
	if (n < 0)
	{
		nb += ft_putchar('-');
		n = -n;
	}
	if (n >= 10)
	{
		nb += ft_putnbr(n / 10);
		nb += ft_putchar((n % 10) + 48);
	}
	else
		nb += ft_putchar(n + 48);
	return (nb);
}

int	ft_put_unbr(unsigned int n)
{
	unsigned int	nb;

	nb = 0;
	if (n >= 10)
	{
		nb += ft_putnbr(n / 10);
		nb += ft_putchar((n % 10) + 48);
	}
	else
		nb += ft_putchar(n + 48);
	return (nb);
}

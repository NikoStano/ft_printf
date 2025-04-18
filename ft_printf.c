/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/10 03:09:43 by nistanoj          #+#    #+#             */
/*   Updated: 2025/04/12 14:03:59 by nistanoj         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	ft_find_format(char c, va_list args)
{
	int	print;

	print = 0;
	if (c == '%')
		print += ft_putchar('%');
	else if (c == 'c')
		print += ft_putchar(va_arg(args, int));
	else if (c == 's')
		print += ft_putstr(va_arg(args, char *));
	else if (c == 'd' || c == 'i')
		print += ft_putnbr(va_arg(args, int));
	else if (c == 'u')
		print += ft_put_unbr(va_arg(args, unsigned int));
	else if (c == 'p')
		print += ft_putptr(va_arg(args, unsigned long long));
	else if (c == 'x' || c == 'X')
		print += ft_puthex(va_arg(args, unsigned int), c);
	else
		print = -1;
	return (print);
}

int	ft_printf(const char *format, ...)
{
	va_list	args;
	int		i;
	int		str;

	va_start(args, format);
	i = 0;
	str = 0;
	while (format[i])
	{
		if (format[i] == '%' && format[i + 1])
		{
			i++;
			str += ft_find_format(format[i], args);
		}
		else
			str = str + ft_putchar(format[i]);
		i++;
	}
	va_end(args);
	return (str);
}

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/10 03:09:43 by nistanoj          #+#    #+#             */
/*   Updated: 2025/05/14 03:47:44 by nistanoj         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	ft_find_format(char c, va_list args)
{
	if (c == '%')
		return (ft_putchar('%'));
	else if (c == 'c')
		return (ft_putchar(va_arg(args, int)));
	else if (c == 's')
		return (ft_putstr(va_arg(args, char *)));
	else if (c == 'd' || c == 'i')
		return (ft_putnbr(va_arg(args, int)));
	else if (c == 'u')
		return (ft_put_unbr(va_arg(args, unsigned int)));
	else if (c == 'p')
		return (ft_putptr(va_arg(args, unsigned long long)));
	else if (c == 'x' || c == 'X')
		return (ft_puthex(va_arg(args, unsigned int), c));
	else
		return (-1);
}

static int	ft_parse_format(const char *format, va_list args)
{
	int	i;
	int	count;
	int	ret;

	i = 0;
	count = 0;
	while (format[i])
	{
		if (format[i] == '%')
		{
			if (!format[i + 1])
				return (-1);
			ret = ft_find_format(format[++i], args);
			if (ret == -1)
				return (-1);
			count += ret;
		}
		else
			count += ft_putchar(format[i]);
		i++;
	}
	return (count);
}

int	ft_printf(const char *format, ...)
{
	va_list	args;
	int		res;

	if (!format)
		return (-1);
	va_start(args, format);
	res = ft_parse_format(format, args);
	va_end(args);
	return (res);
}

// int	ft_printf(const char *format, ...)
// {
// 	va_list	args;
// 	int		i;
// 	int		str;

// 	if (!format)
// 		return (-1);
// 	va_start(args, format);
// 	i = 0;
// 	str = 0;
// 	while (format[i])
// 	{
// 		if (format[i] == '%' && format[i + 1])
// 		{
// 			i++;
// 			str += ft_find_format(format[i], args);
// 		}
// 		else
// 			str += ft_putchar(format[i]);
// 		i++;
// 	}
// 	va_end(args);
// 	return (str);
// }

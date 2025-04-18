/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putstr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/10 18:15:45 by nistanoj          #+#    #+#             */
/*   Updated: 2025/04/11 01:21:48 by nistanoj         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_putstr(char *s)
{
	int	i;
	int	len;

	if (!s)
		return (ft_putstr("(null)"));
	i = 0;
	len = 0;
	while (s[i])
	{
		len = len + ft_putchar(s[i]);
		i++;
	}
	return (len);
}

// int	main()
// {
// 	char	*str = "Salut !\n";
// 	int		len;

// 	len = ft_putstr(str);
// 	printf("len : %d", len);
// 	return (0);
// }
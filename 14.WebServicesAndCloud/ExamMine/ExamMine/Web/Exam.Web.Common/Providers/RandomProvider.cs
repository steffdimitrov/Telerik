﻿namespace Exam.Web.Common.Providers
{
    using System;
    using System.Text;

    public class RandomProvider : IRandomProvider
    {
        private const string Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        private static readonly Random random = new Random();


        public int GetRandomNumber(int min = 0, int max = int.MaxValue/2)
        {
            return random.Next(min, max + 1);
        }


        public double GetRandomFloat(double min, double max)
        {
            return Math.Round(min + (random.NextDouble()*(max - min)), 2);
        }

        public string GetRandomString(int minLength = 0, int maxLength = int.MaxValue/2)
        {
            var length = random.Next(minLength, maxLength);
            var result = new StringBuilder();
            for (var i = 0; i < length; i++)
            {
                var currenRandomSymbol = Alphabet[random.Next(0, Alphabet.Length)];
                result.Append(currenRandomSymbol);
            }

            return result.ToString();
        }

        public DateTime GetRandomDate(DateTime? after = null, DateTime? before = null)
        {
            var minDate = after ?? new DateTime(1999, 1, 1, 0, 0, 0);
            var maxDate = before ?? new DateTime(2050, 12, 31, 23, 59, 59);

            var seconds = GetRandomNumber(minDate.Second, maxDate.Second);
            var minutes = GetRandomNumber(minDate.Minute, maxDate.Minute);
            var hours = GetRandomNumber(minDate.Hour, maxDate.Hour);
            var day = GetRandomNumber(minDate.Day, maxDate.Day);
            var month = GetRandomNumber(minDate.Month, maxDate.Month);
            var year = GetRandomNumber(minDate.Year, maxDate.Year);

            if (day > 28)
            {
                day = 28;
            }

            return new DateTime(year, month, day, hours, minutes, seconds);
        }
    }
}
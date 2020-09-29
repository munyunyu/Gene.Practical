using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Gene.Practical.Extensions
{
    public static class ExtensionManager
    {
        /// <summary>
        /// Generate certicate with a datetime stamp
        /// </summary>
        /// <param name="date">Current date time</param>
        /// <returns></returns>
        public static string GenerateCertificate(this DateTime date)
        {
            Random rand = new Random();

            int num = rand.Next(0, 9);

            string A1 = MatchAlphaDictionary[num];
            string A2 = MatchAlphaDictionary[(9 - num)];

            int year = date.Year;
            int month = date.Month;
            int minute = date.Minute;
            int second = date.Second;

            string certificate = $"{A1}{A2}-{year}{month}-{minute}{second}{A2}";

            return certificate;

        }

        /// <summary>
        /// Dictionar for number 0-9 with the respective alpha codes
        /// </summary>
        public static Dictionary<int, string> MatchAlphaDictionary = new Dictionary<int, string>()
        {
            {0,"A" },
            {1,"B" },
            {2,"C" },
            {3,"D" },
            {4,"E" },
            {5,"F" },
            {6,"G" },
            {7,"H" },
            {8,"I" },
            {9,"J" }
        };
    }
}

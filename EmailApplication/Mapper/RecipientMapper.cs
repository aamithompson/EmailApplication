using System.Text.RegularExpressions;

namespace EmailApplication.Mapper {
    public static class RecipientMapper {
        public static List<string> Map(string s) {
            s = Regex.Replace(s, @"\s+", "");
            List<string> recipientsAddresses = s.Split(',').ToList();

            return recipientsAddresses;
        }
    }
}

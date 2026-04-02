using System.Text.RegularExpressions;

namespace EmailApplication.Mapper {
    public class RecipientMapper {
        public List<string> Map(string s) {
            s = Regex.Replace(s, @"\s+", "");
            List<string> recipientsAddresses = s.Split(',').ToList();

            return recipientsAddresses;
        }
    }
}

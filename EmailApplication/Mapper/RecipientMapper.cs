namespace EmailApplication.Mapper {
    public static class RecipientMapper {
        public List<string> Map(string s) {
            recipients = Regex.Replace(recipients, @"\s+", "");
            List<string> recipientsAddresses = recipients.Split(',').ToList();

            return recipientsAddresses;
        }
    }
}

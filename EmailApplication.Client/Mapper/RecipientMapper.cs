//==============================================================================
// Filename: RecipientMapper.cs
// Author: Aaron Thompson
// Date Created: 3/31/2026
// Last Updated: 3/31/2026
//
// Description: Translation of the whole string provided by the user in the
// recipients input text box to a list of strings for the application to process.
//==============================================================================
using System.Text.RegularExpressions;
//------------------------------------------------------------------------------
namespace EmailApplication.Client.Mapper {
    public static class RecipientMapper {
        public static List<string> Map(string s) {
            s = Regex.Replace(s, @"\s+", "");
            List<string> recipientsAddresses = s.Split(',').ToList();

            return recipientsAddresses;
        }
    }
} //END NAMESPACE EmailApplication.Client.Mapper
//==============================================================================
//==============================================================================
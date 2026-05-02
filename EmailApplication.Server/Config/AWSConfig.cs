//==============================================================================
// Filename: AWSConfig.cs
// Author: Aaron Thompson
// Date Created: 4/28/2026
// Last Updated: 4/28/2026
//
// Description: Handles reading the configuration file for AWS.
//==============================================================================
namespace EmailApplication.Server.Config {
    public class AWSConfig {

// VARIABLE(s)
//------------------------------------------------------------------------------
        public string Bucket { get; set; }
        public string Region { get; set; }
        public int PresignedUrlExpiryMinutes { get; set; }
    }
} //END NAMESPACE EmailApplication.Server.Config
//==============================================================================
//==============================================================================
//==============================================================================
// Filename: GetInboxDTO.cs
// Author: Aaron Thompson
// Date Created: 4/1/2026
// Last Updated: 4/9/2026
//
// Description: Data transfer object (DTO) for advanced queries/filters requested
// by the user to the server.
//==============================================================================
namespace EmailApplication.Shared {
    public class GetInboxDTO {

// VARIABLE(s)
//------------------------------------------------------------------------------
        // TODO: Filtering and querying properties
        // examples => EmailStatus? StatusFilter
        //          => bool? MarkedOnly
        //          => string SearchTerm
        public string query { get; set; }
    }
} //END NAMESPACE EmailApplication.Shared
//==============================================================================
//==============================================================================
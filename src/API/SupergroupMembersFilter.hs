-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SupergroupMembersFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SupergroupMembersFilter = 
 SupergroupMembersFilterRecent 
 | SupergroupMembersFilterContacts { query :: String }  
 | SupergroupMembersFilterAdministrators 
 | SupergroupMembersFilterSearch { query :: String }  
 | SupergroupMembersFilterRestricted { query :: String }  
 | SupergroupMembersFilterBanned { query :: String }  
 | SupergroupMembersFilterBots -- deriving (Show)

instance T.ToJSON SupergroupMembersFilter where
 toJSON (SupergroupMembersFilterRecent {  }) =
  A.object [ "@type" A..= T.String "supergroupMembersFilterRecent" ]

 toJSON (SupergroupMembersFilterContacts { query = query }) =
  A.object [ "@type" A..= T.String "supergroupMembersFilterContacts", "query" A..= query ]

 toJSON (SupergroupMembersFilterAdministrators {  }) =
  A.object [ "@type" A..= T.String "supergroupMembersFilterAdministrators" ]

 toJSON (SupergroupMembersFilterSearch { query = query }) =
  A.object [ "@type" A..= T.String "supergroupMembersFilterSearch", "query" A..= query ]

 toJSON (SupergroupMembersFilterRestricted { query = query }) =
  A.object [ "@type" A..= T.String "supergroupMembersFilterRestricted", "query" A..= query ]

 toJSON (SupergroupMembersFilterBanned { query = query }) =
  A.object [ "@type" A..= T.String "supergroupMembersFilterBanned", "query" A..= query ]

 toJSON (SupergroupMembersFilterBots {  }) =
  A.object [ "@type" A..= T.String "supergroupMembersFilterBots" ]
-- supergroupMembersFilterRecent SupergroupMembersFilter 

-- supergroupMembersFilterContacts SupergroupMembersFilter  { query :: String } 

-- supergroupMembersFilterAdministrators SupergroupMembersFilter 

-- supergroupMembersFilterSearch SupergroupMembersFilter  { query :: String } 

-- supergroupMembersFilterRestricted SupergroupMembersFilter  { query :: String } 

-- supergroupMembersFilterBanned SupergroupMembersFilter  { query :: String } 

-- supergroupMembersFilterBots SupergroupMembersFilter 


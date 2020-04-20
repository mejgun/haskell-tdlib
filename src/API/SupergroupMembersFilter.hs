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



instance T.FromJSON SupergroupMembersFilter where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "supergroupMembersFilterRecent" -> parseSupergroupMembersFilterRecent v
   "supergroupMembersFilterContacts" -> parseSupergroupMembersFilterContacts v
   "supergroupMembersFilterAdministrators" -> parseSupergroupMembersFilterAdministrators v
   "supergroupMembersFilterSearch" -> parseSupergroupMembersFilterSearch v
   "supergroupMembersFilterRestricted" -> parseSupergroupMembersFilterRestricted v
   "supergroupMembersFilterBanned" -> parseSupergroupMembersFilterBanned v
   "supergroupMembersFilterBots" -> parseSupergroupMembersFilterBots v
  where
   parseSupergroupMembersFilterRecent :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterRecent = A.withObject "SupergroupMembersFilterRecent" $ \o -> do
    return $ SupergroupMembersFilterRecent {  }

   parseSupergroupMembersFilterContacts :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterContacts = A.withObject "SupergroupMembersFilterContacts" $ \o -> do
    query <- o A..: "query"
    return $ SupergroupMembersFilterContacts { query = query }

   parseSupergroupMembersFilterAdministrators :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterAdministrators = A.withObject "SupergroupMembersFilterAdministrators" $ \o -> do
    return $ SupergroupMembersFilterAdministrators {  }

   parseSupergroupMembersFilterSearch :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterSearch = A.withObject "SupergroupMembersFilterSearch" $ \o -> do
    query <- o A..: "query"
    return $ SupergroupMembersFilterSearch { query = query }

   parseSupergroupMembersFilterRestricted :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterRestricted = A.withObject "SupergroupMembersFilterRestricted" $ \o -> do
    query <- o A..: "query"
    return $ SupergroupMembersFilterRestricted { query = query }

   parseSupergroupMembersFilterBanned :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterBanned = A.withObject "SupergroupMembersFilterBanned" $ \o -> do
    query <- o A..: "query"
    return $ SupergroupMembersFilterBanned { query = query }

   parseSupergroupMembersFilterBots :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterBots = A.withObject "SupergroupMembersFilterBots" $ \o -> do
    return $ SupergroupMembersFilterBots {  }
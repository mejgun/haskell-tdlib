-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SupergroupMembersFilter where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Specifies the kind of chat members to return in getSupergroupMembers
data SupergroupMembersFilter = 
 -- |
 -- 
 -- Returns recently active users in reverse chronological order
 SupergroupMembersFilterRecent |
 -- |
 -- 
 -- Returns contacts of the user, which are members of the supergroup or channel 
 -- 
 -- __query__ Query to search for
 SupergroupMembersFilterContacts { query :: Maybe String }  |
 -- |
 -- 
 -- Returns the owner and administrators
 SupergroupMembersFilterAdministrators |
 -- |
 -- 
 -- Used to search for supergroup or channel members via a (string) query 
 -- 
 -- __query__ Query to search for
 SupergroupMembersFilterSearch { query :: Maybe String }  |
 -- |
 -- 
 -- Returns restricted supergroup members; can be used only by administrators 
 -- 
 -- __query__ Query to search for
 SupergroupMembersFilterRestricted { query :: Maybe String }  |
 -- |
 -- 
 -- Returns users banned from the supergroup or channel; can be used only by administrators 
 -- 
 -- __query__ Query to search for
 SupergroupMembersFilterBanned { query :: Maybe String }  |
 -- |
 -- 
 -- Returns bot members of the supergroup or channel
 SupergroupMembersFilterBots deriving (Show, Eq)

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
   _ -> mempty
  where
   parseSupergroupMembersFilterRecent :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterRecent = A.withObject "SupergroupMembersFilterRecent" $ \o -> do
    return $ SupergroupMembersFilterRecent {  }

   parseSupergroupMembersFilterContacts :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterContacts = A.withObject "SupergroupMembersFilterContacts" $ \o -> do
    query <- o A..:? "query"
    return $ SupergroupMembersFilterContacts { query = query }

   parseSupergroupMembersFilterAdministrators :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterAdministrators = A.withObject "SupergroupMembersFilterAdministrators" $ \o -> do
    return $ SupergroupMembersFilterAdministrators {  }

   parseSupergroupMembersFilterSearch :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterSearch = A.withObject "SupergroupMembersFilterSearch" $ \o -> do
    query <- o A..:? "query"
    return $ SupergroupMembersFilterSearch { query = query }

   parseSupergroupMembersFilterRestricted :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterRestricted = A.withObject "SupergroupMembersFilterRestricted" $ \o -> do
    query <- o A..:? "query"
    return $ SupergroupMembersFilterRestricted { query = query }

   parseSupergroupMembersFilterBanned :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterBanned = A.withObject "SupergroupMembersFilterBanned" $ \o -> do
    query <- o A..:? "query"
    return $ SupergroupMembersFilterBanned { query = query }

   parseSupergroupMembersFilterBots :: A.Value -> T.Parser SupergroupMembersFilter
   parseSupergroupMembersFilterBots = A.withObject "SupergroupMembersFilterBots" $ \o -> do
    return $ SupergroupMembersFilterBots {  }
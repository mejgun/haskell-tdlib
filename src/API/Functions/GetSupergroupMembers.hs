-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroupMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SupergroupMembersFilter as SupergroupMembersFilter

--main = putStrLn "ok"

data GetSupergroupMembers = 
 GetSupergroupMembers { limit :: Int, offset :: Int, filter :: SupergroupMembersFilter.SupergroupMembersFilter, supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON GetSupergroupMembers where
 toJSON (GetSupergroupMembers { limit = limit, offset = offset, filter = filter, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "getSupergroupMembers", "limit" A..= limit, "offset" A..= offset, "filter" A..= filter, "supergroup_id" A..= supergroup_id ]
-- getSupergroupMembers GetSupergroupMembers  { limit :: Int, offset :: Int, filter :: SupergroupMembersFilter.SupergroupMembersFilter, supergroup_id :: Int } 


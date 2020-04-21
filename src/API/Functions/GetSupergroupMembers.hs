-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroupMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SupergroupMembersFilter as SupergroupMembersFilter

data GetSupergroupMembers = 
 GetSupergroupMembers { limit :: Int, offset :: Int, _filter :: SupergroupMembersFilter.SupergroupMembersFilter, supergroup_id :: Int }  deriving (Show)

instance T.ToJSON GetSupergroupMembers where
 toJSON (GetSupergroupMembers { limit = limit, offset = offset, _filter = _filter, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "getSupergroupMembers", "limit" A..= limit, "offset" A..= offset, "filter" A..= _filter, "supergroup_id" A..= supergroup_id ]

instance T.FromJSON GetSupergroupMembers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSupergroupMembers" -> parseGetSupergroupMembers v
   _ -> mempty
  where
   parseGetSupergroupMembers :: A.Value -> T.Parser GetSupergroupMembers
   parseGetSupergroupMembers = A.withObject "GetSupergroupMembers" $ \o -> do
    limit <- o A..: "limit"
    offset <- o A..: "offset"
    _filter <- o A..: "filter"
    supergroup_id <- o A..: "supergroup_id"
    return $ GetSupergroupMembers { limit = limit, offset = offset, _filter = _filter, supergroup_id = supergroup_id }
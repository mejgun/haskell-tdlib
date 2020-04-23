-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroupMembers where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SupergroupMembersFilter as SupergroupMembersFilter

data GetSupergroupMembers = 
 GetSupergroupMembers { limit :: Maybe Int, offset :: Maybe Int, _filter :: Maybe SupergroupMembersFilter.SupergroupMembersFilter, supergroup_id :: Maybe Int }  deriving (Show)

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
    limit <- optional $ o A..: "limit"
    offset <- optional $ o A..: "offset"
    _filter <- optional $ o A..: "filter"
    supergroup_id <- optional $ o A..: "supergroup_id"
    return $ GetSupergroupMembers { limit = limit, offset = offset, _filter = _filter, supergroup_id = supergroup_id }
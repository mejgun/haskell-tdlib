-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroupMembers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SupergroupMembersFilter as SupergroupMembersFilter

data GetSupergroupMembers = 
 GetSupergroupMembers { limit :: Maybe Int, offset :: Maybe Int, _filter :: Maybe SupergroupMembersFilter.SupergroupMembersFilter, supergroup_id :: Maybe Int }  deriving (Show, Eq)

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
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    _filter <- o A..:? "filter"
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetSupergroupMembers { limit = limit, offset = offset, _filter = _filter, supergroup_id = supergroup_id }
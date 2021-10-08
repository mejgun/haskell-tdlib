-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupergroupMembers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.SupergroupMembersFilter as SupergroupMembersFilter

-- |
-- 
-- Returns information about members or banned users in a supergroup or channel. Can be used only if supergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters 
-- 
-- __supergroup_id__ Identifier of the supergroup or channel
-- 
-- __filter__ The type of users to return; pass null to use supergroupMembersFilterRecent
-- 
-- __offset__ Number of users to skip
-- 
-- __limit__ The maximum number of users be returned; up to 200
data GetSupergroupMembers = 

 GetSupergroupMembers { limit :: Maybe Int, offset :: Maybe Int, _filter :: Maybe SupergroupMembersFilter.SupergroupMembersFilter, supergroup_id :: Maybe Int }  deriving (Eq)

instance Show GetSupergroupMembers where
 show GetSupergroupMembers { limit=limit, offset=offset, _filter=_filter, supergroup_id=supergroup_id } =
  "GetSupergroupMembers" ++ cc [p "limit" limit, p "offset" offset, p "_filter" _filter, p "supergroup_id" supergroup_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetSupergroupMembers where
 toJSON GetSupergroupMembers { limit = limit, offset = offset, _filter = _filter, supergroup_id = supergroup_id } =
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
 parseJSON _ = mempty

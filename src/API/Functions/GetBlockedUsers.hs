-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBlockedUsers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns users that were blocked by the current user 
-- 
-- __offset__ Number of users to skip in the result; must be non-negative
-- 
-- __limit__ The maximum number of users to return; up to 100
data GetBlockedUsers = 
 GetBlockedUsers { limit :: Maybe Int, offset :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetBlockedUsers where
 toJSON (GetBlockedUsers { limit = limit, offset = offset }) =
  A.object [ "@type" A..= T.String "getBlockedUsers", "limit" A..= limit, "offset" A..= offset ]

instance T.FromJSON GetBlockedUsers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getBlockedUsers" -> parseGetBlockedUsers v
   _ -> mempty
  where
   parseGetBlockedUsers :: A.Value -> T.Parser GetBlockedUsers
   parseGetBlockedUsers = A.withObject "GetBlockedUsers" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetBlockedUsers { limit = limit, offset = offset }
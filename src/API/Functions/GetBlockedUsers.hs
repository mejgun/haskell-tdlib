-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBlockedUsers where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetBlockedUsers = 
 GetBlockedUsers { limit :: Maybe Int, offset :: Maybe Int }  deriving (Show)

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
    limit <- optional $ o A..: "limit"
    offset <- optional $ o A..: "offset"
    return $ GetBlockedUsers { limit = limit, offset = offset }
-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGroupsInCommon where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetGroupsInCommon = 
 GetGroupsInCommon { limit :: Maybe Int, offset_chat_id :: Maybe Int, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetGroupsInCommon where
 toJSON (GetGroupsInCommon { limit = limit, offset_chat_id = offset_chat_id, user_id = user_id }) =
  A.object [ "@type" A..= T.String "getGroupsInCommon", "limit" A..= limit, "offset_chat_id" A..= offset_chat_id, "user_id" A..= user_id ]

instance T.FromJSON GetGroupsInCommon where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getGroupsInCommon" -> parseGetGroupsInCommon v
   _ -> mempty
  where
   parseGetGroupsInCommon :: A.Value -> T.Parser GetGroupsInCommon
   parseGetGroupsInCommon = A.withObject "GetGroupsInCommon" $ \o -> do
    limit <- optional $ o A..: "limit"
    offset_chat_id <- optional $ o A..: "offset_chat_id"
    user_id <- optional $ o A..: "user_id"
    return $ GetGroupsInCommon { limit = limit, offset_chat_id = offset_chat_id, user_id = user_id }
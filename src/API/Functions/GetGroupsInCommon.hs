-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGroupsInCommon where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns a list of common group chats with a given user. Chats are sorted by their type and creation date 
-- 
-- __user_id__ User identifier
-- 
-- __offset_chat_id__ Chat identifier starting from which to return chats; use 0 for the first request
-- 
-- __limit__ The maximum number of chats to be returned; up to 100
data GetGroupsInCommon = 

 GetGroupsInCommon { limit :: Maybe Int, offset_chat_id :: Maybe Int, user_id :: Maybe Int }  deriving (Eq)

instance Show GetGroupsInCommon where
 show GetGroupsInCommon { limit=limit, offset_chat_id=offset_chat_id, user_id=user_id } =
  "GetGroupsInCommon" ++ U.cc [U.p "limit" limit, U.p "offset_chat_id" offset_chat_id, U.p "user_id" user_id ]

instance T.ToJSON GetGroupsInCommon where
 toJSON GetGroupsInCommon { limit = limit, offset_chat_id = offset_chat_id, user_id = user_id } =
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
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset_chat_id <- mconcat [ o A..:? "offset_chat_id", readMaybe <$> (o A..: "offset_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetGroupsInCommon { limit = limit, offset_chat_id = offset_chat_id, user_id = user_id }
 parseJSON _ = mempty

-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGroupsInCommon where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetGroupsInCommon = 
 GetGroupsInCommon { limit :: Int, offset_chat_id :: Int, user_id :: Int }  deriving (Show)

instance T.ToJSON GetGroupsInCommon where
 toJSON (GetGroupsInCommon { limit = limit, offset_chat_id = offset_chat_id, user_id = user_id }) =
  A.object [ "@type" A..= T.String "getGroupsInCommon", "limit" A..= limit, "offset_chat_id" A..= offset_chat_id, "user_id" A..= user_id ]



instance T.FromJSON GetGroupsInCommon where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getGroupsInCommon" -> parseGetGroupsInCommon v

   _ -> mempty ""
  where
   parseGetGroupsInCommon :: A.Value -> T.Parser GetGroupsInCommon
   parseGetGroupsInCommon = A.withObject "GetGroupsInCommon" $ \o -> do
    limit <- o A..: "limit"
    offset_chat_id <- o A..: "offset_chat_id"
    user_id <- o A..: "user_id"
    return $ GetGroupsInCommon { limit = limit, offset_chat_id = offset_chat_id, user_id = user_id }
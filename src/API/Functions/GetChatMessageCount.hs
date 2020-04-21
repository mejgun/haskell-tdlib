-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMessageCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

--main = putStrLn "ok"

data GetChatMessageCount = 
 GetChatMessageCount { return_local :: Bool, _filter :: SearchMessagesFilter.SearchMessagesFilter, chat_id :: Int }  deriving (Show)

instance T.ToJSON GetChatMessageCount where
 toJSON (GetChatMessageCount { return_local = return_local, _filter = _filter, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatMessageCount", "return_local" A..= return_local, "filter" A..= _filter, "chat_id" A..= chat_id ]



instance T.FromJSON GetChatMessageCount where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatMessageCount" -> parseGetChatMessageCount v

   _ -> mempty ""
  where
   parseGetChatMessageCount :: A.Value -> T.Parser GetChatMessageCount
   parseGetChatMessageCount = A.withObject "GetChatMessageCount" $ \o -> do
    return_local <- o A..: "return_local"
    _filter <- o A..: "filter"
    chat_id <- o A..: "chat_id"
    return $ GetChatMessageCount { return_local = return_local, _filter = _filter, chat_id = chat_id }
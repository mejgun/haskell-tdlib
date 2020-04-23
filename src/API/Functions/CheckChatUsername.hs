-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckChatUsername where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CheckChatUsername = 
 CheckChatUsername { username :: Maybe String, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON CheckChatUsername where
 toJSON (CheckChatUsername { username = username, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "checkChatUsername", "username" A..= username, "chat_id" A..= chat_id ]

instance T.FromJSON CheckChatUsername where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkChatUsername" -> parseCheckChatUsername v
   _ -> mempty
  where
   parseCheckChatUsername :: A.Value -> T.Parser CheckChatUsername
   parseCheckChatUsername = A.withObject "CheckChatUsername" $ \o -> do
    username <- optional $ o A..: "username"
    chat_id <- optional $ o A..: "chat_id"
    return $ CheckChatUsername { username = username, chat_id = chat_id }
-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Chats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Chats = 
 Chats { chat_ids :: Maybe [Int] }  deriving (Show, Eq)

instance T.ToJSON Chats where
 toJSON (Chats { chat_ids = chat_ids }) =
  A.object [ "@type" A..= T.String "chats", "chat_ids" A..= chat_ids ]

instance T.FromJSON Chats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chats" -> parseChats v
   _ -> mempty
  where
   parseChats :: A.Value -> T.Parser Chats
   parseChats = A.withObject "Chats" $ \o -> do
    chat_ids <- o A..:? "chat_ids"
    return $ Chats { chat_ids = chat_ids }
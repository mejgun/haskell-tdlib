-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReadAllChatMentions where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ReadAllChatMentions = 
 ReadAllChatMentions { chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON ReadAllChatMentions where
 toJSON (ReadAllChatMentions { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "readAllChatMentions", "chat_id" A..= chat_id ]

instance T.FromJSON ReadAllChatMentions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "readAllChatMentions" -> parseReadAllChatMentions v
   _ -> mempty
  where
   parseReadAllChatMentions :: A.Value -> T.Parser ReadAllChatMentions
   parseReadAllChatMentions = A.withObject "ReadAllChatMentions" $ \o -> do
    chat_id <- optional $ o A..: "chat_id"
    return $ ReadAllChatMentions { chat_id = chat_id }
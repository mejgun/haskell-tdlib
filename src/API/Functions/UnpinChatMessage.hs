-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UnpinChatMessage where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data UnpinChatMessage = 
 UnpinChatMessage { chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON UnpinChatMessage where
 toJSON (UnpinChatMessage { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "unpinChatMessage", "chat_id" A..= chat_id ]

instance T.FromJSON UnpinChatMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "unpinChatMessage" -> parseUnpinChatMessage v
   _ -> mempty
  where
   parseUnpinChatMessage :: A.Value -> T.Parser UnpinChatMessage
   parseUnpinChatMessage = A.withObject "UnpinChatMessage" $ \o -> do
    chat_id <- optional $ o A..: "chat_id"
    return $ UnpinChatMessage { chat_id = chat_id }
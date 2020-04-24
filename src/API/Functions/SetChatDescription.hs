-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDescription where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetChatDescription = 
 SetChatDescription { description :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatDescription where
 toJSON (SetChatDescription { description = description, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatDescription", "description" A..= description, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatDescription where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatDescription" -> parseSetChatDescription v
   _ -> mempty
  where
   parseSetChatDescription :: A.Value -> T.Parser SetChatDescription
   parseSetChatDescription = A.withObject "SetChatDescription" $ \o -> do
    description <- optional $ o A..: "description"
    chat_id <- optional $ o A..: "chat_id"
    return $ SetChatDescription { description = description, chat_id = chat_id }
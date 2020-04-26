-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatClientData where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes client data associated with a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __client_data__ New value of client_data
data SetChatClientData = 
 SetChatClientData { client_data :: Maybe String, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatClientData where
 toJSON (SetChatClientData { client_data = client_data, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatClientData", "client_data" A..= client_data, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatClientData where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatClientData" -> parseSetChatClientData v
   _ -> mempty
  where
   parseSetChatClientData :: A.Value -> T.Parser SetChatClientData
   parseSetChatClientData = A.withObject "SetChatClientData" $ \o -> do
    client_data <- o A..:? "client_data"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatClientData { client_data = client_data, chat_id = chat_id }
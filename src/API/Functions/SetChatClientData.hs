-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatClientData where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetChatClientData = 
 SetChatClientData { client_data :: String, chat_id :: Int }  deriving (Show)

instance T.ToJSON SetChatClientData where
 toJSON (SetChatClientData { client_data = client_data, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatClientData", "client_data" A..= client_data, "chat_id" A..= chat_id ]



instance T.FromJSON SetChatClientData where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatClientData" -> parseSetChatClientData v

   _ -> mempty ""
  where
   parseSetChatClientData :: A.Value -> T.Parser SetChatClientData
   parseSetChatClientData = A.withObject "SetChatClientData" $ \o -> do
    client_data <- o A..: "client_data"
    chat_id <- o A..: "chat_id"
    return $ SetChatClientData { client_data = client_data, chat_id = chat_id }
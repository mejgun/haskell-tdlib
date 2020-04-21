-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSecretChat = 
 GetSecretChat { secret_chat_id :: Int }  deriving (Show)

instance T.ToJSON GetSecretChat where
 toJSON (GetSecretChat { secret_chat_id = secret_chat_id }) =
  A.object [ "@type" A..= T.String "getSecretChat", "secret_chat_id" A..= secret_chat_id ]



instance T.FromJSON GetSecretChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSecretChat" -> parseGetSecretChat v

   _ -> mempty ""
  where
   parseGetSecretChat :: A.Value -> T.Parser GetSecretChat
   parseGetSecretChat = A.withObject "GetSecretChat" $ \o -> do
    secret_chat_id <- o A..: "secret_chat_id"
    return $ GetSecretChat { secret_chat_id = secret_chat_id }
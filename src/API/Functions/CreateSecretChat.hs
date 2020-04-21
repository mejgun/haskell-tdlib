-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CreateSecretChat = 
 CreateSecretChat { secret_chat_id :: Int }  deriving (Show)

instance T.ToJSON CreateSecretChat where
 toJSON (CreateSecretChat { secret_chat_id = secret_chat_id }) =
  A.object [ "@type" A..= T.String "createSecretChat", "secret_chat_id" A..= secret_chat_id ]

instance T.FromJSON CreateSecretChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createSecretChat" -> parseCreateSecretChat v
   _ -> mempty
  where
   parseCreateSecretChat :: A.Value -> T.Parser CreateSecretChat
   parseCreateSecretChat = A.withObject "CreateSecretChat" $ \o -> do
    secret_chat_id <- o A..: "secret_chat_id"
    return $ CreateSecretChat { secret_chat_id = secret_chat_id }
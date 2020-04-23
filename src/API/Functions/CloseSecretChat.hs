-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CloseSecretChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CloseSecretChat = 
 CloseSecretChat { secret_chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON CloseSecretChat where
 toJSON (CloseSecretChat { secret_chat_id = secret_chat_id }) =
  A.object [ "@type" A..= T.String "closeSecretChat", "secret_chat_id" A..= secret_chat_id ]

instance T.FromJSON CloseSecretChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "closeSecretChat" -> parseCloseSecretChat v
   _ -> mempty
  where
   parseCloseSecretChat :: A.Value -> T.Parser CloseSecretChat
   parseCloseSecretChat = A.withObject "CloseSecretChat" $ \o -> do
    secret_chat_id <- optional $ o A..: "secret_chat_id"
    return $ CloseSecretChat { secret_chat_id = secret_chat_id }
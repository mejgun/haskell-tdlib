-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CloseSecretChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Closes a secret chat, effectively transferring its state to secretChatStateClosed 
-- 
-- __secret_chat_id__ Secret chat identifier
data CloseSecretChat = 
 CloseSecretChat { secret_chat_id :: Maybe Int }  deriving (Show, Eq)

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
    secret_chat_id <- mconcat [ o A..:? "secret_chat_id", readMaybe <$> (o A..: "secret_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CloseSecretChat { secret_chat_id = secret_chat_id }
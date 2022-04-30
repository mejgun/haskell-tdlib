-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateSecretChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns an existing chat corresponding to a known secret chat 
-- 
-- __secret_chat_id__ Secret chat identifier
data CreateSecretChat = 

 CreateSecretChat { secret_chat_id :: Maybe Int }  deriving (Eq)

instance Show CreateSecretChat where
 show CreateSecretChat { secret_chat_id=secret_chat_id } =
  "CreateSecretChat" ++ U.cc [U.p "secret_chat_id" secret_chat_id ]

instance T.ToJSON CreateSecretChat where
 toJSON CreateSecretChat { secret_chat_id = secret_chat_id } =
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
    secret_chat_id <- mconcat [ o A..:? "secret_chat_id", readMaybe <$> (o A..: "secret_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateSecretChat { secret_chat_id = secret_chat_id }
 parseJSON _ = mempty

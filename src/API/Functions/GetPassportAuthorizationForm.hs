-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPassportAuthorizationForm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPassportAuthorizationForm = 
 GetPassportAuthorizationForm { nonce :: Maybe String, public_key :: Maybe String, scope :: Maybe String, bot_user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetPassportAuthorizationForm where
 toJSON (GetPassportAuthorizationForm { nonce = nonce, public_key = public_key, scope = scope, bot_user_id = bot_user_id }) =
  A.object [ "@type" A..= T.String "getPassportAuthorizationForm", "nonce" A..= nonce, "public_key" A..= public_key, "scope" A..= scope, "bot_user_id" A..= bot_user_id ]

instance T.FromJSON GetPassportAuthorizationForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPassportAuthorizationForm" -> parseGetPassportAuthorizationForm v
   _ -> mempty
  where
   parseGetPassportAuthorizationForm :: A.Value -> T.Parser GetPassportAuthorizationForm
   parseGetPassportAuthorizationForm = A.withObject "GetPassportAuthorizationForm" $ \o -> do
    nonce <- o A..:? "nonce"
    public_key <- o A..:? "public_key"
    scope <- o A..:? "scope"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetPassportAuthorizationForm { nonce = nonce, public_key = public_key, scope = scope, bot_user_id = bot_user_id }
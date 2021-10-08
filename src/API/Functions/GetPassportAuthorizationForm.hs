-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPassportAuthorizationForm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a Telegram Passport authorization form for sharing data with a service 
-- 
-- __bot_user_id__ User identifier of the service's bot
-- 
-- __scope__ Telegram Passport element types requested by the service
-- 
-- __public_key__ Service's public key
-- 
-- __nonce__ Unique request identifier provided by the service
data GetPassportAuthorizationForm = 

 GetPassportAuthorizationForm { nonce :: Maybe String, public_key :: Maybe String, scope :: Maybe String, bot_user_id :: Maybe Int }  deriving (Eq)

instance Show GetPassportAuthorizationForm where
 show GetPassportAuthorizationForm { nonce=nonce, public_key=public_key, scope=scope, bot_user_id=bot_user_id } =
  "GetPassportAuthorizationForm" ++ cc [p "nonce" nonce, p "public_key" public_key, p "scope" scope, p "bot_user_id" bot_user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetPassportAuthorizationForm where
 toJSON GetPassportAuthorizationForm { nonce = nonce, public_key = public_key, scope = scope, bot_user_id = bot_user_id } =
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
 parseJSON _ = mempty
